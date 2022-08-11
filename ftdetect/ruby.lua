vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
-- group = group,
pattern  = { "*.rb" ,"*.rbw" ,"*.gemspec" },
callback = function()
   vim.bo.filetype = "ruby"
end,
})
