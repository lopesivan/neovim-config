local M = {}

local util = require "lspconfig.util"

local ok, nvim_status = pcall(require, "lsp-status")
if not ok then
    nvim_status = nil
end

local filetype = vim.bo.filetype

local servers = {
    gopls = {
        settings = {
            gopls = {
                hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                },
            },
        },
    },

    html = {},
    jsonls = {
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
            },
        },
    },

    pyright = {
        analysis = {
            typeCheckingMode = "off",
        },
    },

    -- pylsp = {}, -- Integration with rope for refactoring - https://github.com/python-rope/pylsp-rope

    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                cargo = { allFeatures = true },
                checkOnSave = {
                    command = "clippy",
                    extraArgs = { "--no-deps" },
                },
            },
        },
    },

    sumneko_lua = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = "LuaJIT",
                    -- Setup your lua path
                    path = vim.split(package.path, ";"),
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = {
                        "vim",
                        "describe",
                        "it",
                        "before_each",
                        "after_each",
                        "packer_plugins",
                    },
                    -- disable = { "lowercase-global", "undefined-global", "unused-local", "unused-vararg", "trailing-space" },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                    -- library = {
                    --     [vim.fn.expand "$VIMRUNTIME/lua"] = true,
                    --     [vim.fn.stdpath "config" .. "/lua/config"] = true,
                    --     -- [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
                    -- },
                    checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
                    -- library = vim.api.nvim_get_runtime_file("", true),
                    maxPreload = 2000,
                    preloadFileSize = 50000,
                },
                completion = { callSnippet = "Both" },
                telemetry = { enable = false },
                hint = { enable = true },
            },
        },
    },

    tsserver = {
        disable_formatting = true,
        settings = {
            javascript = {
                inlayHints = {
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true,
                },
            },
            typescript = {
                inlayHints = {
                    includeInlayEnumMemberValueHints = true,
                    includeInlayFunctionLikeReturnTypeHints = true,
                    includeInlayFunctionParameterTypeHints = true,
                    includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
                    includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                    includeInlayPropertyDeclarationTypeHints = true,
                    includeInlayVariableTypeHints = true,
                },
            },
        },
    },

    vimls = {},
    -- tailwindcss = {},
    yamlls = {
        schemastore = {
            enable = true,
        },
        settings = {
            yaml = {
                hover = true,
                completion = true,
                validate = true,
                schemas = require("schemastore").json.schemas(),
            },
        },
    },

    jdtls = {},
    dockerls = {},
    graphql = {},
    bashls = {},
    -- omnisharp = {},
    --[[

	omnisharp = {
		cmd = { vim.fn.expand "$NVIM_BEGINNER/share/nvim/mason/bin/omnisharp", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	},

    gradle_ls = {
        cmd = {
            vim.fn.stdpath "data"
                .. "/vscode-gradle/gradle-language-server/build/install/gradle-language-server/bin/gradle-language-server",
        },
        root_dir = function(fname)
            return util.root_pattern(
                unpack { "settings.gradle", "settings.gradle.kts" }
            )(fname) or util.root_pattern(
                unpack { "build.gradle" }
            )(fname)
        end,
        filetypes = { "groovy" },
    },
	--]]

    kotlin_language_server = {},
    emmet_ls = {},
    gradle_ls = {},
    marksman = {},
    angularls = {},
    solargraph = {},
    clangd = {},
}

function M.on_attach(client, bufnr)
    -- Enable completion triggered by <C-X><C-O>
    -- See `:help omnifunc` and `:help ins-completion` for more information.
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Use LSP as the handler for formatexpr.
    -- See `:help formatexpr` for more information.
    vim.api.nvim_buf_set_option(
        bufnr,
        "formatexpr",
        "v:lua.vim.lsp.formatexpr()"
    )

    -- Configure key mappings
    require("config.lsp.keymaps").setup(client, bufnr)
    -- Configure highlighting
    require("config.lsp.highlighter").setup(client, bufnr)

    -- Configure formatting
    require("config.lsp.null-ls.formatters").setup(client, bufnr)

    -- tagfunc
    if client.server_capabilities.definitionProvider then
        vim.api.nvim_buf_set_option(bufnr, "tagfunc", "v:lua.vim.lsp.tagfunc")
    end

    -- Configure for jdtls
    if client.name == "jdt.ls" then
        require("jdtls").setup_dap { hotcodereplace = "auto" }
        require("jdtls.dap").setup_dap_main_class_configs()
        vim.lsp.codelens.refresh()
    end

    -- aerial.nvim
    require("aerial").on_attach(client, bufnr)

    if client.name == "bashls" then
        goto continue
    end
    -- nvim-navic
    if client.server_capabilities.documentSymbolProvider then
        local navic = require "nvim-navic"
        navic.attach(client, bufnr)
    end
    ::continue::

    -- inlay-hints
    local ih = require "inlay-hints"
    ih.on_attach(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
}
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}
M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities) -- for nvim-cmp

local options = {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    flags = {
        debounce_text_changes = 150,
    },
}

-- Setup LSP handlers
require("config.lsp.handlers").setup()

function M.setup()
    -- null-ls
    require("config.lsp.null-ls").setup(options)

    -- Installer
    require("config.lsp.installer").setup(servers, options)

    -- Inlay hints
    require("config.lsp.inlay-hints").setup()
end

local diagnostics_active = true

function M.toggle_diagnostics()
    diagnostics_active = not diagnostics_active
    if diagnostics_active then
        vim.diagnostic.show()
    else
        vim.diagnostic.hide()
    end
end

function M.remove_unused_imports()
    vim.diagnostic.setqflist { severity = vim.diagnostic.severity.WARN }
    vim.cmd "packadd cfilter"
    vim.cmd "Cfilter /main/"
    vim.cmd "Cfilter /The import/"
    vim.cmd "cdo normal dd"
    vim.cmd "cclose"
    vim.cmd "wa"
end

return M
