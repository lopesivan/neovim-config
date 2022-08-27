local M = {}

-- muda os argumentos de uma função de posição
-- alt+<space>, alt+p -> swap next
-- alt+<backspace>, alt+p -> swap previous
-- swap_previous = {
--   ["<M-s><M-P>"] = "@parameter.inner",
--   ["<M-s><M-F>"] = "@function.outer",
-- },
local swap_next, swap_prev = (function()
    local swap_objects = {
        p = "@parameter.inner",
        f = "@function.outer",
        e = "@element",

        -- Not ready, but I think it's my fault :)
        -- v = "@variable",
    }

    local n, p = {}, {}
    for key, obj in pairs(swap_objects) do
        n[string.format("<M-Space><M-%s>", key)] = obj
        p[string.format("<M-BS><M-%s>", key)] = obj
    end

    return n, p
end)()

-- :h nvim-treesitter-query-extensions
local custom_captures = {
    ["function.call"] = "LuaFunctionCall",
    ["function.bracket"] = "Type",
    ["namespace.type"] = "TSNamespaceType",
}

function M.setup()
    require("nvim-treesitter.configs").setup {
        -- One of "all", "maintained" (parsers with maintainers), or a list of languages
        ensure_installed = "all",

        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,
        ignore_install = { "phpdoc", "swift" },

        highlight = {
            enable = true, -- false will disable the whole extension
            use_languagetree = true,
            disable = { "json", "java" },
            -- additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
            custom_captures = custom_captures,
            -- queries = {
            --     lua = read_query "/home/ivan/.config/lsp/tree-sitter-lua/queries/lua/highlights.scm",
            --     -- rust = read_query("~/.config/nvim/queries/rust/highlights.scm"),
            -- },
        },

        -- rainbow = {
        --     enable = true,
        --     extended_mode = true,
        --     max_file_lines = nil,
        -- },

        incremental_selection = {
            enable = true,
            keymaps = { -- mappings for incremental selection (visual mappings)
                init_selection = "|", -- maps in normal mode to init the node/scope selection
                node_incremental = "|", -- increment to the upper named parent
                node_decremental = "<a-2>", -- decrement to the previous node
                scope_incremental = "<a-1>", -- increment to the upper scope (as defined in locals.scm)
            },
        },

        indent = {
            enable = true,
            disable = { "python", "java", "rust", "lua" },
        },

        -- vim-matchup
        matchup = {
            enable = true,
        },

        -- nvim-treesitter-textsubjects
        textsubjects = {
            enable = true,
            prev_selection = ",", -- (Optional) keymap to select the previous selection
            keymaps = {
                ["."] = "textsubjects-smart",
                [";"] = "textsubjects-container-outer",
                ["i;"] = "textsubjects-container-inner",
            },
        },

        -- ----------------------------------------------------------
        --
        --       Alt BSP Alt p
        --       ' ---<---`
        --      /          \
        --   (arg1, arg2, ..., argN)
        --      \          /
        --       ' --->---`
        --        Alt SPC Alt p
        --
        -- ----------------------------------------------------------
        --
        --                         [[  up
        --                         ]]  down
        --              -------------
        --       .-----.
        --       |Class|
        --       '-----'
        --              -------------
        --                          [] up
        --                          ][ down
        --
        -- ----------------------------------------------------------
        --
        --                         [m  up
        --                         ]m  down
        --            -------------
        --       .---.
        --       |FUN|
        --       '---'
        --            -------------
        --                         [M  up
        --                         ]M  down
        --
        -- ----------------------------------------------------------

        -- * Alt SPC Alt p argfun ->                          [treesiter]
        -- * Alt BSP Alt p <- argfun                          [treesiter]
        -- * ]m            go fun <UP>            HEAD        [treesiter]
        -- * [m            go fun <DOWN>          HEAD        [treesiter]
        -- * [M            go fun end <UP>        TAIL        [treesiter]
        -- * ]M            go fun end <DOWN>      TAIL        [treesiter]
        -- * [[            go class <UP>          HEAD        [treesiter]
        -- * ]]            go class <DOWN>        HEAD        [treesiter]
        -- * ][            go end class <UP>      TAIL        [treesiter]
        -- * []            go end class <DOWN>    TAIL        [treesiter]
        -- * v a f         Visual ALL func                    [treesiter]
        -- * v i f         Visual INNER func                  [treesiter]
        -- * v a c         Visual ALL class                   [treesiter]
        -- * v i c         Visual INNER class                 [treesiter]
        -- * v a a         Visual ALL arg                     [treesiter]
        -- * v i a         Visual INNER arg                   [treesiter]
        --

        -- nvim-treesitter-textobjects
        textobjects = {
            move = {
                enable = true,
                set_jumps = true,
                -- Automatically jump forward to textobj, similar to targets.vim
                lookahead = true,

                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },

            select = {
                enable = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",

                    ["ac"] = "@conditional.outer",
                    ["ic"] = "@conditional.inner",

                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                },
            },

            swap = {
                enable = true,
                swap_next = swap_next,
                swap_previous = swap_prev,
            },
        },

        -- endwise
        endwise = {
            enable = true,
        },

        -- autotag
        autotag = {
            enable = true,
            filetypes = { "html", "xml" },
        },

        -- context_commentstring
        context_commentstring = {
            enable = true,
            enable_autocmd = false,
            config = {
                c = "// %s",
                lua = "-- %s",
            },
        },

        -- indent
        -- yati = { enable = true },
    }
end

return M
