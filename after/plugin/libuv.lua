local map = vim.api.nvim_set_keymap
-- local c = vim.api.nvim_command

-- c([[ command! -nargs=+ -complete=dir -bar Trep lua require'libuv.ripgrep'.asyncGrep(<q-args>) ]])

-- c([[ command! -bar PandocMarkdown lua require'libuv.markdown'.convertFile() ]])


-- wiki functions
local function m(lua_module, lua_fun)
  return string.format("<CMD>lua R('libuv.%s').%s<CR>",
  lua_module, lua_fun)
end

-- <Leader>te
-- map('n',
--   "<F5>",
--   m("example", "load()"),
--   { noremap = true, desc ="test my function" })


vim.api.nvim_create_user_command("ConvertTo",
  function(filetype)
	print("convert to " .. filetype.args)
	require('libuv.markdown').convertFile(filetype.args)
  end,
  {
    nargs = "*",
    desc = "Convert using pandoc",
  }
)

-- c([[
-- command ExecuteLine lua require"exec-cursorline-insert-stdout".execute{prepare_for_next_command = true}
-- ]])


-- ---------------------------------------------------------------------------
--  ExecuteLine
-- ---------------------------------------------------------------------------
local function execute_line()
  require('exec-cursorline-insert-stdout').execute{
	prepare_for_next_command = true
  }
end

vim.api.nvim_create_user_command(
  'ExecuteLine',
  execute_line,
  { range = true })

