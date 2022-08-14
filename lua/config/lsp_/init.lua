local imap = require("config.keymap").imap
local nmap = require("config.keymap").nmap

local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
	return
end

local lspconfig_util = require "lspconfig.util"

-- local nvim_status = require "lsp-status"
local ok, nvim_status = pcall(require, "lsp-status")
if not ok then
	nvim_status = nil
end

local telescope_mapper = require "config.telescope.mappings"
local handlers = require "config.lsp.handlers"

-- Generate absolute path to lsp servers
local lsp_dir = vim.fn.stdpath('data') .. '/lsp_servers'
local function lsp_path(relative_path)
	return vim.fn.expand(lsp_dir .. '/' .. relative_path)
end

-- Can set this lower if needed.
-- require("vim.lsp.log").set_level "debug"
-- require("vim.lsp.log").set_level "trace"

local status = require "config.lsp.status"
-- print("STATUS", status)
if status then
	status.activate()
end

local toggle_pyright_type_checking = function()
	local servers = require("nvim-lsp-installer.servers")
	local name = "pyright"
	local type_checking = true

	local clients = vim.lsp.buf_get_clients(0)
	for _, client in pairs(clients) do
		if client.name == name then
			type_checking = client.config.settings.python.analysis.typeCheckingMode == "off"
			vim.lsp.stop_client(client.id)
			break
		end
	end

	for _, server in pairs(servers.get_installed_servers()) do
		if server.name == name then
			local config = make_config(server)
			if not type_checking then
				config.settings = { python = { analysis = { typeCheckingMode = "off" } } }
			end

			server:setup(config)
			break
		end
	end
end

local custom_init = function(client)
	client.config.flags = client.config.flags or {}
	client.config.flags.allow_incremental_sync = true
end

local filetype_attach = setmetatable(
	{
		go = function(client)
			vim.cmd [[
            augroup lsp_buf_format
            au! BufWritePre <buffer>
            autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
            augroup END
            ]]
		end,

		rust = function()
			telescope_mapper("<space>wf", "lsp_workspace_symbols", {
				ignore_filename = true,
				query = "#",
			}, true)

			-- vim.cmd [[
			--   autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request {aligned = true, prefix = " » "}
			-- ]]

			vim.cmd [[
            augroup lsp_buf_format
            au! BufWritePre <buffer>
            autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
            augroup END
            ]]
		end,
	},
	{
	__index = function()
		return function() end
	end,
}
)

local buf_nnoremap = function(opts)
	if opts[3] == nil then
		opts[3] = {}
	end
	opts[3].buffer = 0

	nmap(opts)
end

local buf_inoremap = function(opts)
	if opts[3] == nil then
		opts[3] = {}
	end
	opts[3].buffer = 0

	imap(opts)
end

local custom_attach = function(client, bufnr)

	-- Use LSP as the handler for formatexpr.
	-- See `:help formatexpr` for more information.
	if false then
		vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
	end

	-- Configure formatting
	if true then
		require("config.lsp.null-ls.formatters").setup(client, bufnr)
	end

	-- Configure for jdtls
	if client.name == "jdt.ls" then
		require("jdtls").setup_dap { hotcodereplace = "auto" }
		require("jdtls.dap").setup_dap_main_class_configs()
		vim.lsp.codelens.refresh()
	end

	if nvim_status then
		nvim_status.on_attach(client, bufnr)
	end
	buf_inoremap { "<c-s>", vim.lsp.buf.signature_help }

	--[[
    buf_nnoremap { "<space>dn", vim.lsp.diagnostic.goto_next }
    buf_nnoremap { "<space>dp", vim.lsp.diagnostic.goto_prev }
    buf_nnoremap { "<space>dl", vim.lsp.diagnostic.show_line_diagnostics }
    --]]

	buf_nnoremap { "<space>rn", vim.lsp.buf.rename, { desc = "Rename" } }

	buf_nnoremap { "gd", vim.lsp.buf.definition, { desc = "Go definition" } }
	buf_nnoremap { "gD", vim.lsp.buf.declaration, { desc = "Go declaration" } }
	buf_nnoremap { "gT", vim.lsp.buf.type_definition, { desc = "Go type definition" } }
	buf_nnoremap { "gI", handlers.implementation, { desc = "Go Implementation" } }
	buf_nnoremap { "<space>ca", vim.lsp.buf.code_action, { desc = "Code Action" } }

	buf_nnoremap { "<space>clr", "<cmd>lua R('config.lsp.codelens').run()<CR>", { desc = "Codelens: Run" } }
	buf_nnoremap { "<space>rr", "LspRestart", { desc = "Restart LSP" } }

	telescope_mapper("<Leader>lspr", "lsp_references", "Telescope: LSP references", nil, true)
	telescope_mapper("<Leader>lspi", "lsp_implementations", "Telescope: LSP implementations", nil, true)
	telescope_mapper("<Leader>lspd", "lsp_document_symbols", "Telescope: LSP document symbols", { ignore_filename = true }, true)
	telescope_mapper("<Leader>lspw", "lsp_dynamic_workspace_symbols", "Telescope: LSP workspace symbols", { ignore_filename = true }, true)
	-- telescope_mapper("<Leader>lspca", vim.lsp.buf.code_action, "Telescope: LSP Code action", nil, true)

	local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")

	if filetype ~= "lua" then
		buf_nnoremap { "K", vim.lsp.buf.hover }
	end

	vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"

	-- Set autocommands conditional on server_capabilities
	if client.server_capabilities.documentHighlightProvider then
		-- if client.resolved_capabilities.document_highlight then
		vim.cmd [[
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]]
	end

	if client.server_capabilities.codeLensProvider then
		if filetype ~= "elm" then
			vim.cmd [[
            augroup lsp_document_codelens
            au! * <buffer>
            autocmd BufEnter ++once         <buffer> lua require"vim.lsp.codelens".refresh()
            autocmd BufWritePost,CursorHold <buffer> lua require"vim.lsp.codelens".refresh()
            augroup END
            ]]
		end
	end
	-- Attach any filetype specific options to the client
	filetype_attach[filetype](client)
