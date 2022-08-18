-- visual_line_mode.lua - visual_line_mode
-- Maintainer: Ivan Lopes
-- ~/.config/nvim/after/plugin

vim.keymap.set("n", '<F1>',
function()
	vim.opt.wrap = not vim.opt.wrap:get()
	vim.opt.list = not vim.opt.list:get()
	vim.opt.linebreak = not vim.opt.linebreak:get()

	if (vim.opt.virtualedit['_value'] == "block") then
		vim.opt.virtualedit = 'all'
        print("Visual line mode: ON")
	else
		vim.opt.virtualedit = 'block'
        print("Visual line mode: OFF")
	end
end,
{desc="visual line mode"})

-- vim: fdm=marker:sw=4:sts=4:et
