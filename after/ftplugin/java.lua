local jdtls_ok, jdtls = pcall(require, "jdtls")
if not jdtls_ok then
  vim.notify "JDTLS not found, install with `:LspInstall jdtls`"
  return
end

-- Installation location of jdtls by nvim-lsp-installer
local JDTLS_LOCATION = vim.fn.stdpath "data" .. "/lsp_servers/jdtls"

-- Data directory - change it to your liking
local HOME = os.getenv "HOME"
local WORKSPACE_PATH = HOME .. "/workspace/java/"

-- Debugger installation location
local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim"

-- Only for Linux and Mac
local SYSTEM = "linux"
if vim.fn.has "mac" == 1 then
  SYSTEM = "mac"
end

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = WORKSPACE_PATH .. project_name

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
  return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

-- Debugging
local bundles = {
  vim.fn.glob(
    DEBUGGER_LOCATION .. "/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar"
  ),
}
vim.list_extend(bundles, vim.split(vim.fn.glob(DEBUGGER_LOCATION .. "/vscode-java-test/server/*.jar"), "\n"))

local config = {
  cmd = {
    "java",
    "-Declipse.application=org.eclipse.jdt.ls.core.id1",
    "-Dosgi.bundles.defaultStartLevel=4",
    "-Declipse.product=org.eclipse.jdt.ls.core.product",
    "-Dlog.protocol=true",
    "-Dlog.level=ALL",
    "-Xms1g",
    "--add-modules=ALL-SYSTEM",
    "--add-opens",
    "java.base/java.util=ALL-UNNAMED",
    "--add-opens",
    "java.base/java.lang=ALL-UNNAMED",
    "-jar",
    vim.fn.glob(JDTLS_LOCATION .. "/plugins/org.eclipse.equinox.launcher_*.jar"),
    "-configuration",
    JDTLS_LOCATION .. "/config_" .. SYSTEM,
    "-data",
    workspace_dir,
  },

  on_attach = require("config.lsp").on_attach,
  capabilities = require("config.lsp").capabilities,
  root_dir = root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      eclipse = {
        downloadSources = true,
      },
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      maven = {
        downloadSources = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
      referencesCodeLens = {
        enabled = true,
      },
      references = {
        includeDecompiledSources = true,
      },
      format = {
        enabled = true,
        settings = {
          url = vim.fn.stdpath "config" .. "/lang-servers/intellij-java-google-style.xml",
          profile = "GoogleStyle",
        },
      },
    },
    signatureHelp = { enabled = true },
    completion = {
      favoriteStaticMembers = {
        "org.hamcrest.MatcherAssert.assertThat",
        "org.hamcrest.Matchers.*",
        "org.hamcrest.CoreMatchers.*",
        "org.junit.jupiter.api.Assertions.*",
        "java.util.Objects.requireNonNull",
        "java.util.Objects.requireNonNullElse",
        "org.mockito.Mockito.*",
      },
    },
    contentProvider = { preferred = "fernflower" },
    extendedClientCapabilities = extendedClientCapabilities,
    sources = {
      organizeImports = {
        starThreshold = 9999,
        staticStarThreshold = 9999,
      },
    },
    codeGeneration = {
      toString = {
        template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
      },
      hashCodeEquals = {
        useJava7Objects = true,
      },
      useBlocks = true,
    },
  },

  flags = {
    allow_incremental_sync = true,
  },
  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = bundles,
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
jdtls.start_or_attach(config)

-- Add the commands
require("jdtls.setup").add_commands()
-- vim.api.nvim_exec(
--   [[
-- command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)
-- command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
-- command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
-- command! -buffer JdtJol lua require('jdtls').jol()
-- command! -buffer JdtBytecode lua require('jdtls').javap()
-- command! -buffer JdtJshell lua require('jdtls').jshell(),
--   ]],
--   false
-- )

vim.bo.shiftwidth = 4
vim.bo.tabstop = 4
vim.bo.shiftwidth = 4
vim.bo.commentstring = "// %s"

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "GetCppFoldExpr()"
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 999
vim.opt.foldminlines = 1
vim.opt.foldtext = "CppFoldText()"

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
vim.g.easy_align_delimiters = {
	-- aperto d
	['d'] = {
		['pattern'] = '\\(const\\|constexpr\\|static\\)\\@<! ',
		['left_margin'] = 0,
		['right_margin'] = 0
	},

	-- aperto c
	['c'] = {
		['pattern'] = '\\/\\/',
		['ignore_groups'] = { 'String' },
		['ignore_unmatched'] = 0
	},

	-- aperto <
	['<'] = {
		['pattern'] = '<<',
		['ignore_groups'] = { 'String' },
		['ignore_unmatched'] = 0
	},

	-- aperto f
	['f'] = {
		['pattern'] = ' \\ze\\S\\+\\s*[;=]',
		['left_margin'] = 0,
		['right_margin'] = 0
	},

	-- aperto ]
	[']'] = {
		['pattern'] = '[[\\]]',
		['left_margin'] = 0,
		['right_margin'] = 0,
		['stick_to_left'] = 0
	},

	-- aperto )
	[')'] = {
		['pattern'] = '[()]',
		['left_margin'] = 0,
		['right_margin'] = 0,
		['stick_to_left'] = 0
	},

	-- aperto (
	['('] = {
		['pattern'] = '(',
		['left_margin'] = 0,
		['right_margin'] = 0,
		['stick_to_left'] = 0
	},

	-- aperto w
	['w'] = {
		['pattern'] = '\\w',
		['left_margin'] = 0,
		['right_margin'] = 0,
		['stick_to_left'] = 0
	},

	-- aperto _
	['_'] = {
		['pattern'] = '_\\w',
		['left_margin'] = 1,
		['right_margin'] = 0,
		['stick_to_left'] = 0
	},
	-- aperto ,
	[','] = {
		['pattern'] = '\\w\\+,',
		['delimiter_align'] = 'l',
		['left_margin'] = 0,
		['right_margin'] = 0,
		['stick_to_left'] = 0
	},

	-- aperto ;
	[';'] = {
		['pattern'] = '\\w\\+;',
		['delimiter_align'] = 'l',
		['left_margin'] = 1,
		['right_margin'] = 0,
		['stick_to_left'] = 0
	}
}
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
vim.g.projectionist_heuristics = {
	['*.java'] = {
		['*.java'] = {
			['make'] = 'javac {file|basename}',
			['dispatch'] = 'java {}',
			['telescope'] = 'Telescope yabs tasks',
			['type'] = 'java'
		}
	}
}

local nmap = require("config.dispatch").nmap
nmap { '<leader><CR>', 'telescope', 'build maneger' }
nmap { 'm<CR>', 'make', 'Make' }
nmap { 'd<CR>', 'dispatch', 'Dispatch' }
-- nmap {'s<CR>', 'start', 'Maple Interativo'}


-- vim.opt.equalprg={"astyle --pad-first-paren-out --style=linux -A1 --indent=spaces=4 --convert-tabs"}

-- clang
-- vim.opt.makeprg="clang++-12 -Wall -Werror -Wpedantic -fstandalone-debug -std=c++17 -D_GLIBCXX_DEBUG -g -o build/%< %"

-- CMake
-- vim.opt.makeprg = "cd build/debug && make -j 16"
-- note 16 is hardware concurrency for build
-- make does an "out of tree build," thats why we cd into a diff directory
-- this assumes you've run cmake ../.. inside build/debug ahead of time to generate the makefile

-- gcc
-- vim.opt.makeprg="g++ -Wall -Werror -Wpedantic -std=c++17 -g -o build/%< %"

-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
-- ---------------------------------------------------------------------------
