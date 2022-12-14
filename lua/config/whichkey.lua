local M = {}

local whichkey = require "which-key"
local legendary = require "legendary"
local next = next

local nmap = require("config.keymap").nmap
local function c(command)
    return string.format("<CMD>%s<CR>", command)
end

local conf = {
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
    },
}
whichkey.setup(conf)

local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

local v_opts = {
    mode = "v", -- Visual mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
}

local function normal_keymap()
    local keymap_f = nil -- File search
    local keymap_p = nil -- Project search

    keymap_f = {
        name = "Find",
        f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
        -- d = {
        --     "<cmd>lua require('utils.finder').find_dotfiles()<cr>",
        --     "Dotfiles",
        -- },
        r = {
            "<cmd>lua require('utils.finder').redis_list()<cr>",
            "Redis List",
        },
        b = {
            "<cmd>lua require('telescope.builtin').buffers()<cr>",
            "Buffers",
        },
        h = {
            "<cmd>lua require('telescope.builtin').help_tags()<cr>",
            "Help",
        },
        m = { "<cmd>lua require('telescope.builtin').marks()<cr>", "Marks" },
        o = {
            "<cmd>lua require('telescope.builtin').oldfiles()<cr>",
            "Old Files",
        },
        g = {
            "<cmd>lua require('telescope.builtin').live_grep()<cr>",
            "Live Grep",
        },
        c = {
            "<cmd>lua require('telescope.builtin').commands()<cr>",
            "Commands",
        },
        B = {
            "<cmd>lua require'telescope'.extensions.file_browser.file_browser()<cr>",
            "File Browser",
        },
        w = {
            "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>",
            "Current Buffer",
        },
        e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    }

    keymap_p = {
        name = "Project",
        p = {
            "<cmd>lua require'telescope'.extensions.project.project{display_type = 'full'}<cr>",
            "List",
        },
        s = {
            "<cmd>lua require'telescope'.extensions.repo.list{}<cr>",
            "Search",
        },
    }

    local keymap = {

        b = {
            name = "Buffer",
            -- c = { "<Cmd>bd!<Cr>", "Close current buffer" },
            d = { "<Cmd>BDelete this<Cr>", "Close Buffer" },
            f = { "<Cmd>BDelete! this<Cr>", "Force Close Buffer" },
            -- D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
            D = { "<Cmd>BWipeout other<Cr>", "Delete All Buffers" },
            b = { "<Cmd>BufferLinePick<Cr>", "Pick a Buffer" },
            p = { "<Cmd>BufferLinePickClose<Cr>", "Pick & Close a Buffer" },
            m = { "<Cmd>JABSOpen<Cr>", "Menu" },
            q = {
                "<Cmd>call setqflist(map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), '{\"bufnr\": v:val}'))<BAR>copen<Cr>",
                "Buffer to quickfix",
            },
        },

        c = {
            name = "Code",
            d = { "<cmd>DogeGenerate<Cr>", "Generate Doc" },
            -- g = { "<cmd>Neogen func<Cr>", "Func Doc" },
            -- G = { "<cmd>Neogen class<Cr>", "Class Doc" },
            T = { "<cmd>TodoTelescope<Cr>", "TODO" },
            x = "Swap Next Param",
            X = "Swap Prev Param",
            -- f = "Select Outer Function",
            -- F = "Select Outer Class",
        },

        d = {
            name = "Debug",
        },

        m = {
            name = "Math",
            m = {
                "<cmd>lua require('libuv.my_programs').startup()<CR>",
                "Meus Programas",
            },
            j = {
                "<cmd>lua require('libuv.jupyter').startup()<CR>",
                "Jupyter",
            },
        },

        f = keymap_f,
        p = keymap_p,

        h = {
            name = "harpoon",
            a = {
                "<Cmd>lua require('harpoon.mark').add_file()<Cr>",
                "Add File",
            },
            m = {
                "<Cmd>lua require('harpoon.ui').toggle_quick_menu()<Cr>",
                "UI Menu",
            },
            c = {
                "<Cmd>lua require('harpoon.cmd-ui').toggle_quick_menu()<Cr>",
                "Command Menu",
            },
            f = {
                ["1"] = {
                    "<Cmd>lua require('harpoon.ui').nav_file(1) <Cr>",
                    "File 1",
                },
                ["2"] = {
                    "<Cmd>lua require('harpoon.ui').nav_file(2) <Cr>",
                    "File 2",
                },
            },

            s = {
                ["1"] = {
                    "<Cmd>lua require('harpoon.term').sendCommand(1,1)<Cr>",
                    "Command 1",
                },
                ["2"] = {
                    "<Cmd>lua require('harpoon.term').sendCommand(1,2)<Cr>",
                    "Command 2",
                },
            },
        },

        t = {
            name = "Terminal",
            ["1"] = {
                "<Cmd>lua require('harpoon.term').gotoTerminal(1)<Cr>",
                "Terminal 1",
            },
            ["2"] = {
                "<Cmd>lua require('harpoon.term').gotoTerminal(2)<Cr>",
                "Terminal 2",
            },
        },
        r = {
            name = "Refactor",
            i = {
                [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
                "Inline Variable",
            },
            p = {
                [[ <Esc><Cmd>lua require('refactoring').debug.printf({below = false})<CR>]],
                "Debug Print",
            },
            c = {
                [[ <Esc><Cmd>lua require('refactoring').debug.cleanup({below = false})<CR>]],
                "Debug Cleanup",
            },
        },

        s = {
            name = "Search",
            o = { "<Cmd>lua require('spectre').open()<CR>", "Open" },
            c = {
                "<Cmd>lua require('utils.cht').cht()<CR>",
                "Code",
            },
            s = {
                "<cmd>lua require('utils.session').save_session()<cr>",
                "Saving session",
            },
            t = {
                "<cmd>lua require('utils.session').toggle_session()<cr>",
                "Toggle Workspace Saving",
            },
            l = {
                "<cmd>lua require('utils.session').list_session()<cr>",
                "List and restore session",
            },
            D = {
                "<cmd>lua require('utils.session').delete_session()<cr>",
                "Restore Workspace",
            },
        },

        v = {
            name = "Vimspector",
            G = {
                "<cmd>lua require('config.vimspector').generate_debug_profile()<cr>",
                "Generate Debug Profile",
            },
            I = { "<cmd>VimspectorInstall<cr>", "Install" },
            U = { "<cmd>VimspectorUpdate<cr>", "Update" },
            R = {
                "<cmd>call vimspector#RunToCursor()<cr>",
                "Run to Cursor",
            },
            c = { "<cmd>call vimspector#Continue()<cr>", "Continue" },
            i = { "<cmd>call vimspector#StepInto()<cr>", "Step Into" },
            o = { "<cmd>call vimspector#StepOver()<cr>", "Step Over" },
            s = { "<cmd>call vimspector#Launch()<cr>", "Start" },
            t = {
                "<cmd>call vimspector#ToggleBreakpoint()<cr>",
                "Toggle Breakpoint",
            },
            u = { "<cmd>call vimspector#StepOut()<cr>", "Step Out" },
            S = { "<cmd>call vimspector#Stop()<cr>", "Stop" },
            r = { "<cmd>call vimspector#Restart()<cr>", "Restart" },
            x = { "<cmd>VimspectorReset<cr>", "Reset" },
            H = {
                "<cmd>lua require('config.vimspector').toggle_human_mode()<cr>",
                "Toggle HUMAN mode",
            },
        },

        z = {
            name = "System",
            -- c = { "<cmd>PackerCompile<cr>", "Compile" },
            c = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
            d = { "<cmd>DiffviewOpen<cr>", "Diff View Open" },
            D = { "<cmd>DiffviewClose<cr>", "Diff View Close" },
            i = { "<cmd>PackerInstall<cr>", "Install" },
            m = {
                "<cmd>lua require('telescope').extensions.macroscope.default()<cr>",
                "Macros",
            },
            p = { "<cmd>PackerProfile<cr>", "Profile" },
            s = { "<cmd>PackerSync<cr>", "Sync" },
            S = { "<cmd>PackerStatus<cr>", "Status" },
            u = { "<cmd>PackerUpdate<cr>", "Update" },
            -- x = { "<cmd>cd %:p:h<cr>", "Change Directory" },
            -- x = { "<cmd>set autochdir<cr>", "Auto ChDir" },
            x = { "<cmd>Telescope cder<cr>", "Change Directory" },
            e = { "!!$SHELL<CR>", "Execute line" },
            z = {
                "<cmd>lua require'telescope'.extensions.zoxide.list{}<cr>",
                "Zoxide",
            },
        },

        g = {
            name = "Git",

            i = { c "Git init", "git init" },
            s = { c "Git", "git status" },
            b = { "<cmd>GitBlameToggle<CR>", "Blame" },
            -- N = { "<cmd>Neogit<CR>", "Neogit Status" },
            y = {
                "<cmd>lua require'gitlinker'.get_buf_range_url('n', {action_callback = require'gitlinker.actions'.open_in_browser})<cr>",
                "Link",
            },
            -- g = {
            --     "<cmd>lua require('telescope').extensions.gh.gist()<CR>",
            --     "Gist",
            -- },

            z = {
                "<cmd>lua require('utils.term').git_client_toggle()<CR>",
                "Git TUI",
            },
            Z = {
                "<cmd>lua require('libuv.git_cz').command_toggle()<CR>",
                "Git CZ",
            },
            I = {
                function()
                    local options = vim.fn.input("language: ", "", "tag")
                    vim.cmd(([[Git ignore %s]]):format(options))
                end,
                "git ignore",
            },
            -- g = {
            --   name = "+Github",
            --   c = {
            --     name = "+Commits",
            --     c = { "<cmd>GHCloseCommit<cr>", "Close" },
            --     e = { "<cmd>GHExpandCommit<cr>", "Expand" },
            --     o = { "<cmd>GHOpenToCommit<cr>", "Open To" },
            --     p = { "<cmd>GHPopOutCommit<cr>", "Pop Out" },
            --     z = { "<cmd>GHCollapseCommit<cr>", "Collapse" },
            --   },
            --   i = {
            --     name = "+Issues",
            --     p = { "<cmd>GHPreviewIssue<cr>", "Preview" },
            --   },
            --   l = {
            --     name = "+Litee",
            --     t = { "<cmd>LTPanel<cr>", "Toggle Panel" },
            --   },
            --   r = {
            --     name = "+Review",
            --     b = { "<cmd>GHStartReview<cr>", "Begin" },
            --     c = { "<cmd>GHCloseReview<cr>", "Close" },
            --     d = { "<cmd>GHDeleteReview<cr>", "Delete" },
            --     e = { "<cmd>GHExpandReview<cr>", "Expand" },
            --     s = { "<cmd>GHSubmitReview<cr>", "Submit" },
            --     z = { "<cmd>GHCollapseReview<cr>", "Collapse" },
            --   },
            --   p = {
            --     name = "+Pull Request",
            --     c = { "<cmd>GHClosePR<cr>", "Close" },
            --     d = { "<cmd>GHPRDetails<cr>", "Details" },
            --     e = { "<cmd>GHExpandPR<cr>", "Expand" },
            --     o = { "<cmd>GHOpenPR<cr>", "Open" },
            --     p = { "<cmd>GHPopOutPR<cr>", "PopOut" },
            --     r = { "<cmd>GHRefreshPR<cr>", "Refresh" },
            --     t = { "<cmd>GHOpenToPR<cr>", "Open To" },
            --     z = { "<cmd>GHCollapsePR<cr>", "Collapse" },
            --   },
            --   t = {
            --     name = "+Threads",
            --     c = { "<cmd>GHCreateThread<cr>", "Create" },
            --     n = { "<cmd>GHNextThread<cr>", "Next" },
            --     t = { "<cmd>GHToggleThread<cr>", "Toggle" },
            --   },
            -- },
        },
    }
    whichkey.register(keymap, opts)
    legendary.bind_whichkey(keymap, opts, false)

    -- command: AsyncTaskList
    vim.g.asyncrun_open = 6

    --  Git
    nmap { "<leader>Q", c "lclose", { desc = "L Close" } }
    nmap { "<leader>q", c "cclose", { desc = "C Close" } }
    nmap { "<m-a>", c "Git add %:p" }
    nmap { "<m-r>", c "Gread" }
    nmap { "<m-w>", c "Gwrite" }
    nmap { "<m-c>", c "Git commit" }
    -- nmap { string.format("<M-%s>", "g"),
    --   c("luafile ~/.config/nvim/lua/libuv/git_fzf.lua")
    -- }
    -- nmap { '<m-d>',  c("luafile ~/.config/nvim/lua/libuv/git_fzf_diff.lua") }
end

local function visual_keymap()
    local keymap = {
        g = {
            name = "Git",
            y = {
                "<cmd>lua require'gitlinker'.get_buf_range_url('v', {action_callback = require'gitlinker.actions'.open_in_browser})<cr>",
                "Link",
            },
        },

        r = {
            name = "Refactor",
            e = {
                [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
                "Extract Function",
            },
            f = {
                [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function to File')<CR>]],
                "Extract Function to File",
            },
            v = {
                [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
                "Extract Variable",
            },
            i = {
                [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
                "Inline Variable",
            },
            r = {
                [[ <Esc><Cmd>lua require('telescope').extensions.refactoring.refactors()<CR>]],
                "Refactor",
            },
            V = {
                [[ <Esc><Cmd>lua require('refactoring').debug.print_var({})<CR>]],
                "Debug Print Var",
            },
        },
    }

    whichkey.register(keymap, v_opts)
    legendary.bind_whichkey(keymap, v_opts, false)
end

local function code_keymap()
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "*",
        callback = function()
            vim.schedule(CodeRunner)
        end,
    })

    function CodeRunner()
        local bufnr = vim.api.nvim_get_current_buf()
        local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
        local fname = vim.fn.expand "%:p:t"
        local keymap_c = {} -- normal key map
        local keymap_c_v = {} -- visual key map

        if ft == "python" then
            keymap_c = {
                name = "Code",
                r = {
                    "<cmd>update<CR><cmd>exec '!python3' shellescape(@%, 1)<cr>",
                    "Run",
                },
                m = { "<cmd>TermExec cmd='nodemon -e py %'<cr>", "Monitor" },
            }
        elseif ft == "lua" then
            keymap_c = {
                name = "Code",
                r = { "<cmd>luafile %<cr>", "Run" },
            }
        elseif ft == "rust" then
            keymap_c = {
                name = "Code",
                r = { "<cmd>execute 'Cargo run' | startinsert<cr>", "Run" },
                D = { "<cmd>RustDebuggables<cr>", "Debuggables" },
                h = { "<cmd>RustHoverActions<cr>", "Hover Actions" },
                R = { "<cmd>RustRunnables<cr>", "Runnables" },
            }
        elseif ft == "go" then
            keymap_c = {
                name = "Code",
                r = { "<cmd>!go run %<cr>", "Run" },
            }
        elseif
            ft == "typescript"
            or ft == "typescriptreact"
            or ft == "javascript"
            or ft == "javascriptreact"
        then
            keymap_c = {
                name = "Code",
                o = {
                    "<cmd>TypescriptOrganizeImports<cr>",
                    "Organize Imports",
                },
                r = { "<cmd>TypescriptRenameFile<cr>", "Rename File" },
                i = {
                    "<cmd>TypescriptAddMissingImports<cr>",
                    "Import Missing",
                },
                F = { "<cmd>TypescriptFixAll<cr>", "Fix All" },
                u = { "<cmd>TypescriptRemoveUnused<cr>", "Remove Unused" },
                R = {
                    "<cmd>lua require('config.neotest').javascript_runner()<cr>",
                    "Choose Test Runner",
                },
                -- s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" },
                -- t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" },
            }
        elseif ft == "java" then
            keymap_c = {
                name = "Code",
                o = {
                    "<cmd>lua require'jdtls'.organize_imports()<cr>",
                    "Organize Imports",
                },
                v = {
                    "<cmd>lua require('jdtls').extract_variable()<cr>",
                    "Extract Variable",
                },
                c = {
                    "<cmd>lua require('jdtls').extract_constant()<cr>",
                    "Extract Constant",
                },
                t = {
                    "<cmd>lua require('jdtls').test_class()<cr>",
                    "Test Class",
                },
                n = {
                    "<cmd>lua require('jdtls').test_nearest_method()<cr>",
                    "Test Nearest Method",
                },
            }
            keymap_c_v = {
                name = "Code",
                v = {
                    "<cmd>lua require('jdtls').extract_variable(true)<cr>",
                    "Extract Variable",
                },
                c = {
                    "<cmd>lua require('jdtls').extract_constant(true)<cr>",
                    "Extract Constant",
                },
                m = {
                    "<cmd>lua require('jdtls').extract_method(true)<cr>",
                    "Extract Method",
                },
            }
        end

        if fname == "package.json" then
            keymap_c.v = {
                "<cmd>lua require('package-info').show()<cr>",
                "Show Version",
            }
            keymap_c.c = {
                "<cmd>lua require('package-info').change_version()<cr>",
                "Change Version",
            }
            -- keymap_c.s = { "<cmd>2TermExec cmd='yarn start'<cr>", "Yarn Start" }
            -- keymap_c.t = { "<cmd>2TermExec cmd='yarn test'<cr>", "Yarn Test" }
        end

        if fname == "Cargo.toml" then
            keymap_c.u = {
                "<cmd>lua require('crates').upgrade_all_crates()<cr>",
                "Upgrade All Crates",
            }
        end

        if next(keymap_c) ~= nil then
            local k = { c = keymap_c }
            local o = {
                mode = "n",
                silent = true,
                noremap = true,
                buffer = bufnr,
                prefix = "<leader>",
                nowait = true,
            }
            whichkey.register(k, o)
            legendary.bind_whichkey(k, o, false)
        end

        if next(keymap_c_v) ~= nil then
            local k = { c = keymap_c_v }
            local o = {
                mode = "v",
                silent = true,
                noremap = true,
                buffer = bufnr,
                prefix = "<leader>",
                nowait = true,
            }
            whichkey.register(k, o)
            legendary.bind_whichkey(k, o, false)
        end
    end
end

function M.setup()
    normal_keymap()
    visual_keymap()
    code_keymap()
end

return M
