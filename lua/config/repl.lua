if false then
  RELOAD "config.repl"
end

local M = {}

_ReplCurrentJobID = _ReplCurrentJobID or -1
_ReplCurrentCommand = _ReplCurrentCommand or nil

M.set_job_id = function(job_id)
  job_id = job_id or vim.b.terminal_job_id

  print("setting job id..", job_id)
  _ReplCurrentJobID = job_id
end

M.set_job_command = function(command)
  _ReplCurrentCommand = command or vim.fn.input "Send to chan >"
end

M.send_to_term = function(input)
  input = input or _ReplCurrentCommand or vim.fn.input "Send to chan >"

  vim.fn.chansend(_ReplCurrentJobID, { input .. "\r\n" })
end

-- get pid
vim.api.nvim_set_keymap("n", "<F5>", '<cmd>lua require("config.repl").set_job_id()<CR>', { noremap = true })
-- escreve comando
vim.api.nvim_set_keymap("n", "<F6>", '<cmd>lua require("config.repl").set_job_command()<CR>', { noremap = true })
-- envia comando
vim.api.nvim_set_keymap("n", "<F7>", '<cmd>lua require("config.repl").send_to_term()<CR>', { noremap = true })

return M
