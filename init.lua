pcall(require, "impatient")
require "config.profile"

if require "config.first_load"() then
    return
end

-- Leader key -> ","
--
-- In general, it's a good idea to set this early in your config, because otherwise
-- if you have any mappings you set BEFORE doing this, they will be set to the OLD
-- leader.
vim.g.mapleader = " "

-- I set some global variables to use as configuration throughout my config.
-- These don't have any special meaning.

-- Setup globals that I expect to be always available.
--  See `./lua/tj/globals/*.lua` for more information.
require "config.globals"

-- Turn off builtin plugins I do not use.
require "config.disable_builtin"

--require "config"
require "plugins"

-- Telescope BTW
require "config.telescope.setup"
--require "config.telescope.mappings"

-- Build system
require "config.nvim_dev"