end

local updated_capabilities = vim.lsp.protocol.make_client_capabilities()

-- Code actions
updated_capabilities.textDocument.codeAction = {
	dynamicRegistration = false;
	codeActionLiteralSupport = {
		codeActionKind = {
			valueSet = {
				"",
				"quickfix",
				"refactor",
				"refactor.extract",
				"refactor.inline",
				"refactor.rewrite",
				"source",
				"source.organizeImports",
			};
		};
	};
}
-- Snippets
updated_capabilities.textDocument.completion.completionItem.snippetSupport = true;

if nvim_status then
	updated_capabilities = vim.tbl_deep_extend("keep", updated_capabilities, nvim_status.capabilities)
end

updated_capabilities.textDocument.codeLens = { dynamicRegistration = false }
updated_capabilities = require("cmp_nvim_lsp").update_capabilities(updated_capabilities)

-- TODO: check if this is the problem.
updated_capabilities.textDocument.completion.completionItem.insertReplaceSupport = false

-- vim.lsp.buf_request(0, "textDocument/codeLens", { textDocument = vim.lsp.util.make_text_document_params() })

local servers = {
	--   -- clangd = true,
	-- ccls = true,
	--   gdscript = true,
	--   graphql = true,
	pyright = true,
	vimls = true,
	yamlls = true,
	-- bashls = true,
	--   beancount = true,
	--   cssls = true,
	--   dockerls = true,
	--   dotls = true,
	--   flow = true,
	--   fortls = true,
	--   -- ghcide = true,
	html = true,
	--   intelephense = true,
	julials = true,
	kotlin_language_server = true,
	--   perlpls = true,
	r_language_server = true,
	-- rust_analyzer = true,
	--   -- sqlls = true,
	--   texlab = true,
	--   -- zeta_note = true,
	--   -- -->.zeta.toml
	--   --zk = true, -->.zk
	solargraph = false,
	--   -- lemminx = true,

	cmake = true,
	-- cmake = (1 == vim.fn.executable "cmake-language-server"),

	--[REMOVE][[
	clangd = {
		cmd = {
			"clangd",
			"--offset-encoding=utf-16",
			"--background-index",
			"--suggest-missing-includes",
			"--clang-tidy",
			"--header-insertion=iwyu",
		},
		-- Required for lsp-status
		init_options = {
			clangdFileStatus = true,
		},
		handlers = nvim_status and nvim_status.extensions.clangd.setup() or nil,
	},
	--[REMOVE0] ]]

	groovyls = {
		cmd = {
			"/home/ivan/.jenv/versions/17/bin/java",
			"-jar",
			"/home/ivan/.config/lsp/groovy-language-server/build/libs/groovy-language-server-all.jar"
		},
		filetypes = { "groovy" },
	},

	-- dartls = pcall(require, "flutter-tools"),
	--[[
	dartls = {
		cmd = { "dart", "/home/ivan/developer/env/linuxbrew/Cellar/flutter/3.1.0/bin/cache/dart-sdk/bin/snapshots/analysis_server.dart.snapshot", "--lsp" },
		filetypes = { "dart" },
		init_options = {
			closingLabels = false,
			flutterOutline = false,
			onlyAnalyzeProjectsWithOpenFiles = true,
			outline = false,
			suggestFromUnimportedLibraries = true
		},
		root_dir = lspconfig.util.root_pattern("pubspec.yaml"),
		-- root_dir = require("lspconfig").util.root_pattern{".git/", "."},
	},
    ]]

	gopls = {
		root_dir = function(fname)
			local Path = require "plenary.path"

			local absolute_cwd = Path:new(vim.loop.cwd()):absolute()
			local absolute_fname = Path:new(fname):absolute()

			if string.find(absolute_cwd, "/cmd/", 1, true) and string.find(absolute_fname, absolute_cwd, 1, true) then
				return absolute_cwd
			end

			return lspconfig_util.root_pattern("go.mod", ".git")(fname)
		end,

		settings = {
			gopls = {
				codelenses = { test = true },
			},
		},

		flags = {
			debounce_text_changes = 200,
		},
	},

	-- git clone https://github.com/OmniSharp/omnisharp-vim.git
	-- cd omnisharp-vim/
	-- git submodule update --init --recursive
	-- cd installer
	-- ./omnisharp-manager.sh -l ~/.config/lsp/omnisharp
	omnisharp = {
		cmd = { vim.fn.expand "~/.config/lsp/omnisharp/run", "--languageserver", "--hostPID", tostring(vim.fn.getpid()) },
	},

	rust_analyzer = {
		cmd = { "rustup", "run", "nightly", "rust-analyzer" },
	},

	tsserver = {
		cmd = { "typescript-language-server", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
	},

	awk_ls = {
		cmd = { lsp_path('awk_ls/node_modules/awk-language-server/out/cli.js') },
	},

	-- bashls = {
	--  cmd = { lsp_path('bash/node_modules/bash-language-server/bin/main.js'), 'start' },
	-- },

	--[[
    arduino_language_server = {
        cmd =  {
            lsp_path("arduino_language_server/arduino-language-server/arduino-language-server)",
            "-cli-config", lsp_path("arduino_language_server/arduino-cli/arduino-cli.yaml"),
            "-cli", lsp_path("arduino_language_server/arduino-cli/arduino-cli"),
            "-clangd", lsp_path("arduino_language_server/clangd/bin/clangd")
        }
    },
    ]]

} -- server

local setup_server = function(server, config)
	if not config then
		return
	end

	if type(config) ~= "table" then
		config = {}
	end

	config = vim.tbl_deep_extend("force", {
		on_init = custom_init,
		on_attach = custom_attach,
		capabilities = updated_capabilities,
		flags = {
			debounce_text_changes = 50,
		},
	}, config)

	lspconfig[server].setup(config)
end

for server, config in pairs(servers) do
	setup_server(server, config)
end

-- Load lua configuration from nlua.
_ = require("nlua.lsp.nvim").setup(lspconfig, {
	on_init = custom_init,
	on_attach = custom_attach,
	capabilities = updated_capabilities,

	root_dir = function(fname)
		-- se fname contiver config/nvim -> retorna ~/.config/nvim/
		if string.find(vim.fn.fnamemodify(fname, ":p"), "config/nvim/") then
			return vim.fn.expand "~/.config/nvim/"
		end

		-- se tiver .git ou dirname(fname) -> diretório corrente
		return lspconfig_util.find_git_ancestor(fname) or lspconfig_util.path.dirname(fname)
	end,

	globals = {
		-- Colorbuddy
		"Color",
		"c",
		"Group",
		"g",
		"s",

		-- Custom
		"RELOAD",
	},
})

-- null-ls
-- require("config.null-ls").setup(opts)
-- Set up null-ls
local use_null = false
if use_null then
	require("null-ls").setup {
		sources = {
			-- require("null-ls").builtins.formatting.stylua,
			-- require("null-ls").builtins.diagnostics.eslint,
			-- require("null-ls").builtins.completion.spell,
			require("null-ls").builtins.diagnostics.selene,
		},
	}
end

return {
	on_init = custom_init,
	on_attach = custom_attach,
	capabilities = updated_capabilities,
	toggle_pyright = toggle_pyright_type_checking,
}
