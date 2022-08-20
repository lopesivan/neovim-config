-- terminal.lua - terminal
-- Maintainer: Ivan Lopes
-- ~/.config/nvim/after/plugin

function _G.set_terminal_keymaps()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<m-Up>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(
        0,
        "t",
        "<m-Down>",
        [[<C-\><C-n><C-W>j]],
        opts
    )
    vim.api.nvim_buf_set_keymap(
        0,
        "t",
        "<m-Left>",
        [[<C-\><C-n><C-W>h]],
        opts
    )
    vim.api.nvim_buf_set_keymap(
        0,
        "t",
        "<m-Right>",
        [[<C-\><C-n><C-W>l]],
        opts
    )
end

vim.cmd [[
augroup FormatAutogroup
    autocmd!
    autocmd TermOpen term://* lua set_terminal_keymaps()
augroup END
]]

-- vim: fdm=marker:sw=4:sts=4:et
