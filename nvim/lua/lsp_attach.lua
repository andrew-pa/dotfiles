
return function(client, bufnr)
    local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap = true, silent = true }

    require('goto-preview').setup {}
    keymap('n', 'gd', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
    keymap('n', 'gi', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)

    keymap('n', 'gD', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    keymap('n', 'ggd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

    require('lsp_signature').on_attach {
        hint_enable = false
    }
end
