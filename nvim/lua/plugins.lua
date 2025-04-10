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
    'junegunn/goyo.vim',

    { 'numToStr/Comment.nvim', lazy = false, opts = {} },

    -- Language Server Protocol
    { 
        'neovim/nvim-lspconfig',
        config = function()
            local lsp = require('lspconfig')
            local servers = { "rust_analyzer", "clangd", "texlab", "ts_ls", "ocamllsp", "erlangls", "gopls", "hls", "pyright", "racket_langserver" }
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
        opts = {
            width = 90,
            height = 30
        },
        dependencies = { 'neovim/nvim-lspconfig' }
    },
    {
        'simrat39/rust-tools.nvim',
        lazy = true,
        ft = 'rust',
        opts = {
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
        },
        dependencies = 'nvim-lspconfig'
    },

    -- Treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "c", "cpp", "lua", "vim", "vimdoc", "query", "rust", "go", "java", "javascript", "python", "css", "bash", "hcl", "make", "html", "json", "latex", "just" },
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
            require('treesitter-context').setup {
                enable = true,
                max_lines = 8,
                min_window_height = 32,
                multiline_threshold = 3
            }
        end
    },
    {
        'cshuaimin/ssr.nvim',
        config = function()
            require("ssr").setup {
                border = "rounded",
                min_width = 60,
                min_height = 10,
                max_width = 120,
                max_height = 50,
                adjust_window = true,
                keymaps = {
                    close = "q",
                    next_match = "n",
                    prev_match = "N",
                    replace_confim = "<cr>",
                    replace_all = "<leader><cr>"
                }
            }
            local keyopts = { noremap = true, silent = true }
            vim.keymap.set({"n","x"}, "<leader>a", function() require("ssr").open() end)
        end
    },
    {
        'kevinhwang91/nvim-ufo',
        dependencies = { 'kevinhwang91/promise-async' },
        config = function()
            require("ufo").setup {
                provider_selector = function(bufnr, filetype, buftype)
                    return {'treesitter', 'indent'}
                end
            }

            vim.o.foldcolumn = '1' -- '0' is not bad
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
            vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
            vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
        end
    },

    -- Telescope
    'nvim-lua/plenary.nvim',
    'nvim-lua/popup.nvim',
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            {'nvim-lua/popup.nvim'},
            {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-ui-select.nvim'},
            {'nvim-telescope/telescope-fzf-native.nvim'},
            {'Marskey/telescope-sg'},
        },
        config = require('telescope_config').config
    },
    'nvim-telescope/telescope-ui-select.nvim',
    'Marskey/telescope-sg',
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
    'junegunn/rainbow_parentheses.vim',

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        opts = {
            enable_bracket_in_quote = false
        }
    },

    {
        'mfussenegger/nvim-dap',
        config = require('dap_config').config
    },

    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        lazy = true,
        opts = {
            provider = "ollama",
            ollama = {
                endpoint = "http://127.0.0.1:11434",
                model = "llama3.3:70b"
            }
        },
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            'echasnovski/mini.icons',
            {
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                    },
                },
            },
            {
                'MeanderingProgrammer/render-markdown.nvim',
                opts = {
                    file_types = { "markdown", "Avante" },
                    heading = {
                        enabled = true,
                        sign = false,
                        icons = {},
                        width = 'block',
                        min_width = 80
                    }
                },
                ft = { "markdown", "Avante" },
            },
        },
    },

    {
        'Julian/lean.nvim',
        event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

        dependencies = {
            'neovim/nvim-lspconfig',
            'nvim-lua/plenary.nvim',
        },

        opts = {
            lsp = {},
            mappings = true,
        }
    }
}, {
    performance = {
        rtp = {
            paths = {
                '~/config/nvim'
            }
        }
    }
})
