
return function(client, bufnr)
    local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap = true, silent = false }

    require('goto-preview').setup {}
    keymap('n', 'gd', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
    keymap('n', 'gi', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)

    keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    keymap('n', '<Leader>t', '<cmd>lua vim.lsp.type_definition()<CR>', opts)
    keymap('n', 'gD', '<cmd>Telescope lsp_definitions<CR>', opts)
    keymap('n', 'ggd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap('n', 'gI', '<cmd>Telescope lsp_implementations<CR>', opts)
    keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
    keymap('n', '<Leader>s', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', opts)
    keymap('n', '<Leader>o', '<cmd>Telescope lsp_document_symbols<CR>', opts)
    keymap('n', '<Leader>r', '<cmd>Telescope lsp_code_actions<CR>', opts)
    keymap('n', '<Leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    keymap('n', '<Leader>n', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    keymap('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

    require('lsp_signature').on_attach {
        hint_enable = false,
        extra_trigger_chars = {"{"}
    }
end
