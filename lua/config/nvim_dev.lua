-- RELOAD "config.nvim_dev"

local Job = require "plenary.job"
local plenary_window = require "plenary.window.float"

local nvim_dev = {}

nvim_dev.sh = function(args)
	local float = plenary_window.percentage_range_window(0.9, 0.8)
	local count = 0

	local closing_keys = { "q", "<Esc>", "<CR>" }
	local map_options = {
		noremap = true,
		silent = true,
	}

	for _, key in ipairs(closing_keys) do
		vim.api.nvim_buf_set_keymap(float.bufnr, "n", key, "<CMD>close!<CR>", map_options)
	end

	Job
	:new({
		command = "bash",
		args = args,

		on_stdout = vim.schedule_wrap(function(_, data)
			vim.api.nvim_buf_set_lines(float.bufnr, count, count + 1, false, { data })
			count = count + 1
			print(data)
		end),

		on_stderr = vim.schedule_wrap(function(_, data)
			print("ERROR:" .. data)
		end),

		on_exit = vim.schedule_wrap(function(self, code)
			print "Done"
			print("Code", code)
			if code ~= 0 then
				local result = vim.deepcopy(self:result())
				vim.list_extend(result, self:stderr_result())

				P(result)

				vim.fn.setqflist(result, "r")
			end

			vim.bo[float.bufnr].readonly = true
			vim.bo[float.bufnr].buftype = "nofile"
			vim.bo[float.bufnr].modified = false
			vim.bo[float.bufnr].modifiable = false
			vim.opt_local.wrap = false
		end),
	})
	:start()
end

nvim_dev.make = function(args)
	local float = plenary_window.percentage_range_window(0.9, 0.8)
	local count = 0

	local closing_keys = { "q", "<Esc>", "<CR>" }
	local map_options = {
		noremap = true,
		silent = true,
	}

	for _, key in ipairs(closing_keys) do
		vim.api.nvim_buf_set_keymap(float.bufnr, "n", key, "<CMD>close!<CR>", map_options)
	end

	Job
	:new({
		command = "make",
		args = args,

		on_stdout = vim.schedule_wrap(function(_, data)
			vim.api.nvim_buf_set_lines(float.bufnr, count, count + 1, false, { data })
			count = count + 1
			print(data)
		end),

		on_stderr = vim.schedule_wrap(function(_, data)
			print("ERROR:" .. data)
		end),

		on_exit = vim.schedule_wrap(function(self, code)
			print "Done"
			print("Code", code)
			if code ~= 0 then
				local result = vim.deepcopy(self:result())
				vim.list_extend(result, self:stderr_result())

				P(result)

				vim.fn.setqflist(result, "r")
			end

			vim.bo[float.bufnr].readonly = true
			vim.bo[float.bufnr].buftype = "nofile"
			vim.bo[float.bufnr].modified = false
			vim.bo[float.bufnr].modifiable = false
			vim.opt_local.wrap = false
		end),
	})
	:start()
end

nvim_dev.run = function(command, args)
	local float = plenary_window.percentage_range_window(0.9, 0.8)
	local count = 0

	local closing_keys = { "q", "<Esc>", "<CR>" }
	local map_options = {
		noremap = true,
		silent = true,
	}

	for _, key in ipairs(closing_keys) do
		vim.api.nvim_buf_set_keymap(float.bufnr, "n", key, "<CMD>close!<CR>", map_options)
	end

	Job
	:new({
		command = string.format("./%s", command),
		args = args,

		on_stdout = vim.schedule_wrap(function(_, data)
			vim.api.nvim_buf_set_lines(float.bufnr, count, count + 1, false, { data })
			count = count + 1
			print(data)
		end),

		on_stderr = vim.schedule_wrap(function(_, data)
			print(data)
		end),

		on_exit = vim.schedule_wrap(function(self, code)
			print "Done"
			print("Code", code)
			if code ~= 0 then
				local result = vim.deepcopy(self:result())
				vim.list_extend(result, self:stderr_result())

				P(result)

				vim.fn.setqflist(result, "r")
			end

			vim.bo[float.bufnr].readonly = true
			vim.bo[float.bufnr].buftype = "nofile"
			vim.bo[float.bufnr].modified = false
			vim.bo[float.bufnr].modifiable = false
			vim.opt_local.wrap = false
		end),
	})
	:start()
end

nvim_dev.app = function(command, args)
	local float = plenary_window.percentage_range_window(0.9, 0.8)
	local count = 0

	local closing_keys = { "q", "<Esc>", "<CR>" }
	local map_options = {
		noremap = true,
		silent = true,
	}

	for _, key in ipairs(closing_keys) do
		vim.api.nvim_buf_set_keymap(float.bufnr, "n", key, "<CMD>close!<CR>", map_options)
	end

	Job
	:new({
		command = command,
		args = args,

		on_stdout = vim.schedule_wrap(function(_, data)
			vim.api.nvim_buf_set_lines(float.bufnr, count, count + 1, false, { data })
			count = count + 1
			print(data)
		end),

		on_stderr = vim.schedule_wrap(function(_, data)
			print(data)
		end),

		on_exit = vim.schedule_wrap(function(self, code)
			print "Done"
			print("Code", code)
			if code ~= 0 then
				local result = vim.deepcopy(self:result())
				vim.list_extend(result, self:stderr_result())

				P(result)

				vim.fn.setqflist(result, "r")
			end

			vim.bo[float.bufnr].readonly = true
			vim.bo[float.bufnr].buftype = "nofile"
			vim.bo[float.bufnr].modified = false
			vim.bo[float.bufnr].modifiable = false
			vim.opt_local.wrap = false
		end),
	})
	:start()
end

return nvim_dev
