-- ruby.lua - ruby
-- Maintainer: Ivan Lopes
-- ~/.config/nvim/after/plugin

vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.textwidth   = 78

vim.opt.expandtab   = true
vim.opt.wrap        = false
vim.opt.smartcase   = true
vim.opt.infercase   = true

vim.g.VimuxPromptString = "ruby"
vim.g.VimuxRunnerType = "window"
vim.g.VimuxRunnerName = "+RUBY"
vim.g.VimuxCloseOnExit = 1
vim.g.projectionist_heuristics = {
  ['*.rb'] = {
    ['*.rb'] = {
      ['start'] = 'irb -I . -r ./{file|basename}',
      ['dispatch'] = 'ruby {file} >{}.out',
      ['async_run'] = 'AsyncRun -mode=term -pos=tmux ruby {file|basename}',
	  -- ['yabs2']= 'save_output',
      ['quit'] = 'call VimuxCloseRunner()',
      ['run'] = 'lua require(\'config.nvim_dev\').app(\'ruby\',{\'{file|basename}\'})',
      ['type'] = 'ruby'
    }
  }
}

local nmap = require("config.dispatch").nmap
nmap {'s<CR>', 'start', 'Octave Interativo'}
nmap {'<leader><CR>', 'run', 'nvim_dev Run'}
nmap {'<leader><leader><CR>', 'async_run', 'Async Run'}
nmap {'<leader><leader>q', 'quit', 'Close window'}
-- nmap {'r<CR>', 'yabs', 'Run'}
-- nmap {'m<CR>', 'make', 'Make'}
nmap {'d<CR>', 'dispatch', 'Dispatch'}
-- vim: fdm=marker:sw=4:sts=4:et
