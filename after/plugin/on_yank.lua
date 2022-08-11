-- on_yank.lua - on_yank
-- Maintainer: Ivan Lopes
-- ~/.config/nvim/after/plugin

local group = vim.api.nvim_create_augroup("LuaHighlight", {clear = true})

vim.api.nvim_create_autocmd("TextYankPost", {
    group    = group,
    pattern  = "*",
    callback = function() vim.highlight.on_yank({
        higroup  = "Substitute",
        timeout  = 150,
        on_macro = true
        })
    end,
})

-- vim: fdm=marker:sw=4:sts=4:et
