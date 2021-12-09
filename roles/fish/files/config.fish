
# Prompt
#-------------------------------------------------------------------------------
# Do not show any greeting
set --universal --erase fish_greeting
function fish_greeting; end
funcsave fish_greeting

# bobthefish theme
set -g theme_color_scheme dracula

# My color scheme
set -U fish_color_normal normal
set -U fish_color_command F8F8F2
set -U fish_color_quote F1FA8C
set -U fish_color_redirection 8BE9FD
set -U fish_color_end 50FA7B
set -U fish_color_error FF5555
set -U fish_color_param 5FFFFF
set -U fish_color_comment 6272A4
set -U fish_color_match --background=brblue
set -U fish_color_selection white --bold --background=brblack
set -U fish_color_search_match bryellow --background=brblack
set -U fish_color_history_current --bold
set -U fish_color_operator 00a6b2
set -U fish_color_escape 00a6b2
set -U fish_color_cwd green
set -U fish_color_cwd_root red
set -U fish_color_valid_path --underline
set -U fish_color_autosuggestion BD93F9
set -U fish_color_user brgreen
set -U fish_color_host normal
set -U fish_color_cancel -r
set -U fish_pager_color_completion normal
set -U fish_pager_color_description B3A06D yellow
set -U fish_pager_color_prefix white --bold --underline
set -U fish_pager_color_progress brwhite --background=cyan

set LANG "en_US.UTF-8"
set LC_CTYPE "en_US.UTF-8"
set LC_ALL "en_US.UTF-8"
set EDITOR "nvim"
set PAGER "less -FirSwX"
set MANPAGER "less -FirSwX"
fish_add_path --path /home/ian/.yarn/bin
fish_add_path --path /home/ian/.cargo/bin
fish_add_path --path /home/ian/.local/bin

#export PATH=$PATH:~/yarn/bin
export TZ=/usr/share/zoneinfo/America/Los_Angeles
source ~/.aliases

if test -f /usr/share/autojump/autojump.fish;
    source /usr/share/autojump/autojump.fish;
end

set -g theme_powerline_fonts yes
set -g theme_nerd_fonts no

function export --description 'Set env variable. Alias for `set -gx` for bash compatibility.'
end

set -gx TERMINAL kitty
if test -z $DISPLAY
	set -gx PINENTRY_USER_DATA type:curses
else
	set -gx PINENTRY_USER_DATA type:rofi
end

alias ssh="kitty +kitten ssh"
alias mbsync="mbsync -c ~/.config/isync/mbsyncrc"
