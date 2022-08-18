-- programa em lua

vim.g.quickmenu_options = "HL"
vim.cmd([[
nmenu Go.Start  :exe " ".projectionist#query('start')[0][1]
nmenu Go.Stop   :exe " ".projectionist#query('stop')[0][1]
nmenu Go.Toggle :exe " ".projectionist#query('toggle')[0][1]
nmenu Go.toHTML :lua require'libuv.markdown'.convertFile()
nmenu Go.Slide  :lua require'telegraph'.telegraph({cmd='lookatme {filepath} --live-reload --style gruvbox-dark', how='tmux'})
]])

-- vim.api.nvim_set_keymap("n", "<space>0", "<Cmd>call projectionist#activate()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F12>", "<Cmd>call Menu2Quick('Go', 'n')<CR>", {noremap = true, silent = true})

vim.fn["edit_alternate#rule#add"]("go", function(filename)
  if filename:find "_test.go" then
	return (filename:gsub("_test%.go", ".go"))
  else
	return (filename:gsub("%.go", "_test.go"))
  end
end)
