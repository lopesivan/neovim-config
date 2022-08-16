local M = {}

function M.setup(servers, options)
    local lsp_config = require "lspconfig"
    local icons = require "config.icons"

    require("mason").setup {
        ui = {
            icons = {
                package_installed = icons.server_installed,
                package_pending = icons.server_pending,
                package_uninstalled = icons.server_uninstalled,
            },
        },
    }

    require("mason-tool-installer").setup {
        ensure_installed = {
            "codelldb",
            "stylua",
            "shfmt",
            "shellcheck",
            "prettierd",
        },
        auto_update = false,
        run_on_start = true,
    }

    require("mason-lspconfig").setup {
        ensure_installed = vim.tbl_keys(servers),
        automatic_installation = false,
    }

    -- Package installation folder
    local install_root_dir = vim.fn.stdpath "data" .. "/mason"

    require("mason-lspconfig").setup_handlers {
        function(server_name)
            -- print("Load server: " .. server_name)

            local opts = vim.tbl_deep_extend(
                "force",
                options,
                servers[server_name] or {}
            )

            if server_name == "sumneko_lua" then
                lsp_config.sumneko_lua.setup(
                    require("lua-dev").setup { opts }
                )
            else
                lsp_config[server_name].setup { opts }
            end
        end,
    }
end

return M
