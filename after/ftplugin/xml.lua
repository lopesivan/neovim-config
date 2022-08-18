-- programa em lua

vim.opt.foldmethod="syntax"
vim.opt.foldcolumn="1"
vim.opt.foldlevel=999
vim.opt.foldminlines=1
vim.opt.foldtext="XMLFoldText()"

vim.opt.fillchars="fold: "
vim.g.xml_syntax_folding = 1
vim.opt.equalprg="xmllint --format --recover - 2>/dev/null"

