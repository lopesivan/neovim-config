-- ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
-- ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝
-- ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗
-- ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║
-- ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║
-- ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝
--

vim.cmd [[packadd packer.nvim]]
vim.cmd [[packadd vimball]]

local has = function(x)
	return vim.fn.has(x) == 1
end

local executable = function(x)
	return vim.fn.executable(x) == 1
end

require("packer").startup {
	function(use)
		use "wbthomason/packer.nvim"
	end,
}

return require("packer").startup {
	function(use)
		local local_use = function(first, second, opts)
			opts = opts or {}

			local plug_path, home
			if second == nil then
				plug_path = first
				home = "lopesivan"
			else
				plug_path = second
				home = first
			end

			if vim.fn.isdirectory(vim.fn.expand("~/plugins/" .. plug_path)) == 1 then
				opts[1] = "~/plugins/" .. plug_path
			else
				opts[1] = string.format("%s/%s", home, plug_path)
			end

			use(opts)
		end

		local py_use = function(opts)
			if not has "python3" then
				return
			end

			use(opts)
		end

		--
		-- HEAD ==============================================================
		--
		use "wbthomason/packer.nvim"
		use "lewis6991/impatient.nvim"

		--
		-- TREE SITTER =======================================================
		--
		use "nvim-treesitter/nvim-treesitter"
		use "nvim-treesitter/playground"
		use "nvim-treesitter/nvim-treesitter-refactor"
		use "theHamsta/nvim-treesitter-pairs"

		--
		-- Nav ===============================================================
		--
		use {
		  "antoinemadec/FixCursorHold.nvim",
		  event = "BufReadPre",
		  config = function()
			vim.g.cursorhold_updatetime = 100
		  end,
		}

		use "tamago324/lir.nvim"
		use "tamago324/lir-git-status.nvim"
		if executable "mmv" then
			use "tamago324/lir-mmv.nvim"
		end

		--
		-- IVAN ==============================================================
		--

		use "lopesivan/template.vim"
		use {
			"lopesivan/nvim-cheetah",
			run = ":UpdateRemotePlugins",
		}

		local_use "maps.vim"
		local_use "hp50g.vim"
		local_use "uppercase.nvim"
		local_use "vim-dict"
		local_use "nvim-jptemplate"
		local_use "vim-fold"
		local_use "contextmenu.nvim"

		use {
			"lopesivan/neotemplate.nvim",
			run = ":UpdateRemotePlugins",
			-- cmd = "Template",
		}

		use { "lopesivan/typecast.vim", branch = "main" }

		--
		-- TIM POPE ==========================================================
		--
		-- use {'tpope/vim-dispatch', opt = true, cmd = {'Dispatch', 'Make', 'Focus', 'Start'}}
		-- use {'tpope/vim-dispatch', cmd = {'Dispatch', 'Make', 'Start'}}
		-- local_use('tpope', 'vim-dispatch')
		use "tpope/vim-abolish" -- Cool things with words!
		use "tpope/vim-characterize"
		use "tpope/vim-dispatch"
		use "radenling/vim-dispatch-neovim"
		use "tpope/vim-endwise"
		use "tpope/vim-eunuch"
		--use "tpope/vim-fugitive"
		use "tpope/vim-git"
		use "tpope/vim-haml"
		use "tpope/vim-liquid"
		use "tpope/vim-markdown"
		use "tpope/vim-obsession"
		use "tpope/vim-projectionist" -- STREAM: Alternate file editting and some helpful stuff
		use "tpope/vim-ragtag"
		use "tpope/vim-rake"
		use "tpope/vim-repeat" -- Repeat actions better
		use "tpope/vim-rhubarb"
		use "tpope/vim-sensible"
		use "tpope/vim-surround" -- Surround text objects easily
		use "tpope/vim-tbone"
		use "tpope/vim-unimpaired"
		use "tpope/vim-vividchalk"
		use { "tpope/vim-bundler", ft = { "ruby" } }
		use { "tpope/vim-rails", ft = { "ruby" } }
		use { "tpope/vim-rbenv", ft = { "ruby" } }
		-- use "tpope/vim-dadbod"
		-- :Messages <- view messages in quickfix list
		-- :Verbose  <- view verbose output in preview window.
		-- :Time     <- measure how long it takes to run some stuff.
		use {
		  "tpope/vim-scriptease",
		  cmd = {
		    "Messages", --view messages in quickfix list
		    "Verbose", -- view verbose output in preview window.
		    "Time", -- measure how long it takes to run some stuff.
		  },
		}

		--
		-- NVIM-LUA ==========================================================
		--
		use { "nvim-lua/popup.nvim" }
		use { "nvim-lua/plenary.nvim", rocks = "lyaml"}

		-- Notification
		use {
		  "rcarriga/nvim-notify",
		  event = "BufReadPre",
		  config = function()
			require("config.notify").setup()
		  end,
		}

		--
		-- Colorscheme
		--
		use {
			"Mofiqul/adwaita.nvim",
		  config = function()
			vim.cmd "colorscheme adwaita"
		  end
		}

		use "rebelot/kanagawa.nvim"

		use {
		  "folke/tokyonight.nvim",
		  config = function()
			vim.cmd "colorscheme tokyonight"
		  end,
		  disable = true,
		}

		use {
		  "norcalli/nvim-colorizer.lua",
		  cmd = "ColorizerToggle",
		  config = function()
			require("colorizer").setup()
		  end,
		}

		use {
		  "rktjmp/lush.nvim",
		  cmd = { "LushRunQuickstart", "LushRunTutorial", "Lushify", "LushImport" },
		  disable = false,
		}

		use "tjdevries/colorbuddy.nvim"

		--
		-- Auto pairs
		use {
		  "windwp/nvim-autopairs",
		  opt = true,
		  event = "InsertEnter",
		  wants = "nvim-treesitter",
		  module = { "nvim-autopairs.completion.cmp", "nvim-autopairs" },
		  config = function()
			require("config.autopairs").setup()
		  end,
		}

		-- Auto tag
		use {
		  "windwp/nvim-ts-autotag",
		  opt = true,
		  wants = "nvim-treesitter",
		  event = "InsertEnter",
		  config = function()
			require("nvim-ts-autotag").setup { enable = true }
		  end,
		}

		-- End wise
		use {
		  "RRethy/nvim-treesitter-endwise",
		  opt = true,
		  wants = "nvim-treesitter",
		  event = "InsertEnter",
		  disable = false,
		}

		--
		-- Git ===============================================================
		--
		use {
		  "TimUntersberger/neogit",
		  cmd = "Neogit",
		  config = function()
			require("config.neogit").setup()
		  end,
		}
		use {
		  "lewis6991/gitsigns.nvim",
		  event = "BufReadPre",
		  wants = "plenary.nvim",
		  requires = { "nvim-lua/plenary.nvim" },
		  config = function()
			require("config.gitsigns").setup()
		  end,
		}
		use {
		  "tpope/vim-fugitive",
		  opt = true,
		  cmd = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
		  requires = {
			"tpope/vim-rhubarb",
			"idanarye/vim-merginal",
		  },
		  -- wants = { "vim-rhubarb" },
		}
		use { "rbong/vim-flog", cmd = { "Flog", "Flogsplit", "Floggit" }, wants = { "vim-fugitive" } }
		use {
		  "ruifm/gitlinker.nvim",
		  requires = "nvim-lua/plenary.nvim",
		  module = "gitlinker",
		  config = function()
			require("gitlinker").setup { mappings = nil }
		  end,
		}
		use {
		  "pwntester/octo.nvim",
		  cmd = "Octo",
		  wants = { "telescope.nvim", "plenary.nvim", "nvim-web-devicons" },
		  requires = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"kyazdani42/nvim-web-devicons",
		  },
		  config = function()
			require("octo").setup()
		  end,
		  disable = false,
		}
		use {
		  "akinsho/git-conflict.nvim",
		  cmd = {
			"GitConflictChooseTheirs",
			"GitConflictChooseOurs",
			"GitConflictChooseBoth",
			"GitConflictChooseNone",
			"GitConflictNextConflict",
			"GitConflictPrevConflict",
			"GitConflictListQf",
		  },
		  config = function()
			require("git-conflict").setup()
		  end,
		}
		use {
		  "ldelossa/gh.nvim",
		  opt = true,
		  wants = { "litee.nvim" },
		  requires = { { "ldelossa/litee.nvim" } },
		  event = "BufReadPre",
		  cmd = { "GHOpenPR" },
		  config = function()
			require("litee.lib").setup()
			require("litee.gh").setup()
		  end,
		  disable = true,
		}
		use { "f-person/git-blame.nvim", cmd = { "GitBlameToggle" } }
		use {
		  "tanvirtin/vgit.nvim",
		  config = function()
			require("vgit").setup()
		  end,
		  cmd = { "VGit" },
		}
		use { "knsh14/vim-github-link", cmd = { "GetCommitLink", "GetCurrentBranchLink", "GetCurrentCommitLink" } }
		use { "segeljakt/vim-silicon", cmd = { "Silicon" } }
		use { "mattn/vim-gist", opt = true, requires = { "mattn/webapi-vim" }, cmd = { "Gist" } }

	end --
}

