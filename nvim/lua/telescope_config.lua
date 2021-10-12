
return function()
    local function keymap(...) vim.api.nvim_set_keymap(...) end

    local actions = require('telescope.actions')

    require('telescope').setup {
        defaults = {
            mappings = {
                i = {
                    [ "<esc>" ] = actions.close
                }
            }
        }
    }

    local opts = { noremap = true, silent = true }
    keymap('n', '<leader>f', '<cmd>Telescope find_files<cr>', opts)
    keymap('n', '<leader>ff', '<cmd>Telescope git_files<cr>', opts)
    keymap('n', '<leader>F', '<cmd>Telescope file_browser<cr>', opts)
    keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', opts)
    keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
    keymap('n', '<leader>S', '<cmd>Telescope treesitter<cr>', opts)
end

