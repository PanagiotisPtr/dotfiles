require('panagiotisptr.set')
require('panagiotisptr.remap')
require('panagiotisptr.coc')

local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close,
            },
        },
    },
})

require'nvim-treesitter.configs'.setup {
    ensure_installed = { 'go', 'typescript', 'javascript', 'json', 'yaml', 'lua' },

    sync_install = false,

    highlight = {
        enable = true,

        additional_vim_regex_highlighting = false,
    },

    indent = {
        enable = true
    },

    refactor = {
        highlight_definitions = {
            enable = true,
            clear_on_cursor_move = true,
        },
    },

    refactor = {
        highlight_current_scope = { enable = true },
        smart_rename = {
            enable = true,
            keymaps = {
                smart_rename = "grr",
            },
        },
        navigation = {
            enable = true,
            keymaps = {
                goto_definition = "gnd",
                list_definitions = "gnD",
                list_definitions_toc = "gO",
                goto_next_usage = "<C-*>",
                goto_previous_usage = "<C-#>",
            },
        },
    },
}
