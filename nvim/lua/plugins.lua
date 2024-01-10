local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'tpope/vim-surround',
    'tpope/vim-repeat',
    'rust-lang/rust.vim',

    { 'numToStr/Comment.nvim', lazy = false },

    -- Language Server Protocol
    { 
        'neovim/nvim-lspconfig',
        config = function()
            local lsp = require('lspconfig')
            local servers = { "rust_analyzer", "clangd", "texlab", "tsserver", "ocamllsp", "erlangls", "gopls", "hls", "pyright", "racket_langserver" }
            local on_attach = require('lsp_attach')
            local caps = vim.lsp.protocol.make_client_capabilities()
            caps = require('cmp_nvim_lsp').default_capabilities(caps)
            for _, server_name in ipairs(servers) do
                lsp[server_name].setup {
                    on_attach = on_attach,
                    capabilities = caps
                }
            end
        end
    },
    'L3MON4D3/LuaSnip',
    {
        'hrsh7th/nvim-cmp',
        dependencies = { 'nvim-lspconfig' },
        config = require('cmp_config')
    },
    'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lua', 'hrsh7th/cmp-calc', 'hrsh7th/cmp-emoji',
    'hrsh7th/cmp-calc', 'amarakon/nvim-cmp-lua-latex-symbols',
    'saadparwaiz1/cmp_luasnip', 'hrsh7th/cmp-nvim-lsp-signature-help',
    {
        'rmagatti/goto-preview',
        config = function()
            require('goto-preview').setup {
                width = 90,
                height = 25
            }
        end,
        dependencies = { 'neovim/nvim-lspconfig' }
    },
    {
        'simrat39/rust-tools.nvim',
        config = function()
            require('rust-tools').setup {
                tools = {
                    autoSetHints = true,
                    inlay_hints = {
                        show_parameter_hints = true,
                        parameter_hints_prefix = "",
                        other_hints_prefix = ":",
                    }
                },
                server = {
                    on_attach = require('lsp_attach')
                }
            }
        end,
        dependencies = 'nvim-lspconfig'
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "rust", "go", "java", "javascript", "python", "css", "bash", "hcl", "make", "html", "json", "latex" },
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
    },

    {
        'nvim-treesitter/nvim-treesitter-refactor',
        dependencies = {'nvim-treesitter/nvim-treesitter'},
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
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        dependencies = {'nvim-treesitter/nvim-treesitter'},
        config = function()
            require('nvim-treesitter.configs').setup {
                textobjects = require('treesitter_textobjects')
            }
        end
    },
    {
        'drybalka/tree-climber.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
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
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        dependencies = {'nvim-treesitter/nvim-treesitter'},
        config = function()
            require('treesitter-context').setup { enable = true }
        end
    },

    -- Telescope
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = require('telescope_config').config
    },
    'nvim-telescope/telescope-ui-select.nvim',
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    {
        'saecki/crates.nvim',
        tag = 'stable',
        event = { "BufRead Cargo.toml" },
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('crates').setup()
        end
    },
    'benknoble/vim-sexp',
    'junegunn/rainbow_parentheses.vim'
}, {
    performance = {
        rtp = {
            paths = {
                '~/config/nvim'
            }
        }
    }
})
