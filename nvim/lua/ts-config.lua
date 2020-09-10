require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,                    -- false will disable the whole extension
        disable = {},        -- list of language that will be disabled
    },
    incremental_selection = {
        enable = true,
        disable = {},
        keymaps = {                       -- mappings for incremental selection (visual mappings)
            init_selection = 'gnn',         -- maps in normal mode to init the node/scope selection
            node_incremental = "grn",       -- increment to the upper named parent
            scope_incremental = "grc",      -- increment to the upper scope (as defined in locals.scm)
            node_decremental = "grm",       -- decrement to the previous node
        }
    },
    refactor = {
        highlight_definitions = {
            enable = true
        },
        highlight_current_scope = {
            enable = true
        },
        smart_rename = {
            enable = false,
            keymaps = {
                smart_rename = "grr"            -- mapping to rename reference under cursor
            }
        },
        navigation = {
            enable = false,
            keymaps = {
                goto_definition = "gnd",        -- mapping to go to definition of symbol under cursor
                list_definitions = "gnD"        -- mapping to list all definitions in current file
            }
        }
    },
    ensure_installed = {'bash', 'html','query', 'json', 'lua', 'markdown', 'python', 'yaml' } -- one of 'all', 'language', or a list of languages
}

require "nvim-treesitter.configs".setup {
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false -- Whether the query persists across vim sessions
  }
}
