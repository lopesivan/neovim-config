vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
-- group = group,
pattern  = { "configure.ac" },
callback = function()
   vim.bo.filetype = "autotools"
end,
})
