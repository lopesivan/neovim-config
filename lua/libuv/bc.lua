local M = {}

local Terminal = require("toggleterm.terminal").Terminal

local cmd = "bc -l"

local command_client = Terminal:new {
    cmd = cmd,
    dir = "/workspace",
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
