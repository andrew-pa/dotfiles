
return function()
    local function keymap(...) vim.api.nvim_set_keymap(...) end

    require('telescope').setup { }

    local opts = { noremap = true, silent = true }
    keymap('n', '<leader>f', '<cmd>Telescope find_files<cr>', opts)
    keymap('n', '<leader>ff', '<cmd>Telescope git_files<cr>', opts)
    keymap('n', '<leader>F', '<cmd>Telescope file_browser<cr>', opts)
    keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', opts)
    keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
    keymap('n', '<leader>S', '<cmd>Telescope treesitter<cr>', opts)
end

