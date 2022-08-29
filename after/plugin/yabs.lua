-- yabs.lua - yabs
-- Maintainer: Ivan Lopes
-- ~/.config/nvim/after/plugin

-- local cache_location = vim.fn.stdpath('cache')
-- local config_location = vim.fn.stdpath('config')
-- local local_location = vim.fn.stdpath('data')

local has_yabs, yabs = pcall(require, "yabs")
if not has_yabs then
    return
end

_TERM = -1
_PROMPT_BUFFER = -1

local console = function(cmd)
    local shell =
        string.format("bash --rcfile %s/bashrc", vim.fn.stdpath "config")

    local term = nil

    local OK = false

    if (_TERM == -1) and (_PROMPT_BUFFER == -1) then
        OK = true
    else
        if #vim.fn.getbufinfo(_PROMPT_BUFFER) == 0 then
            _TERM = -1
            _PROMPT_BUFFER = -1
            OK = true
        end
    end

    if OK then
        vim.cmd [[20new]]
        term = vim.fn.termopen(shell)
        vim.wait(100, function()
            return false
        end)

        _TERM = term

        local closing_keys = { "q" }
        local map_options = {
            noremap = true,
            silent = true,
        }

        for _, key in ipairs(closing_keys) do
            vim.api.nvim_buf_set_keymap(
                vim.api.nvim_get_current_buf(),
                "n",
                key,
                "<CMD>q!<CR>",
                map_options
            )
        end
    else
        term = _TERM
    end

    if OK then
        local buf = vim.api.nvim_get_current_buf()
        _PROMPT_BUFFER = buf
    end

    local data = cmd .. "\n"
    vim.api.nvim_chan_send(term, data)
end

