local M = {}

M.project_files = function()
    local opts = {}
    local ok = pcall(require"telescope.builtin".git_files, opts)
    if not ok then require"telescope.builtin".find_files(opts) end
end

M.config = function()
    local actions = require('telescope.actions')

    local telescope = require('telescope')

    telescope.setup {
        defaults = {
            mappings = {
                i = {
                    [ "<esc>" ] = actions.close,
                    [ "<C-j>" ] = actions.move_selection_better,
                    [ "<C-k>" ] = actions.move_selection_worse,
                }
            }
        },
        extensions = {
            ast_grep = {
                command = {
                    "ast-grep", "run", "--json=stream"
                },
                grep_open_files = false,
                lang = nil
            }
        }
    }

    telescope.load_extension('ui-select')
    telescope.load_extension('fzf')
    telescope.load_extension('ast_grep')

    local opts = { noremap = true, silent = true }
    vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua require("telescope_config").project_files()<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>F', '<cmd>Telescope find_files<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>b', '<cmd>Telescope buffers<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>g', '<cmd>Telescope live_grep<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>S', '<cmd>Telescope treesitter<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>D', '<cmd>Telescope diagnostics<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>m', '<cmd>Telescope marks<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>G', '<cmd>Telescope git_status<cr>', opts)
    vim.api.nvim_set_keymap('n', '<leader>v', '<cmd>Telescope ast_grep<cr>', opts)
end

return M
