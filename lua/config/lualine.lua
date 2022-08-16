local M = {}

-- stylua: ignore
local colors = {
	blue   = '#80a0ff',
	cyan   = '#79dac8',
	black  = '#080808',
	white  = '#c6c6c6',
	red    = '#ff5189',
	violet = '#d183e8',
	grey   = '#303030',
}

local bubbles_theme = {
    normal = {
        a = { fg = colors.black, bg = colors.violet },
        b = { fg = colors.white, bg = colors.grey },
        c = { fg = colors.white, bg = colors.black },
    },

    insert = { a = { fg = colors.black, bg = colors.blue } },
    visual = { a = { fg = colors.black, bg = colors.cyan } },
    replace = { a = { fg = colors.black, bg = colors.red } },

    command = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.black, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },

    inactive = {
        a = { fg = colors.white, bg = colors.black },
        b = { fg = colors.white, bg = colors.black },
        c = { fg = colors.black, bg = colors.black },
    },
}

local function separator()
    return "%="
end

local function lsp_client(msg)
    msg = msg or ""
    local buf_clients = vim.lsp.get_active_clients { bufnr = 0 }

    if next(buf_clients) == nil then
        if type(msg) == "boolean" or #msg == 0 then
            return ""
        end
        return msg
    end

    local buf_ft = vim.bo.filetype
    local buf_client_names = {}

    -- add client
    for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
            table.insert(buf_client_names, client.name)
        end
    end

    -- add formatter
    local formatters = require "config.lsp.null-ls.formatters"
    local supported_formatters = formatters.list_registered(buf_ft)
    vim.list_extend(buf_client_names, supported_formatters)

    -- add linter
    local linters = require "config.lsp.null-ls.linters"
    local supported_linters = linters.list_registered(buf_ft)
    vim.list_extend(buf_client_names, supported_linters)

    -- add hover
    local hovers = require "config.lsp.null-ls.hovers"
    local supported_hovers = hovers.list_registered(buf_ft)
    vim.list_extend(buf_client_names, supported_hovers)

    -- add code action
    local code_actions = require "config.lsp.null-ls.code_actions"
    local supported_code_actions = code_actions.list_registered(buf_ft)
    vim.list_extend(buf_client_names, supported_code_actions)

    local hash = {}
    local client_names = {}
    for _, v in ipairs(buf_client_names) do
        if not hash[v] then
            client_names[#client_names + 1] = v
            hash[v] = true
        end
    end
    table.sort(client_names)
    return "[" .. table.concat(client_names, ", ") .. "]"
end

-------- use fidget.nvim ------
-- local function lsp_progress(_, is_active)
--   if not is_active then
--     return
--   end
--   local messages = vim.lsp.util.get_progress_messages()
--   if #messages == 0 then
--     return ""
--   end
--   local status = {}
--   for _, msg in pairs(messages) do
--     local title = ""
--     if msg.title then
--       title = msg.title
--     end
--     table.insert(status, (msg.percentage or 0) .. "%% " .. title)
--   end
--   local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
--   local ms = vim.loop.hrtime() / 1000000
--   local frame = math.floor(ms / 120) % #spinners
--   return table.concat(status, "  ") .. " " .. spinners[frame + 1]
-- end

local icons = require "config.icons"

-- Temporary disable winbar due to this issue
-- https://github.com/neovim/neovim/issues/19458
-- local winbar = require "config.winbar"

function M.setup()
    -- local gps = require "nvim-gps"

    require("lualine").setup {
        options = {
            icons_enabled = true,
            theme = bubbles_theme,
            lower = true,
            theme = "auto",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {
                statusline = {},
                winbar = {
                    "help",
                    "startify",
                    "dashboard",
                    "packer",
                    "neogitstatus",
                    "NvimTree",
                    "Trouble",
                    "alpha",
                    "lir",
                    "Outline",
                    "spectre_panel",
                    "toggleterm",
                },
            },
            always_divide_middle = true,
            globalstatus = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                "branch",
                "diff",
                {
                    "diagnostics",
                    sources = { "nvim_diagnostic" },
                    symbols = {
                        error = icons.diagnostics.Error,
                        warn = icons.diagnostics.Warning,
                        info = icons.diagnostics.Information,
                        hint = icons.diagnostics.Hint,
                    },
                    colored = false,
                },
            },
            lualine_c = {
                { separator },
                {
                    lsp_client,
                    icon = " ",
                    color = { fg = colors.violet, gui = "bold" },
                },
                -- { lsp_progress },
                -- {
                --   gps.get_location,
                --   cond = gps.is_available,
                --   color = { fg = colors.green },
                -- },
            },
            -- lualine_x = { "filename", "encoding", "fileformat", "filetype" },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { "filename" },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        -- Temporary disable winbar due to this issue
        -- https://github.com/neovim/neovim/issues/19458
        winbar = {
            -- lualine_a = { "diagnostics" },
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            -- lualine_x = { winbar.get_winbar },
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        inactive_winbar = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        extensions = { "nvim-tree", "toggleterm", "quickfix" },
    }
end

return M
