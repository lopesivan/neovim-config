local sorters = require "telescope.sorters"

TelescopeMapArgs = TelescopeMapArgs or {}

local map_tele = function(key, f, desc, options, buffer)
    local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

    TelescopeMapArgs[map_key] = options or {}

    local mode = "n"
    local rhs = string.format(
        "<cmd>lua R('config.telescope')['%s'](TelescopeMapArgs['%s'])<CR>",
        f,
        map_key
    )

    local map_options = {
        noremap = true,
        silent = true,
        desc = desc,
    }

    if not buffer then
        vim.keymap.set(mode, key, rhs, map_options)
        -- vim.api.nvim_set_keymap(mode, key, rhs, map_options)
    else
        vim.api.nvim_buf_set_keymap(0, mode, key, rhs, map_options)
    end
end

vim.api.nvim_set_keymap(
    "c",
    "<c-r><c-r>",
    "<Plug>(TelescopeFuzzyCommandSearch)",
    { noremap = false, nowait = true }
)

-- Dotfiles
-- map_tele("<leader>en", "edit_neovim")
-- map_tele("<leader>ez", "edit_zsh")

-- Search
-- TODO: I would like to completely remove _mock from my search results here when I'm in SG/SG
map_tele("<space>fgw", "grep_string", "Telescope: grep word under cursor", {
    short_path = true,
    word_match = "-w",
    only_sort_text = true,
    layout_strategy = "vertical",
    sorter = sorters.get_fzy_sorter(),
})

map_tele("<space>fg/", "grep_last_search", "Telescope: grep with last search", {
    layout_strategy = "vertical",
})

-- tags
-- map_tele("<Leader>th", "help_tags", "Telescope: help tags")

-- map_tele('<Leader>fR', 'redis_list', "Telescope: redis list")

-- map_tele('<Leader>te', 'my_examples', "Telescope: meus exemplos")
vim.api.nvim_set_keymap(
    "n",
    "<Leader>te",
    "<CMD>luafile "
        .. string.format("%s/%s", vim.fn.stdpath "config", "lua/config")
        .. "/examples.lua<CR>",
    { desc = "Telescope: meus exemplos", noremap = false, nowait = true }
)

map_tele("<Leader>.", "fd", "Telescope: find (fd)")
map_tele("<Leader>ff", "fd", "Telescope: find (fd)")
map_tele("<Leader>fq", "quickfix", "Telescope: Quickfix List")

-- devo digitar a extensão/tipo -grep por extensão
map_tele(
    "<Leader>fge",
    "search_only_certain_files",
    "Telescope: grep por extensão"
)

-- Git
map_tele("<Leader>gg", "buffer_git_files", "Telescope: git files")
map_tele("<Leader>gtf", "buffer_git_files", "Telescope: git files")
map_tele("<Leader>gtb", "git_branches", "Telescope: git branches")
map_tele("<Leader>gtc", "git_commits", "Telescope: git Commit")
map_tele("<Leader>gts", "git_status", "Telescope: git Status")

-- my functions
map_tele("<Leader>/", "multi_rg", "Telescope: Live grep")
-- map_tele('<Leader>/', 'live_grep',"Telescope: Live grep")
-- map_tele("<space>fgm", "multi_rg")

map_tele("<Leader>fr", "oldfiles", "Telescope: arquivos recentes")
map_tele("<Leader>M", "man_pages", "Telescope: man pages")
-- map_tele('<Leader>tt',   'my_template', "Telescope: template")
vim.api.nvim_set_keymap(
    "n",
    "<Leader>N",
    "<CMD>luafile "
        .. string.format("%s/%s", vim.fn.stdpath "config", "lua/libuv")
        .. "/new_file_plenary_async.lua<CR>",
    { desc = "New file", noremap = false, nowait = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>tt",
    "<CMD>luafile "
        .. string.format(
            "%s/%s",
            vim.fn.stdpath "config",
            "lua/config/telescope"
        )
        .. "/my_template.lua<CR>",
    { desc = "Telescope: template", noremap = false, nowait = true }
)

vim.api.nvim_set_keymap(
    "n",
    "<Leader>tl",
    "<CMD>Telescope yabs tasks<CR>",
    { desc = "Telescope: task list", noremap = false, nowait = true }
)

map_tele("<Leader>pp", "my_project", "Telescope: projects")
map_tele("<Leader>sd", "short_docs", "Telescope: docs")
map_tele("<Leader>ldoc", "edit_ldoc", "Telescope: ldoc")
map_tele("<Leader>pdoc", "edit_pdoc", "Telescope: pdoc")
map_tele("<Leader>tnv", "edit_neovim", "Telescope: neovim")

return map_tele
