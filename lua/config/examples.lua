local actions      = require "telescope.actions"
local action_state = require "telescope.actions.state"
local pickers      = require "telescope.pickers"
local finders      = require "telescope.finders"
local sorters      = require "telescope.sorters"
local dropdown     = require "telescope.themes".get_dropdown()
local scan         = require "plenary.scandir"
local filetype     = require "plenary.filetype"

local function file_exists(fname)
  local stat = vim.loop.fs_stat(fname)
  return (stat and stat.type) or false
end

local function enter(prompt_bufnr)
  local selected = action_state.get_selected_entry()
  actions.close(prompt_bufnr)

  vim.cmd [[20new]]
  -- vim.cmd("vsplit")
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(true, false)
  vim.api.nvim_win_set_buf(win, buf)
  vim.api.nvim_buf_set_name(buf, selected.display)

  if file_exists(selected.filename) then
	vim.cmd("0r "..selected.filename)
	vim.bo.filetype = filetype.detect_from_extension(selected.display)
	-- vim.api.nvim_command('write')
  else
	print("Não encontrei o template:", selected.display)
  end

end

-- local home    = vim.env.HOME
-- local cwd     = '.config/nvim/w/data/example'
-- local path    = string.format("%s/%s",home, cwd)
-- local files   = scan.scan_dir(path, { hidden = true, depth = 1 })

local cwd     = 'w/data/example'
local stdpath = vim.fn.stdpath('config')
local path    = string.format("%s/%s",stdpath, cwd)
local files   = scan.scan_dir(path, { hidden = true, depth = 1 })

local acceptable_files = {}
for _, v in ipairs(files) do
  table.insert(acceptable_files, vim.fn.fnamemodify(v, ":t"))
end

local opts = {
  finder = finders.new_table {
	results = acceptable_files,
	entry_maker = function(line)
	  return {
		ordinal = line,
		display = line,
		filename = path.."/" .. line,
	  }
	end,
  },
  -- sorter = sorters.get_generic_fuzzy_sorter({}),
  sorter = require("telescope").extensions.fzy_native.native_fzy_sorter(),

  attach_mappings = function(prompt_bufnr, map)
	map("i", "<CR>", enter)
	return true
  end

}

local picker = pickers.new(dropdown, opts)

picker:find()

--vim: set ft=lua nowrap:
