require'hop'.setup()

vim.api.nvim_set_keymap("n", "<M-/>", ":HopWord<CR>", { silent = true, noremap = false })

