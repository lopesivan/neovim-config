-- vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.o.completeopt = "menu,menuone,noselect"

-- Don't show the dumb matching stuff.
vim.opt.shortmess:append "c"

-- local types = require "cmp.types"

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0
        and vim.api
                .nvim_buf_get_lines(0, line - 1, line, true)[1]
                :sub(col, col)
                :match "%s"
            == nil
end

local cmp = require "cmp"
local cmp_ultisnips_mappings = require "cmp_nvim_ultisnips.mappings"

-- If you want insert `(` after select function or method item
local cmp_autopairs = require "nvim-autopairs.completion.cmp"

cmp.event:on(
    "confirm_done",
    cmp_autopairs.on_confirm_done { map_char = { tex = "" } }
)
-- add a lisp filetype (wrap my-function), FYI: Hardcoded = { "clojure", "clojurescript", "fennel", "janet" }
-- cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"

local sources = {
    { name = "ultisnips" },
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "treesitter" },
    { name = "path" },
    { name = "buffer", keyword_length = 5 },
    { name = "jptemplate", keyword_length = 3 },
    { name = "dictionary", keyword_length = 5 },
    -- { name = "look", keyword_length=3, options={ convert_case=true, loud=true } }
}

local mapping = {
    ["<C-n>"] = cmp.mapping.select_next_item {
        behavior = cmp.SelectBehavior.Insert,
    },
    ["<C-p>"] = cmp.mapping.select_prev_item {
        behavior = cmp.SelectBehavior.Insert,
    },
    ["<Down>"] = cmp.mapping.select_next_item {
        behavior = cmp.SelectBehavior.Insert,
    },
    ["<Up>"] = cmp.mapping.select_prev_item {
        behavior = cmp.SelectBehavior.Insert,
    },
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<c-y>"] = cmp.mapping.confirm { select = true },

    ["<c-space>"] = cmp.mapping {
        i = cmp.mapping.complete(),
        c = function(
            _ --[[fallback]]
        )
            if cmp.visible() then
                if not cmp.confirm { select = true } then
                    return
                end
            else
                cmp.complete()
            end
        end,
    },

    -- Testing
    ["<c-q>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
    },

    ["<c-j>"] = cmp.mapping(function(fallback)
        cmp_ultisnips_mappings.compose { "jump_forwards" }(fallback)
    end, { "i", "s" }),
    ["<c-k>"] = cmp.mapping(function(fallback)
        cmp_ultisnips_mappings.jump_backwards(fallback)
    end, { "i", "s" }),
    ["<Tab>"] = cmp.mapping(function(fallback)
        cmp_ultisnips_mappings.compose { "select_next_item", "jump_forwards" }(
            fallback
        )
    end, { "i", "s" }),

    --[[ ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
        elseif neogen.jumpable() then
            neogen.jump_next()
        elseif has_words_before() then
            cmp.complete()
        else
            fallback()
        end
    end, {
        "i",
        "s",
        -- "c",
    }), ]]
    ["<S-Tab>"] = cmp.mapping(function(fallback)
        cmp_ultisnips_mappings.jump_backwards(fallback)
    end, { "i", "s" }),
    ["<c-a>"] = cmp.mapping {
        i = function(fallback)
            cmp_ultisnips_mappings.compose { "expand", "select_next_item" }(
                fallback
            )
        end,
    },
}

local sorting = {
    -- TODO: Would be cool to add stuff like "See variable names before method names" in rust, or something like that.
    comparators = {
        cmp.config.compare.offset,
        cmp.config.compare.exact,
        cmp.config.compare.score,

        -- copied from cmp-under, but I don't think I need the plugin for this.
        -- I might add some more of my own.
        function(entry1, entry2)
            local _, entry1_under = entry1.completion_item.label:find "^_+"
            local _, entry2_under = entry2.completion_item.label:find "^_+"
            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0
            if entry1_under > entry2_under then
                return false
            elseif entry1_under < entry2_under then
                return true
            end
        end,

        cmp.config.compare.kind,
        cmp.config.compare.sort_text,
        cmp.config.compare.length,
        cmp.config.compare.order,
    },
}

local menu = {
    ultisnips = "[Ult]",
    jptemplate = "[JP]",
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    treesitter = "[T]",
    look = "[L]",
    nvim_lua = "[api]",
    path = "[path]",
    dictionary = "[D]",
}

local format = function(entry, vim_item)
    -- Kind icons
    vim_item.kind =
        string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
    -- Source
    vim_item.menu = (menu)[entry.source.name]
    return vim_item
end

cmp.setup {
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },

    -- window = {
    --     -- completion = cmp.config.window.bordered(),
    --     documentation = cmp.config.window.bordered(),
    -- },
    window = {
        documentation = {
            border = {
                "╭",
                "─",
                "╮",
                "│",
                "╯",
                "─",
                "╰",
                "│",
            },
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:TelescopeBorder",
        },
    },

    mapping = cmp.mapping.preset.insert(mapping),
    sources = sources,
    sorting = sorting,

    formatting = {
        -- Youtube: How to set up nice formatting for your sources.
        format = format,
        -- format = lspkind.cmp_format {
        --     with_text = true,
        --     menu = menu,
        -- },
    },

    view = {
        entries = "native",
    },

    experimental = {
        -- I like the new menu better! Nice work hrsh7th
        native_menu = false,

        -- Let's play with this for a day or two
        ghost_text = true,
    },
} -- end setup

vim.keymap.set(
    "n",
    "<leader><leader>s",
    "<cmd>call UltiSnips#RefreshSnippets() <CR>",
    { desc = "reload my snippets" }
)

-- _ = vim.cmd [[
--   augroup CmpMarkdown
--     au!
--     autocmd Filetype markdown lua require'cmp'.setup.buffer {
--         sources = {
-- 			{ name = "look", keyword_length=3,
-- 				options={
-- 					convert_case=true,
-- 					loud=true
-- 				}
-- 			}
--         }
--     }
--   augroup END
-- ]]
-- Youtube: customizing appearance
--
-- nvim-cmp highlight groups.
local Group = require("colorbuddy.group").Group
local g = require("colorbuddy.group").groups
local s = require("colorbuddy.style").styles

Group.new("CmpItemAbbr", g.Comment)
Group.new("CmpItemAbbrDeprecated", g.Error)
Group.new("CmpItemAbbrMatchFuzzy", g.CmpItemAbbr.fg:dark(), nil, s.italic)
Group.new("CmpItemKind", g.Special)
Group.new("CmpItemMenu", g.NonText)
