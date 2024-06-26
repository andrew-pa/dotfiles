
return function(client, bufnr)
    if client == nil or bufnr == nil then
        return
    end

    print("attach", client.name, bufnr)
    local function keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    local opts = { noremap = true, silent = false }

    keymap('n', 'gd', "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", opts)
    keymap('n', 'gi', "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", opts)

    keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    keymap('n', '<Leader>t', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    keymap('n', 'gD', '<cmd>Telescope lsp_definitions<CR>', opts)
    keymap('n', 'ggd', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    keymap('n', 'gI', '<cmd>Telescope lsp_implementations<CR>', opts)
    keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
    keymap('n', '<Leader>s', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>', opts)
    keymap('n', '<Leader>c', '<cmd>Telescope lsp_document_symbols<CR>', opts)
    keymap('n', '<Leader>y', '<cmd>Telescope lsp_incoming_calls<CR>', opts)
    keymap('n', '<Leader>Y', '<cmd>Telescope lsp_outgoing_calls<CR>', opts)
    keymap('n', '<Leader>r', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    keymap('n', '<Leader>R', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
    keymap('n', '<Leader>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    keymap('n', '<Leader>n', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
    keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
    keymap('n', '<Leader>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

    if client.name == "clangd" then
        keymap('n', '<Leader>t', '<cmd>ClangdSwitchSourceHeader<CR>', opts)
        keymap('n', '<Leader>T', '<C-w>v<C-w>l<cmd>ClangdSwitchSourceHeader<CR>', opts)
    end

    -- require('lsp_signature').on_attach({
        -- hint_enable = false,
        -- extra_trigger_chars = {"{"},
        -- toggle_key = '<C-q>',
        -- select_signature_key = '<C-e>',
        -- close_timeout = 500
    -- }, bufnr)
end
