
return {
    move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
            [']P'] = '@parameter.outer',
            [']s'] = '@statement.outer',
            [']b'] = '@block.outer',
            [']c'] = '@call.outer',
        },
        goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
            ['[p'] = '@parameter.outer',
            ['[s'] = '@statement.outer',
            ['[b'] = '@block.outer',
            ['[c'] = '@call.outer',
        },
        goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
            [']p'] = '@parameter.outer',
            [']S'] = '@statement.outer',
            [']B'] = '@block.outer',
            [']C'] = '@call.outer',
        },
        goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
            ['[P'] = '@parameter.outer',
            ['[S'] = '@statement.outer',
            ['[B'] = '@block.outer',
            ['[C'] = '@call.outer',
        },
    },
    select = {
        enable = true,
        lookahead = true,
        keymaps = {
            ['ab'] = '@block.outer',
            ['af'] = '@function.outer',
            ['aC'] = '@class.outer',
            ['ap'] = '@parameter.outer',
            ['as'] = '@statement.outer',
            ['ac'] = '@call.outer',

            ['ib'] = '@block.inner',
            ['if'] = '@function.inner',
            ['iC'] = '@class.inner',
            ['ic'] = '@call.inner',
            ['ip'] = '@parameter.inner'
        }
    },
    swap = {
        enable = true,
        swap_next = {
            ['sa'] = "@parameter.inner",
            ['sc'] = "@call.outer",
        },
        swap_previous = {
            ['sA'] = "@parameter.inner",
            ['sC'] = "@call.outer",
        }
    }
}
