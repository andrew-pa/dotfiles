
return require('packer').startup(function()
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'tomtom/tcomment_vim'

    -- Language Server Protocol
    use { 
        'neovim/nvim-lspconfig',
        config = function()
            local lsp = require('lspconfig')
            local servers = { "rust_analyzer", "clangd", "texlab", "rome" }
            local on_attach = require('lsp_attach')
            for _, server_name in ipairs(servers) do
                lsp[server_name].setup {
                    on_attach = on_attach
                }
            end
        end
    }
    use {
        'hrsh7th/nvim-compe',
        config = require('compe_config')
    }
    use {
        'rmagatti/goto-preview',
        requires = 'neovim/nvim-lspconfig'
    }
    use { 'ray-x/lsp_signature.nvim' }
    use {
        'simrat39/rust-tools.nvim',
        config = function()
            require('rust-tools').setup {
                tools = {
                    autoSetHints = true,
                    inlay_hints = {
                        show_parameter_hints = false,
                        other_hints_prefix = ":",
                    }
                },
                server = {
                    on_attach = require('lsp_attach')
                }
            }
        end
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = 'maintained',
                highlight = { enable = true },
                indent = { enabled = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = 'gnn',
                        node_incremental = 'grn',
                        scope_incremental = 'grc',
                        node_decremental = 'grm'
                    }
                }
            }
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter-refactor',
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = function()
            require('nvim-treesitter.configs').setup {
                refactor = {
                    highlight_definitions = { enable = true },
                    smart_rename = {
                        enable = true,
                        keymaps = {
                            smart_rename = '<Leader>n'
                        }
                    }
                }
            }
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = function()
            require('nvim-treesitter.configs').setup {
                textobjects = require('treesitter_textobjects')
            }
        end
    }
    use {
        'romgrk/nvim-treesitter-context',
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = function()
            require('treesitter-context.config').setup { enable = true }
        end
    }

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = require('telescope_config')
    }
end)
