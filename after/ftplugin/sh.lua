vim.opt.tabstop     = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth  = 4
vim.opt.textwidth   = 78

vim.opt.expandtab   = true
vim.opt.wrap        = false
vim.opt.smartcase   = true
vim.opt.infercase   = true

vim.opt.commentstring = "# %s"

vim.g.VimuxPromptString = "bash"
vim.g.VimuxRunnerType = "window"
vim.g.VimuxRunnerName = "+Bash"
vim.g.VimuxCloseOnExit = 1
vim.g.projectionist_heuristics = {
  ['*.sh'] = {
    ['*.sh'] = {
   --    ['dispatch'] = 'bash {file|basename}',
   --    ['make'] = 'bash {file|basename}',
      ['async_run'] = 'AsyncRun -mode=term -pos=tmux bash {file|basename}',
      ['quit'] = 'call VimuxCloseRunner()',
      ['run'] = 'lua require(\'config.nvim_dev\').sh({\'{file|basename}\'})',
   --    ['yabs']= 'run',
      ['type'] = 'sh'
    }
  }
}
-- <CMD>lua require('config.nvim_dev').sh(vim.fn.expand("%"))<CR>
local nmap = require("config.dispatch").nmap
nmap {'<leader><CR>', 'run', 'nvim_dev Run'}
nmap {'<leader><leader><CR>', 'async_run', 'Async Run'}
nmap {'<leader><leader>q', 'quit', 'Close window'}
-- nmap {'r<CR>', 'yabs', 'Run'}
-- nmap {'m<CR>', 'make', 'Make'}
-- nmap {'d<CR>', 'dispatch', 'Dispatch'}
