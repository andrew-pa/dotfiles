
return function()
    local cmp = require('cmp')
    cmp.setup {
        sources = {
            { name = "nvim_lsp" },
            { name = "buffer" },
            { name = "path" },
            { name = "calc" },
            { name = "nvim_lua" },
            { name = "emoji" },
            { name = "latex_symbols" },
        },

        mapping = {
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
            ['<Tab>'] = cmp.mapping.select_next_item(),
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

        preselect = cmp.PreselectMode.Item,

        experimental = {
            native_menu = true,
            ghost_text = true
        }
    }
end
