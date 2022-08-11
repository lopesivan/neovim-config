-- programa em lua

local M = {}

local nmap = require("config.keymap").nmap

function M.nmap(tbl)
	nmap { tbl[1],
	function()
		local key = tbl[2]
		local query_result = vim.fn["projectionist#query_exec"](key)[1]

		if query_result ~= nil then

			local projectionist_heuristics =
			{
				["start"]    = "Start",
				["make"]     = "Make",
				["dispatch"] = "Dispatch",
			}

			local cmd = projectionist_heuristics[tbl[2]]
			if not (cmd) then
				cmd = query_result[2]
			end

			if (tbl[2]:find("^yabs") ~= nil) then
				vim.api.nvim_command('write')
				require("yabs"):run_task(cmd)
			else
				print(cmd)
				vim.cmd(([[%s]]):format(cmd))
			end

		else
			print("No "..tbl[3].." command found")
		end
	end,
	{desc=tbl[4]}}
end

return M
