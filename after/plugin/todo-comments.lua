-- todo-comments.lua - todo-comments
-- Maintainer: Ivan Lopes
-- ~/.config/nvim/after/plugin

local has_todo_comments, todo_comments = pcall(require, "todo-comments")
if not has_todo_comments then
    return
end

todo_comments.setup({ keywords = { TODO = { alt = { "WIP" } } } })

-- PERF: fully optimised
-- HACK: hmmm, this looks a bit funky
-- TODO: What else?
-- NOTE: adding a note
-- FIX: this needs fixing
-- WARNING: ???
-- FIX: ddddd
-- vim: fdm=marker:sw=4:sts=4:et
