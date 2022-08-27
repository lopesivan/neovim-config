M = {}

local whichkey = require "which-key"
local legendary = require "legendary"

local function keymappings(client, bufnr)
    print "Load LSP: mappings "
    vim.keymap.set(
        "n",
        "k",
        "<CMD>lua vim.lsp.buf.hover()<CR>",
        { buffer = bufnr }
    )

    vim.keymap.set(
        "n",
        "<space>rn",
        "<CMD>lua vim.lsp.buf.rename()<CR>",
        { desc = "Rename", buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "gd",
        "<CMD>lua vim.lsp.buf.definition()<CR>",
        { desc = "Go definition", buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "gD",
        "<CMD>lua vim.lsp.buf.declaration()<CR>",
        { desc = "Go declaration", buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "gT",
        "<CMD>lua vim.lsp.buf.type_definition()<CR>",
        { desc = "Go type definition", buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "gh",
        "<CMD>lua vim.lsp.buf.signature_help()<CR>",
        { desc = "Signature Help", buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "<leader>ca",
        "<CMD>lua vim.lsp.buf.code_action()<CR>",
        { desc = "Code Action", buffer = bufnr }
    )

    vim.keymap.set(
        "n",
        "]d",
        "<CMD>lua vim.diagnostic.goto_next()<CR>",
        { desc = "Go Next diagnostic", buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "[d",
        "<CMD>lua vim.diagnostic.goto_prev()<CR>",
        { desc = "Go Prev diagnostic", buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "[e",
        "<CMD>lua vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }<CR>",
        { desc = "Go Prev Error", buffer = bufnr }
    )
    vim.keymap.set(
        "n",
        "]e",
        "<CMD>lua vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }<CR>",
        { desc = "Go Next Error", buffer = bufnr }
    )

    -- Whichkey
    local keymap_l = {
        l = {
            name = "LSP",
            R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
            a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
            d = { "<cmd>Telescope diagnostics<CR>", "Diagnostics" },
            f = { "<cmd>Lspsaga lsp_finder<CR>", "Finder" },
            i = { "<cmd>LspInfo<CR>", "Lsp Info" },
            n = { "<cmd>lua require('renamer').rename()<CR>", "Rename" },
            r = { "<cmd>Telescope lsp_references<CR>", "References" },
            s = {
                "<cmd>Telescope lsp_document_symbols<CR>",
                "Document Symbols",
            },
            t = { "<cmd>TroubleToggle document_diagnostics<CR>", "Trouble" },
            L = {
                "<cmd>lua vim.lsp.codelens.refresh()<CR>",
                "Refresh CodeLens",
            },
            l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "Run CodeLens" },
            D = {
                "<cmd>lua require('config.lsp').toggle_diagnostics()<CR>",
                "Toggle Inline Diagnostics",
            },
        },
    }
    if client.server_capabilities.documentFormattingProvider then
        keymap_l.l.F = {
            "<cmd>lua vim.lsp.buf.format({async = true})<CR>",
            "Format Document",
        }
    end

    local keymap_v_l = {
        l = {
            name = "LSP",
            a = {
                "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>",
                "Code Action",
            },
        },
    }

    local o = { buffer = bufnr, prefix = "<leader>" }
    whichkey.register(keymap_l, o)
    legendary.bind_whichkey(keymap_l, o, false)

    o = { mode = "v", buffer = bufnr, prefix = "<leader>" }
    whichkey.register(keymap_v_l, o)
    legendary.bind_whichkey(keymap_v_l, o, false)

    -- o = { buffer = bufnr, prefix = "g" }
    -- whichkey.register(keymap_g, o)
    -- legendary.bind_whichkey(keymap_g, o, false)
end

-- local function signature_help(client, bufnr)
--     local trigger_chars =
--         client.server_capabilities.signatureHelpProvider.triggerCharacters
--
--     for _, char in ipairs(trigger_chars) do
--         vim.keymap.set("i", char, function()
--             vim.defer_fn(function()
--                 pcall(vim.lsp.buf.signature_help)
--             end, 0)
--             return char
--         end, {
--             buffer = bufnr,
--             noremap = true,
--             silent = true,
--             expr = true,
--         })
--     end
-- end
--
function M.setup(client, bufnr)
    keymappings(client, bufnr)
    -- signature_help(client, bufnr) -- use cmp-nvim-lsp-signature-help
end

return M
