
return require('packer').startup(function()
    use 'tpope/vim-surround'
    use 'tpope/vim-repeat'
    use 'rust-lang/rust.vim'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Language Server Protocol
    use { 
        'neovim/nvim-lspconfig',
        config = function()
            local lsp = require('lspconfig')
            local servers = { "rust_analyzer", "clangd", "texlab", "tsserver", "ocamllsp", "erlangls" }
            local on_attach = require('lsp_attach')
            local caps = vim.lsp.protocol.make_client_capabilities()
            -- caps = require('cmp_nvim_lsp').update_capabilities(caps)
            for _, server_name in ipairs(servers) do
                lsp[server_name].setup {
                    on_attach = on_attach,
                    capabilities = caps
                }
            end
        end,
        after = 'nvim-cmp'
    }
    use { 'L3MON4D3/LuaSnip' }
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path',
            'hrsh7th/cmp-nvim-lua', 'hrsh7th/cmp-calc', 'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-calc', 'kdheepak/cmp-latex-symbols',
            'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-nvim-lsp-signature-help'
        },
        config = require('cmp_config')
    }
    use {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {
                width = 80,
                height = 25
            }
        end,
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
        end,
        after = 'nvim-lspconfig'
    }

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = 'all',
                ignore_install =  { 'phpdoc' },
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
                            smart_rename = '<Leader>N'
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
        'drybalka/tree-climber.nvim',
        requires = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            local keyopts = { noremap = true, silent = true }
            local tc = require('tree-climber')
            vim.keymap.set({'n', 'v', 'o'}, '<C-j>k', tc.goto_parent, keyopts)
            vim.keymap.set({'n', 'v', 'o'}, '<C-j>j', tc.goto_child, keyopts)
            vim.keymap.set({'n', 'v', 'o'}, '<C-j>h', tc.goto_prev, keyopts)
            vim.keymap.set({'n', 'v', 'o'}, '<C-j>l', tc.goto_next, keyopts)
            vim.keymap.set('n', '<C-j>H', tc.swap_prev, keyopts)
            vim.keymap.set('n', '<C-j>L', tc.swap_next, keyopts)
        end
    }
    use {
        'nvim-treesitter/nvim-treesitter-context',
        requires = {'nvim-treesitter/nvim-treesitter'},
        config = function()
            require('treesitter-context').setup { enable = true }
        end
    }

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = require('telescope_config').config
    }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }

    use {
        'winston0410/mark-radar.nvim',
        disable = true,
        config = function()
            require('mark-radar').setup {
                highlight_group = "IncSearch"
            }
        end
    }

    use {
        'saecki/crates.nvim',
        tag = 'v0.1.0',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end
    }

    -- use {
    --     disable = true,
    --     'mfussenegger/nvim-dap',
    --     config = require('dap_config')
    -- }
end)
