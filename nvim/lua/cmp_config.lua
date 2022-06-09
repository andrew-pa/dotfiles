
return function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    cmp.setup {
        sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
            { name = "calc" },
            { name = "nvim_lua" },
            { name = "emoji" },
            { name = "latex_symbols" },
            { name = "luasnip" },
            { name = "nvim_lsp_signature_help" }
        },

        mapping = {
            ["<Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.expand_or_jumpable() then
                    luasnip.expand_or_jump()
                elseif has_words_before() then
                    cmp.complete()
                else
                    fallback()
                end
            end, { "i", "s" }),

            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                    luasnip.jump(-1)
                else
                    fallback()
                end
            end, { "i", "s" }),

            ['<C-d>'] = cmp.mapping.scroll_docs(-8),
            ['<C-f>'] = cmp.mapping.scroll_docs(8),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = false
            })
        },

        completion = {
            autocomplete = {
                cmp.TriggerEvent.TextChanged
            },
        },

        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end
        }
    }

    cmp.setup.filetype("toml", {
        sources = {
            { name = "crates" }
        }
    })
end
