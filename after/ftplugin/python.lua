-- programa em lua
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.textwidth = 78

vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "GetPythonFoldExpr()"
vim.opt.foldtext = "PythonFoldText()"
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 999
vim.opt.foldminlines = 1

-- vim.b.start="ipython -i %"

vim.g.VimuxPromptString = "python"
vim.g.VimuxRunnerType = "window"
vim.g.VimuxRunnerName = "+PYTHON"
vim.g.VimuxCloseOnExit = 1
vim.g.projectionist_heuristics = {
    ["*.py"] = {
        ["*.py"] = {
            ["start"] = "ipython -i {file}",
            ["make"] = "python {file}",
            ["run"] = "lua require('config.nvim_dev').app('python',{'{file|basename}'})",
            ["dispatch"] = "python {file}",
            ["yabs_run"] = "run",
            ["yabs_debug"] = "debug",
            ["telescope"] = "Telescope yabs tasks",
            ["async_run"] = "AsyncRun -mode=term -pos=tmux python {file|basename}",
            ["quit"] = "call VimuxCloseRunner()",
            ["type"] = "python",
        },
    },
}

local nmap = require("config.dispatch").nmap
nmap { "b<CR>", "telescope", "build maneger" }
nmap { "<leader><CR>", "run", "nvim_dev Run" }
nmap { "s<CR>", "start", "Ipython" }
nmap { "m<CR>", "make", "Make" }
nmap { "<leader><leader><CR>", "async_run", "Async Run" }
nmap { "<leader><leader>q", "quit", "Close window" }
nmap { "r<CR>", "yabs_run", "Run" }
nmap { "d<CR>", "yabs_debug", "Debug" }

vim.cmd [[
nmenu Debuger.Start  :exe " ".projectionist#query('start')[0][1]
nmenu Debuger.Stop   :exe " ".projectionist#query('stop')[0][1]
nmenu Debuger.Toggle :exe " ".projectionist#query('toggle')[0][1]
nmenu Debuger.toHTML :lua require('dap').toggle_breakpoint()
nmenu Debuger.Slide  :lua require'telegraph'.telegraph({cmd='lookatme {filepath} --live-reload --style gruvbox-dark', how='tmux'})
]]

vim.api.nvim_set_keymap(
    "n",
    "<F12>",
    "<Cmd>call Menu2Quick('Debuger', 'n')<CR>",
    { noremap = true, silent = true }
)
