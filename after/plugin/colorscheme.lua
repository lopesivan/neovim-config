if not pcall(require, "colorbuddy") then
  return
end

-- require("colorbuddy").colorscheme "gruvbuddy"
-- require("colorbuddy").colorscheme "kanagawa"
require("colorbuddy").colorscheme "adwaita"

local c = require("colorbuddy.color").colors
local Group = require("colorbuddy.group").Group
local g = require("colorbuddy.group").groups
local s = require("colorbuddy.style").styles

local Color = require('colorbuddy.init').Color

-- local c = require("colorbuddy.color").colors
-- local Group = require("colorbuddy.group").Group
-- local s = require("colorbuddy.style").styles

Color.new('yellowMatchParen', '#d7ff00')
Color.new('yellowVisual', '#ffcd07')
Color.new('blueFolded', '#0478A4')
Color.new('cursor', '#333842')

Group.new("GoTestSuccess", c.green, nil, s.bold)
Group.new("GoTestFail", c.red, nil, s.bold)

-- Group.new('Keyword', c.purple, nil, nil)

Group.new("TSPunctBracket", c.orange:light():light())

Group.new("StatuslineError1", c.red:light():light(), g.Statusline)
Group.new("StatuslineError2", c.red:light(), g.Statusline)
Group.new("StatuslineError3", c.red, g.Statusline)
Group.new("StatuslineError3", c.red:dark(), g.Statusline)
Group.new("StatuslineError3", c.red:dark():dark(), g.Statusline)

Group.new("pythonTSType", c.red)
Group.new("goTSType", g.Type.fg:dark(), nil, g.Type)

Group.new("typescriptTSConstructor", g.pythonTSType)
Group.new("typescriptTSProperty", c.blue)

Group.new("markdownCodeBlock",c.black, c.yellowVisual, s.bold)

Group.new("Visual", c.black, c.yellowVisual, s.bold)
-- Group.new("Normal", nil, c.black, nil)
Group.new("Folded", c.wheat, c.blueFolded, nil)
Group.new("SignColumn", nil, nil, nil)
Group.new("LineNr", nil, c.black, nil)

Group.new("WhichKey", c.red, nil, nil)
Group.new("WhichKeySeperator", c.green, nil, nil)
Group.new("WhichKeyGroup", c.yellow, nil, nil)
Group.new("WhichKeyDesc", c.blue, nil, nil)

Group.new("CursorLine", nil, c.cursor, nil)
Group.new("CursorColumn", nil, c.cursor, nil)
Group.new("MatchParen", c.black, c.yellowMatchParen, s.bold)
Group.new("ColorColumn", nil, c.DarkRed, nil)

-- hop
Group.new("HopNextKey", c.black, c.yellowVisual, s.bold)
Group.new("HopNextKey1", c.red:dark(), nil, s.bold)
Group.new("HopNextKey2", c.red:saturate(), nil)

-- hi  cterm=bold,reverse ctermfg=0 ctermbg=190 gui=bold,reverse guifg=#000000 guibg=#d7ff00

--[[
local group = vim.api.nvim_create_augroup("qs_colors", {clear = true})
vim.api.nvim_create_autocmd("ColorScheme", {
    group   = group,
    pattern = "*",
    callback = function()
      vim.api.nvim_set_hl(0, "QuickScopePrimary",   { bold = true, fg="#cc6666", bg="Yellow", sp=nil })
      vim.api.nvim_set_hl(0, "QuickScopeSecondary", { bold = true, ctermfg='121', fg="Green", bg="Yellow" })
    end,
})
]]



--[[
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary gui=bold guifg='#cc6666' guibg=yellow guisp=none
  autocmd ColorScheme * highlight QuickScopeSecondary ctermfg=121 gui=bold guifg=Green guibg=yellow
augroup END augroup END
]]
--
--[[
" colorscheme vim-hardaway
"color begin
" enable to make the background transparent
" highlight normal guibg=none ctermbg=none
" fundo preto
highlight Normal guibg=Black ctermbg=Black
"hi SignColumn  ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE

hi Visual cterm=bold ctermfg=0 ctermbg=190 gui=bold guibg=#ffcd07 guifg=#000000
hi WarningMsg guibg=#303030 guifg=#fcdf07
hi ErrorMsg   guibg=#303030 guifg=#ee3b3b
hi CursorLine guibg=#37474f
hi ColorColumn ctermbg=1 guibg=DarkRed
hi Pmenu ctermbg=242 guibg=#121212
hi PmenuSel ctermfg=49 ctermbg=233 gui=bold guifg=#00ffaf guibg=#121212
hi MatchParen cterm=bold,reverse ctermfg=0 ctermbg=190 gui=bold,reverse guifg=#000000 guibg=#d7ff00
hi LineNr ctermfg=141 guifg=#af87ff guibg=#000000
hi FoldColumn guibg=#000000
hi Folded guibg=#0478A4 guifg=wheat
]]


-- I don't think I like highlights for text
-- Group.new("LspReferenceText", nil, c.gray0:light(), s.bold)
-- Group.new("LspReferenceWrite", nil, c.gray0:light())

-- Group.new("TSKeyword", c.purple, nil, s.underline, c.blue)
-- Group.new("LuaFunctionCall", c.green, nil, s.underline + s.nocombine, g.TSKeyword.guisp)