local languages = {

    kotlin = {
        tasks = {
            jar = {
                command = "kotlinc % -include-runtime -d "
                    .. vim.fn.expand "%<"
                    .. ".jar",
                output = "quickfix",
                opts = { open_on_run = "always" },
            },
            run = {
                command = "java -jar " .. vim.fn.expand "%<" .. ".jar",
                output = "quickfix",
                opts = { open_on_run = "always" },
            },
            clean = {
                command = "rm " .. vim.fn.expand "%<" .. ".jar",
                output = "quickfix",
                opts = { open_on_run = "always" },
            },
            build = {
                command = function()
                    local source_name = vim.fn.expand "%<"
                    vim.api.nvim_command "write"

                    local key = nil
                    local query_result = nil

                    key = "make"
                    query_result = vim.fn["projectionist#query_exec"](key)[1]
                    local compile = query_result[2]

                    key = "dispatch"
                    query_result = vim.fn["projectionist#query_exec"](key)[1]
                    local run = query_result[2]

                    local cmd = compile .. " && " .. run

                    console(cmd)
                end,
                type = "lua",
            },
        },
    },

    java = {
        tasks = {
            class = {
                command = "javac %",
                output = "quickfix",
                type = "shell",
                opts = { open_on_run = "always" },
            },
            run = {
                command = "java %<",
                output = "quickfix",
                opts = { open_on_run = "always" },
            },
            build = {
                command = function()
                    local source_name = vim.fn.expand "%<"
                    vim.api.nvim_command "write"

                    local key = nil
                    local query_result = nil

                    key = "make"
                    query_result = vim.fn["projectionist#query_exec"](key)[1]
                    local compile = query_result[2]

                    key = "dispatch"
                    query_result = vim.fn["projectionist#query_exec"](key)[1]
                    local run = query_result[2]

                    local cmd = compile .. " && " .. run

                    console(cmd)
                end,
                type = "lua",
            },
        },
    },

    cpp = {
        -- default_task = yabs.first_available("cmake_build", "make_build"),
        tasks = {
            run = {
                command = function()
                    local source_name = vim.fn.expand "%<"
                    local cmd = string.format("./%s", source_name)
                    console(cmd)
                end,
                type = "lua",
            },
            make = {
                command = function()
                    require("config.nvim_dev").make {}
                end,
                type = "lua",
            },
            build = {
                command = function()
                    local source_name = vim.fn.expand "%<"
                    vim.api.nvim_command "write"

                    local key = nil
                    local query_result = nil

                    key = "CC"
                    query_result = vim.fn["projectionist#query_exec"](key)[1]
                    local compile = query_result[2]

                    key = "LD"
                    query_result = vim.fn["projectionist#query_exec"](key)[1]
                    local link = query_result[2]

                    local run = string.format("./%s", source_name)
                    local cmd = compile .. " && " .. link .. " && " .. run

                    console(cmd)
                end,
                type = "lua",
            },
        },
    },

    c = {
        tasks = {
            run = {
                command = function()
                    local source_name = vim.fn.expand "%<"
                    local cmd = string.format("./%s", source_name)
                    console(cmd)
                end,
                type = "lua",
            },
            make = {
                command = function()
                    require("config.nvim_dev").make {}
                end,
                type = "lua",
            },
            build = {
                command = function()
                    local source_name = vim.fn.expand "%<"
                    vim.api.nvim_command "write"

                    local key = nil
                    local query_result = nil

                    key = "CC"
                    query_result = vim.fn["projectionist#query_exec"](key)[1]
                    local compile = query_result[2]

                    key = "LD"
                    query_result = vim.fn["projectionist#query_exec"](key)[1]
                    local link = query_result[2]

                    local run = string.format("./%s", source_name)
                    local cmd = compile .. " && " .. link .. " && " .. run

                    console(cmd)
                end,
                type = "lua",
            },
        },
    },

    make = {
        tasks = {
            make = {
                command = function()
                    require("config.nvim_dev").make {}
                end,
                type = "lua",
            },
            run = {
                command = function()
                    require("config.nvim_dev").make { "run" }
                end,
                type = "lua",
            },
            clean = {
                command = function()
                    require("config.nvim_dev").make { "clean" }
                end,
                type = "lua",
            },
            test = {
                command = function()
                    require("config.nvim_dev").make { "test" }
                end,
                type = "lua",
            },
            bear = {
                command = "/usr/local/bin/bear make",
                output = "quickfix",
                opts = { open_on_run = "always" },
            },
        },
    }, -- make

    lua = {
        tasks = {
            run = {
                command = "luafile %",
                type = "vim",
                -- output = "quickfix",
                -- output = 'echo',
                output = "quickfix",
                opts = { open_on_run = "always" },
            },
        },
    }, -- lua

    spice = {
        tasks = {
            run = {
                command = "ngspice -b %",
                output = "quickfix",
            },
        },
    }, -- spice

    sh = {
        tasks = {
            run = {
                command = "bash %",
                output = "quickfix",
            },
        },
    }, -- Sh

    bc = {
        tasks = {
            run = {
                command = "bc -q -l % <<< 'quit'",
                output = "quickfix",
            },
        },
    }, -- bc

    maple = {
        tasks = {
            run = {
                command = "maple -q %",
                output = "quickfix",
            },
        },
    }, --Maple

    octave = {
        tasks = {
            run = {
                command = "octave %",
                output = "quickfix",
            },
        },
    }, -- Octave

    ruby = {
        tasks = {
            run = {
                command = "ruby %",
                output = "quickfix",
            },
            monitor = {
                command = "nodemon -e py %",
                output = "terminal",
            },
            debug = {
                command = "ruby -m pdb %",
                output = "terminal",
            },
        },
    }, -- ruby

    python = {
        tasks = {
            run = {
                command = "python %",
                output = "quickfix",
            },
            monitor = {
                command = "nodemon -e py %",
                output = "terminal",
            },
            debug = {
                command = "python -m pdb %",
                output = "terminal",
            },
        },
    }, -- Python

    julia = {
        tasks = {
            run = {
                command = "julia %",
                output = "terminal",
                opts = { open_on_run = "never" },
            },
            test = {
                command = "julia -e 'using Pkg; Pkg.test()'",
                output = "terminal",
                opts = { open_on_run = "auto" },
            },
        },
    }, -- Julia
} -- languages

-- Default tasks
local tasks = {

    cmake = {
        command = "cmake .",
        output = "quickfix",
    },
} -- tasks

local opts = {
    output_types = {
        quickfix = { open_on_run = "always" },
    },
} -- opts

yabs:setup { languages = languages, tasks = tasks, opts = opts }

-- vim: fdm=marker:sw=4:sts=4:et
