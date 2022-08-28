local M = {}

local Terminal = require("toggleterm.terminal").Terminal

local cmd = "cling --nologo -std=c++1z"

local command_client = Terminal:new {
    cmd = cmd,
    dir = vim.fn.expand "%:p",
    hidden = true,
    direction = "float",
    float_opts = {
        border = "double",
    },
}

function M.command_toggle()
    command_client:toggle()
end

return M
