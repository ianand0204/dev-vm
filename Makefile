VMADDR ?= unset
VMPORT ?= 22
VMUSER ?= ian

VMBLOCKDEVICE ?= sda

MAKEFILE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
MODULES := vmw_balloon vmw_pvscsi vsock vmw_vsock_vmci_transport vmwgfx
HOOKS := base udev autodetect keyboard keymap consolefont modconf block filesystems fsck

#$(info $$MAKEFILEDIR is  [${MAKEFILE_DIR}])

VMNAME ?= vm-intel

SSH_OPTIONS=-o PubkeyAuthentication=no -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no

# copy our secrets into the VM
vm/secrets:
	# GPG keyring
	rsync -av -e 'ssh $(SSH_OPTIONS)' \
		--exclude='.#*' \
		--exclude='S.*' \
		--exclude='*.conf' \
		$(HOME)/.gnupg/ $(NIXUSER)@$(NIXADDR):~/.gnupg
	# SSH keys
	rsync -av -e 'ssh $(SSH_OPTIONS)' \
		--exclude='environment' \
		$(HOME)/.ssh/ $(NIXUSER)@$(NIXADDR):~/.ssh

vm/bootstrap0:
	ssh $(SSH_OPTIONS) -p$(VMPORT) root@$(VMADDR) " \
		parted /dev/$(VMBLOCKDEVICE) -- mklabel gpt; \
		parted /dev/$(VMBLOCKDEVICE) -- mkpart primary 512MiB -8GiB; \
		parted /dev/$(VMBLOCKDEVICE) -- mkpart primary linux-swap -8GiB 100\%; \
		parted /dev/$(VMBLOCKDEVICE) -- mkpart ESP fat32 1MiB 512MiB; \
		parted /dev/$(VMBLOCKDEVICE) -- set 3 esp on; \
		mkfs.ext4 -L arch /dev/$(VMBLOCKDEVICE)1; \
		mkswap -L swap /dev/$(VMBLOCKDEVICE)2; \
		mkfs.fat -F 32 -n boot /dev/$(VMBLOCKDEVICE)3; \
		mount /dev/disk/by-label/arch /mnt; \
		mkdir -p /mnt/boot; \
		mount /dev/disk/by-label/boot /mnt/boot; \
		pacstrap /mnt sudo grub efibootmgr linux linux-lts base base-devel linux-firmware ansible openssh rsync neovim; \
		genfstab -U /mnt >> /mnt/etc/fstab; \
		ln -sf /mnt/usr/share/zoneinfo/America/Los_Angeles /mnt/etc/localtime; \
		sed -i 's/#en.US-UTF8 UTF-8/en.US-UTF8 UTF-8/' /mnt/etc/locale.gen; \
		arch-chroot /mnt local-gen; \
		echo "LANG=en_US.UTF-8" > /mnt/etc/locale.conf; \
		echo $(VMNAME) > /mnt/etc/hostname; \
		sed -i 's/MODULES=()/MODULES=($(MODULES))/' /mnt/etc/mkinitcpio.conf; \
		sed -i 's/HOOKS=()/HOOKS=($(HOOKS))/' /mnt/etc/mkinitcpio.conf; \
		sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /mnt/etc/ssh/sshd_config; \
		arch-chroot /mnt mkinitcpio -P; \
		arch-chroot /mnt grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB; \
		arch-chroot /mnt grub-mkconfig -o /boot/grub/grub.cfg; \
		arch-chroot /mnt systemctl enable systemd-networkd; \
		arch-chroot /mnt systemctl enable systemd-resolved; \
		arch-chroot /mnt systemctl enable sshd; \
		cp -f /etc/systemd/network/20-* /mnt/etc/systemd/network; \
		echo "root:root" | chpasswd -R /mnt; \
	"

vm/bootstrap:
	VMUSER=root $(MAKE) vm/copy
	VMUSER=root $(MAKE) vm/ansible/stage0
	ssh $(SSH_OPTIONS) -p$(VMPORT) $(VMUSER)@$(VMADDR) " \
		sudo reboot; \
	"

# copy the Nix configurations into the VM.
vm/copy:
	rsync -av -e 'ssh $(SSH_OPTIONS) -p$(VMPORT)' \
		--exclude='.git/' \
		--exclude='.git-crypt/' \
		--rsync-path="sudo rsync" \
		$(MAKEFILE_DIR)/ $(VMUSER)@$(VMADDR):/dotfiles;" \
	"

vm/ansible/stage0:
	ssh $(SSH_OPTIONS) -p$(VMPORT) root@$(VMADDR) " \
		cd /dotfiles; \
		ansible-galaxy install -r requirements.yml; \
		ansible-playbook -i hosts main.yaml --tags stage0 --ask-vault-password; \
	"

ansible:
	ansible-galaxy install -r requirements.yml;
	ansible-playbook -i hosts main.yaml --skip-tags stage0;
