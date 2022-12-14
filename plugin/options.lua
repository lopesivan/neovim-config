-- This will be available for everyone when I merge:
--  https://github.com/neovim/neovim/pull/13479
-- Until then, you can check out `./lua/tj/globals/opt.lua
local opt = vim.opt
-- local g = vim.g

-- Remap leader and local leader to <Space>
-- api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
-- vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
-- g.mapleader = " "
-- g.maplocalleader = ","

-- Better search
opt.path:remove "/usr/include"
opt.path:append "**"
-- vim.cmd [[set path=.,,,$PWD/**]] -- Set the path directly

opt.wildignorecase = true
-- Ignore compiled files
opt.wildignore = "__pycache__"
opt.wildignore = opt.wildignore + { "*.o", "*~", "*.pyc", "*pycache*" }

opt.wildignore:append "**/node_modules/*"
opt.wildignore:append "**/.git/*"

opt.wildmode = { "longest", "list", "full" }

-- Cool floating window popup menu for completion on command line
opt.pumblend = 17

opt.wildmode = opt.wildmode - "list"
opt.wildmode = opt.wildmode + { "longest", "full" }

opt.wildoptions = "pum"

opt.showmode = true
opt.showcmd = true

opt.fileformats = { "unix", "dos", "mac" }
opt.backspace = { "indent", "eol", "start" }
-- opt.shell          = '/usr/local/bin/bash'

local shell =
    string.format("bash --rcfile %s/bashrc", vim.fn.stdpath "config")
opt.shell = shell

opt.cmdheight = 2 -- Height of the command bar
opt.incsearch = true -- Makes search act like search in modern browsers
opt.showmatch = true -- show matching brackets when text indicator is over them
opt.relativenumber = true -- Show line numbers
-- opt.number         = true -- But show the actual number for the line we're on
opt.number = true -- But show the actual number for the line we're on
opt.ignorecase = true -- Ignore case when searching...
opt.smartcase = true -- ... unless there is a capital letter in the query
opt.hidden = true -- I like having buffers stay around
opt.cursorline = true -- Highlight the current line
opt.cursorcolumn = true

opt.equalalways = false -- I don't like my windows changing all the time
opt.splitright = true -- Prefer windows splitting to the right
opt.splitbelow = true -- Prefer windows splitting to the bottom
opt.updatetime = 1000 -- Make updates happen faster
opt.hlsearch = true -- I wouldn't use this without my DoNoHL function

--  TODO: ????    > essa linha centraliza o cursor no meio da pagina
--opt.scrolloff      = 10    -- Make it so there are always ten lines below my cursor

opt.tags = { "./tags" }

-- Tabs
opt.autoindent = true
opt.cindent = true
opt.wrap = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.textwidth = 78

opt.breakindent = true
opt.showbreak = string.rep(" ", 3) -- Make it so that long lines wrap smartly
opt.linebreak = true

-- opt.foldmethod = "marker"
-- opt.foldlevel  = 0
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldtext = "FoldText()"
opt.foldlevel = 20
opt.foldlevelstart = 20
opt.modelines = 1

-- opt.belloff = "all" -- Just turn the dang bell off

opt.clipboard = "unnamedplus"

opt.inccommand = "split"
opt.swapfile = false -- Living on the edge
opt.shada = { "!", "'1000", "<50", "s10", "h" }

opt.bomb = true
opt.binary = true
opt.ttyfast = true

opt.mouse = "a" --Enable mouse mode
-- opt.mouse = "n"
opt.laststatus = 3 -- Global statusline
opt.termguicolors = true

opt.visualbell = true
-- opt.virtualedit    = 'all'
opt.virtualedit = "block"

-- Change to use lualine.nvim
-- opt.winbar = "%{%v:lua.require'config.winbar'.get_winbar()%}"

-- go to previous/next line with h,l,left arrow and right arrow when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"

-- disable nvim intro
opt.shortmess:append "sI"

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fileencodings = "utf-8"

opt.colorcolumn = "79"

-- Toda vez que voc?? fecha um par??ntese, colchete ou chave, o Vi mostra onde
-- este foi aberto. Caso n??o haja nenhum aberto para este, deixa em vermelho
-- par??nteses ou chaves que n??o t??m um par.
opt.sm = true

-- Antes de sobrescrever um arquivo mant??m um backup do mesmo
-- por exemplo, ap??s salvar um arquivo de nome Alfa.txt, o vim cria uo
-- outro arquivo chamado Alfa.txt~ com a configura????o anterior do arquivo
-- antes do mesmo ser alterado
opt.backup = true
opt.backupcopy = "yes"
opt.backupdir = string.format("%s/%s", vim.fn.stdpath "config", "backup")
opt.directory = string.format("%s/%s", vim.fn.stdpath "config", "tmp")

-- Ganhamos a op????o de guardar nossos undos! Para isso, ?? s?? ativar com
opt.undofile = true

-- Isso far?? com que arquivos de undo sejam gravados no diret??rio corrente, e
-- manter?? o seu hist??rico de undo's mesmo que voc?? feche o arquivo! L??gico
-- que o diret??rio corrente pode ficar uma bagun??a, ainda mais se for de algum
-- projeto que estamos utilizando controle de vers??o, ent??o para isso existe a
-- op????o de indicar onde os arquivos de undo ser??o gravados:
opt.undodir = string.format("%s/%s", vim.fn.stdpath "config", "undo")

-- The command line is used to display echodoc
vim.g.echodoc_enable_at_startup = 1

-- Habilita a mudanca de coluna quando movimenta-se atraves das linhas
opt.startofline = true

-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
-- TODO: w, {v, b, l}
opt.formatoptions = opt.formatoptions
    - "a" -- Auto formatting is BAD.
    - "t" -- Don't auto format my code. I got linters for that.
    + "c" -- In general, I like it when comments respect textwidth
    + "q" -- Allow formatting comments w/ gq
    - "o" -- O and o, don't continue comments
    + "r" -- But do continue when pressing enter.
    + "n" -- Indent past the formatlistpat, not underneath it.
    + "j" -- Auto-remove comments if possible.
    - "2" -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }

--[[
-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
-- TODO: w, {v, b, l}
opt.formatoptions = opt.formatoptions
  - "a" -- Auto formatting is BAD.
  - "t" -- Don't auto format my code. I got linters for that.
  + "c" -- In general, I like it when comments respect textwidth
  + "q" -- Allow formatting comments w/ gq
  - "o" -- O and o, don't continue comments
  + "r" -- But do continue when pressing enter.
  + "n" -- Indent past the formatlistpat, not underneath it.
  + "j" -- Auto-remove comments if possible.
  - "2" -- I'm not in gradeschool anymore

-- set joinspaces
opt.joinspaces = false -- Two spaces and grade school, we're done

-- set fillchars=eob:~
opt.fillchars = { eob = "~" }
--]]
--
