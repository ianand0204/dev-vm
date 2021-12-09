local lspconfig = require 'lspconfig'

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = {noremap = true, silent = true}
    buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
                   opts)
    buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
                   opts)
    buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gi',
                   '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<C-k>',
                   '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>wa',
                   '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>wr',
                   '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>wl',
                   '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
                   opts)
    buf_set_keymap(bufnr, 'n', '<leader>D',
                   '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>rn',
                   '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
                   opts)
    buf_set_keymap(bufnr, 'n', '<leader>ca',
                   '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    -- buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<leader>e',
                   '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
                   opts)
    buf_set_keymap(bufnr, 'n', '[d',
                   '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap(bufnr, 'n', ']d',
                   '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap(bufnr, 'n', '<space>q',
                   '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap(bugnr, 'n', "<space>f",
                   "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

end

local on_attach = function(client) require'completion'.on_attach(client) end

local opts = {
    tools = {
        autoSetHints = true,
        hover_with_actions = true,
        inlay_hints = {only_current_line = false}
    },
    server = {
        on_attach = on_attach,
        ["rust_analyzer"] = {checkOnSave = {command = "cargo-clippy"}}
    }
}

require('rust-tools').setup(opts)
-- lsp_signature.setup({opts.lsp_signature})
