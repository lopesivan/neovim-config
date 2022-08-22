pcall(require, "impatient")
require "config.profile"

if require "config.first_load"() then
    return
end

-- Setup globals that I expect to be always available.
--  See `./lua/tj/globals/*.lua` for more information.
require "config.globals"

-- Turn off builtin plugins I do not use.
require "config.disable_builtin"

--require "config"
require "plugins"

-- Telescope BTW
require "config.telescope.setup"
require "config.telescope.mappings"

-- Build system
require "config.nvim_dev"
