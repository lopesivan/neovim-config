if vim.fn.executable "astyle" == 0 then
    return
end

vim.cmd [[
  augroup AstyleAuto
    autocmd BufWritePre *.c,*.h,*.cpp :lua require("config.astyle").format()
  augroup END
]]
