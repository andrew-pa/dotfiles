local M = {}

M.project_files = function()
    local opts = {}
    local ok = pcall(require"telescope.builtin".git_files, opts)
    if not ok then require"telescope.builtin".find_files(opts) end
end

M.config = function()
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

    require('telescope').load_extension('ui-select')
    require('telescope').load_extension('fzf')

    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>lua require("telescope_config").project_files()<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>S', '<cmd>Telescope treesitter<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>D', '<cmd>Telescope diagnostics<cr>', opts)
end

return M
