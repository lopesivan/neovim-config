vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.textwidth   = 78

vim.opt.expandtab   = true
vim.opt.wrap        = false
vim.opt.smartcase   = true
vim.opt.infercase   = true

-- vim.opt.equalprg="astyle --pad-first-paren-out --style=linux -A1 --indent=spaces=4 --convert-tabs"
-- vim.opt.path={".", "/usr/include/", "/usr/local/bin/"}

-- vim.b['surround_'..vim.fn.char2nr('1')]='<CMD>\r<CR>'
-- vim.b['surround_'..vim.fn.char2nr('2')]='<CMD>lua \r<CR>'
-- vim.b['surround_'..vim.fn.char2nr('3')]='print(vim.inspect(\r))'
-- vim.b['surround_'..vim.fn.char2nr('q')]='"\r"'
-- vim.b['surround_'..vim.fn.char2nr('d')]='printf("DEBUG: %s = %\1formatação:\1","\r",kkk);'
-- vim.b["surround_" .. vim.fn.char2nr("c")] = "\\\1command: \1{\r}"
-- vim.b["surround_" .. vim.fn.char2nr("e")] =
--   "\\begin{\1environment: \1}\n\t\r\n\\end{\1\1}"

vim.g.projectionist_heuristics = {
	['*.kt']     = {
		['*.kt'] = {
			['start']     = 'kotlinc-jvm',
			['make']      = 'kotlinc {file|basename} -include-runtime -d {}.jar',
			['dispatch']  = 'java -jar {}.jar',
			['telescope'] = 'Telescope yabs tasks',
			['type']      = 'kotlin'
		}
	}
}

local nmap = require("config.dispatch").nmap
nmap {'<leader><CR>', 'telescope', 'build maneger'}
nmap {'m<CR>', 'make', 'Make'}
nmap {'d<CR>', 'dispatch', 'Dispatch'}
nmap {'s<CR>', 'start', 'kotlin Interativo'}


vim.g.easy_align_delimiters = {
  -- aperto f
  ['f'] = {
      ['pattern'] = ' \\ze\\S\\+\\s*[;=]',
      ['left_margin'] = 0,
      ['right_margin'] = 0
  },

  -- aperto ]
  [']'] = {
      ['pattern'] = ']',
      ['left_margin'] = 0,
      ['right_margin'] = 0,
      ['stick_to_left'] = 0
  },

  -- aperto )
  [')'] = {
      ['pattern'] = ')',
      ['left_margin'] = 0,
      ['right_margin'] = 0,
      ['stick_to_left'] = 0
  },

  -- aperto (
  ['('] = {
      ['pattern'] = '(',
      ['left_margin'] = 0,
      ['right_margin'] = 0,
      ['stick_to_left'] = 0
  },

  -- aperto w
  ['w'] = {
      ['pattern'] = '\\w',
      ['left_margin'] = 0,
      ['right_margin'] = 0,
      ['stick_to_left'] = 0
  },

  -- aperto ,
  [','] = {
      ['pattern'] = '\\w\\+,',
      ['delimiter_align'] = 'l',
      ['left_margin'] = 0,
      ['right_margin'] = 0,
      ['stick_to_left'] = 0
  },

  -- aperto ;
  [';'] = {
      ['pattern'] = '\\w\\+;',
      ['delimiter_align'] = 'l',
      ['left_margin'] = 1,
      ['right_margin'] = 0,
      ['stick_to_left'] = 0
  }
}

vim.fn["edit_alternate#rule#add"]("kotlin", function(filename)
  if filename:find ".kt" then
	return (filename:gsub("%.kt", "quico_%.kt"))
  else
	return (filename:gsub("quico_%.kt", ".kt"))
  end
end)
-- print("This is getting sourced automatically")
