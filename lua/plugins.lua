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
    function(use, use_rocks)
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

            if
                vim.fn.isdirectory(vim.fn.expand("~/plugins/" .. plug_path))
                == 1
            then
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

        -- importantes: ======================================================

        -- gerenciador
        use "wbthomason/packer.nvim"

        -- Performance
        use "lewis6991/impatient.nvim"

        -- rocks I use
        -- use_rocks { "fun", "inspect" }
        use_rocks "fun"

        -- Load only when require
        -- use { "nvim-lua/plenary.nvim", module = "plenary" }
        use { "nvim-lua/plenary.nvim", rocks = "lyaml" }

        -- Notification
        use {
            "rcarriga/nvim-notify",
            event = "BufReadPre",
            config = function()
                require("config.notify").setup()
            end,
        }

        use "tjdevries/standard.vim"
        use "tjdevries/conf.vim"
        use "tjdevries/cyclist.vim"

        -- Performance
        use { "dstein64/vim-startuptime", cmd = "StartupTime" }
        use { "nathom/filetype.nvim" }

        -- Undo helper
        use "sjl/gundo.vim"

        -- Git ===============================================================

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
            cmd = {
                "Git",
                "Gread",
                "Gwrite",
                "GBrowse",
                "Gdiffsplit",
                "Gvdiffsplit",
            },
            requires = {
                "tpope/vim-rhubarb",
                "idanarye/vim-merginal",
            },
            -- wants = { "vim-rhubarb" },
        }
        use {
            "rbong/vim-flog",
            cmd = { "Flog", "Flogsplit", "Floggit" },
            wants = { "vim-fugitive" },
        }
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
            wants = {
                "telescope.nvim",
                "plenary.nvim",
                "nvim-web-devicons",
            },
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
        use {
            "knsh14/vim-github-link",
            cmd = {
                "GetCommitLink",
                "GetCurrentBranchLink",
                "GetCurrentCommitLink",
            },
        }
        use { "segeljakt/vim-silicon", cmd = { "Silicon" } }
        use {
            "mattn/vim-gist",
            opt = true,
            requires = { "mattn/webapi-vim" },
            cmd = { "Gist" },
        }

        -- Ferramentas: =======================================================

        -- Status line
        use {
            "nvim-lualine/lualine.nvim",
            event = "BufReadPre",
            after = "nvim-treesitter",
            config = function()
                require("config.lualine").setup()
            end,
            wants = "nvim-web-devicons",
        }

        -- Better increment/decrement
        use "monaqa/dial.nvim"

        use "jbyuki/venn.nvim"
        -- Uso: VBox

        use "untitled-ai/jupyter_ascending.vim"
        use { "dccsillag/magma-nvim", run = ":UpdateRemotePlugins" }

        use "sbdchd/neoformat"
        -- Terminal
        use {
            "akinsho/toggleterm.nvim",
            cmd = { "ToggleTerm", "TermExec" },
            module = { "toggleterm", "toggleterm.terminal" },
            config = function()
                require("config.toggleterm").setup()
            end,
        }
        -- use :TermExec cmd="python %" to run the Python file.
        -- use :TermExec cmd="python -m pdb %" to debug the Python file.
        -- use :TermExec cmd="nodemon -e py%" to monitor the Python file.
        -- npm install -g nodemon

        -- grava no redis o path dos arquivos salvos
        use { "neoclide/redismru.vim", run = "npm install" }
        vim.g.redismru_limit = 100

        use {
            "vim-scripts/ReplaceWithRegister",
            event = "BufEnter",
        }

        use {
            "smjonas/inc-rename.nvim",
            config = function()
                require("inc_rename").setup()
            end,
        }

        -- renamer.nvim
        use {
            "filipdutescu/renamer.nvim",
            module = { "renamer" },
            config = function()
                require("renamer").setup {}
            end,
        }

        use {
            "airblade/vim-rooter",
            config = function()
                vim.g.rooter_patterns = { ".git" }
            end,
        }

        use {
            "AckslD/nvim-neoclip.lua",
            requires = {
                { "tami5/sqlite.lua", module = "sqlite" },
                -- config = function()
                --  require("neoclip").setup()
                -- end,
            },
        }

        use {
            "ahmedkhalf/project.nvim",
            config = function()
                require("config.project").setup()
            end,
        }

        use {
            "ellisonleao/dotenv.nvim",
            config = function()
                require("dotenv").setup()
            end,
        }

        -- Git worktree utility6
        -- use 'ThePrimeagen/git-worktree.nvim'
        use {
            "ThePrimeagen/git-worktree.nvim",
            config = function()
                require("git-worktree").setup {}
            end,
        }
        -- Refactoring
        use {
            "ThePrimeagen/refactoring.nvim",
            module = { "refactoring", "telescope" },
            keys = { [[<leader>r]] },
            wants = { "telescope.nvim" },
            config = function()
                require("config.refactoring").setup()
            end,
        }
        use {
            "python-rope/ropevim",
            run = "pip install ropevim",
            disable = true,
        }
        use {
            "kevinhwang91/nvim-bqf",
            ft = "qf",
            disable = true,
            config = function()
                require("bqf").setup()
            end,
        }
        use {
            "kevinhwang91/nvim-hlslens",
            event = "BufReadPre",
            disable = true,
        }
        use {
            "nvim-pack/nvim-spectre",
            module = "spectre",
            keys = { "<leader>s" },
        }
        use {
            "https://gitlab.com/yorickpeterse/nvim-pqf",
            event = "BufReadPre",
            config = function()
                require("pqf").setup()
            end,
        }
        use {
            "kevinhwang91/nvim-ufo",
            opt = true,
            -- event = { "BufReadPre" },
            keys = { "zc", "zo", "zR", "zm" },
            wants = { "promise-async" },
            requires = "kevinhwang91/promise-async",
            config = function()
                require("ufo").setup {
                    provider_selector = function(bufnr, filetype)
                        return { "lsp", "treesitter", "indent" }
                    end,
                }
                vim.keymap.set("n", "zR", require("ufo").openAllFolds)
                vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
            end,
            disable = true,
        }

        use {
            "skywind3000/asynctasks.vim",
            requires = {
                "skywind3000/asynctasks.vim",
                "skywind3000/asyncrun.vim",
                "skywind3000/asyncrun.extra",
                "preservim/vimux",
            },
            -- :AsyncTask file-build
            -- :AsyncTask file-run
            -- :AsyncTaskList
            -- $(VIM_FILEPATH)    # File name of current buffer with full path.
            -- $(VIM_FILENAME)    # File name of current buffer without path.
            -- $(VIM_FILEDIR)     # Full path of current buffer without the file name.
            -- $(VIM_FILEEXT)     # File extension of current buffer.
            -- $(VIM_FILETYPE)    # File type (value of &ft in vim)
            -- $(VIM_FILENOEXT)   # File name of current buffer without path and extension.
            -- $(VIM_PATHNOEXT)   # Current file name with full path but without extension.
            -- $(VIM_CWD)         # Current directory (which :pwd returns).
            -- $(VIM_RELDIR)      # File path relativize to current directory.
            -- $(VIM_RELNAME)     # File name relativize to current directory.
            -- $(VIM_ROOT)        # Project root directory.
            -- $(VIM_CWORD)       # Word under cursor.
            -- $(VIM_CFILE)       # File name under cursor.
            -- $(VIM_CLINE)       # Cursor line number in current buffer
            -- $(VIM_GUI)         # has('gui_runnin')?
            -- $(VIM_VERSION)     # Value of v:version.
            -- $(VIM_COLUMNS)     # Current screen width.
            -- $(VIM_LINES)       # Current screen height.
            -- $(VIM_SVRNAME)     # Value of v:servername.
            -- $(VIM_PRONAME)     # Name of current project root directory
            -- $(VIM_DIRNAME)     # Name of current directory
            -- $(VIM_INIFILE)     # Full path name of current ini (.tasks) file.
            -- $(VIM_INIHOME)     # Where the ini file locates.
        }

        -- LSP ===============================================================

        use "wbthomason/lsp-status.nvim"
        use {
            "neovim/nvim-lspconfig",
            opt = true,
            event = { "BufReadPre" },
            wants = {
                -- "nvim-lsp-installer",
                "mason.nvim",
                "mason-lspconfig.nvim",
                "mason-tool-installer.nvim",
                "cmp-nvim-lsp",
                "lua-dev.nvim",
                "vim-illuminate",
                "null-ls.nvim",
                "schemastore.nvim",
                "typescript.nvim",
                "nvim-navic",
                "inlay-hints.nvim",
                -- "goto-preview",
            },
            config = function()
                require("config.lsp").setup()
            end,
            requires = {
                -- "williamboman/nvim-lsp-installer",
                -- { "lvimuser/lsp-inlayhints.nvim", branch = "readme" },
                "williamboman/mason.nvim",
                "williamboman/mason-lspconfig.nvim",
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                "folke/lua-dev.nvim",
                "RRethy/vim-illuminate",
                "jose-elias-alvarez/null-ls.nvim",
                {
                    "j-hui/fidget.nvim",
                    config = function()
                        require("fidget").setup {}
                    end,
                },
                "b0o/schemastore.nvim",
                "jose-elias-alvarez/typescript.nvim",
                {
                    "SmiteshP/nvim-navic",
                    config = function()
                        require("nvim-navic").setup {}
                    end,
                    module = { "nvim-navic" },
                },
                {
                    "simrat39/inlay-hints.nvim",
                    config = function()
                        require("inlay-hints").setup()
                    end,
                },
                -- {
                --   "weilbith/nvim-code-action-menu",
                --   cmd = "CodeActionMenu",
                -- },
                -- {
                --   "rmagatti/goto-preview",
                --   config = function()
                --     require("goto-preview").setup {}
                --   end,
                -- },
                {
                    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
                    config = function()
                        require("lsp_lines").setup()
                    end,
                },
            },
        }

        -- trouble.nvim
        use {
            "folke/trouble.nvim",
            wants = "nvim-web-devicons",
            cmd = { "TroubleToggle", "Trouble" },
            config = function()
                require("trouble").setup {
                    use_diagnostic_signs = true,
                }
            end,
        }

        -- lspsaga.nvim
        use {
            "glepnir/lspsaga.nvim",
            cmd = { "Lspsaga" },
            config = function()
                require("lspsaga").init_lsp_saga()
            end,
        }

        --
        -- IVAN ==============================================================
        --

        use "lopesivan/template.vim"
        use {
            "lopesivan/nvim-cheetah",
            run = ":UpdateRemotePlugins",
        }

        -- local_use "maps.vim"
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

        -- Code documentation ================================================
        --
        -- use {
        --     "danymat/neogen",
        --     config = function()
        --         require("config.neogen").setup()
        --     end,
        --     cmd = { "Neogen" },
        --     module = "neogen",
        --     disable = false,
        -- }

        use {
            "kkoomen/vim-doge",
            run = ":call doge#install()",
            config = function()
                require("config.doge").setup()
            end,
            cmd = { "DogeGenerate", "DogeCreateDocStandard" },
            disable = false,
        }

        -- Translation
        use {
            "uga-rosa/translate.nvim",
            cmd = {
                "Translate",
            },
            config = function()
                -- :Translate pt-BR en
                require("config.translate").setup()
            end,
        }
        --
        -- TIM POPE ==========================================================
        --
        use "tpope/vim-abolish" -- Cool things with words!
        use "tpope/vim-characterize"
        use "tpope/vim-dispatch"
        use "radenling/vim-dispatch-neovim"
        use "tpope/vim-endwise"
        use "tpope/vim-eunuch"
        use "tpope/vim-git"
        use "tpope/vim-haml"
        use "tpope/vim-liquid"
        use "tpope/vim-markdown"
        vim.g.markdown_fenced_languages = {
            "html",
            "python",
            "bash=sh",
            "maple",
        }
        vim.g.markdown_minlines = 100
        vim.g.markdown_syntax_conceal = 0

        use "tpope/vim-projectionist" -- STREAM: Alternate file editting and some helpful stuff

        -- Session
        use {
            "rmagatti/auto-session",
            opt = true,
            cmd = { "SaveSession", "RestoreSession" },
            requires = { "rmagatti/session-lens" },
            wants = { "telescope.nvim", "session-lens" },
            config = function()
                require("bad_practices").setup()
            end,
            disable = false,
        }

        use {
            "jedrzejboczar/possession.nvim",
            config = function()
                require("config.possession").setup()
            end,
            cmd = {
                "PossessionSave",
                "PosessionLoad",
                "PosessionShow",
                "PossessionList",
            },
            disable = true,
        }
        use {
            "tpope/vim-obsession",
            cmd = { "Obsess" },
            config = function()
                require("config.obsession").setup()
            end,
            disable = true,
        }

        -- Practice
        use {
            "antonk52/bad-practices.nvim",
            event = "BufReadPre",
            config = function()
                require("bad_practices").setup()
            end,
            disable = true,
        }
        -- use "tpope/vim-projectionist" -- STREAM: Alternate file editting and some helpful stuff
        use "tpope/vim-ragtag"
        use "tpope/vim-rake"
        use "tpope/vim-repeat" -- Repeat actions better
        use "tpope/vim-rhubarb"
        use "tpope/vim-sensible"
        --use "tpope/vim-surround" -- Surround text objects easily
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

        -- Linguagens: =======================================================

        use { "lervag/vimtex", ft = "tex" }
        vim.g.vimtex_view_method = "zathura"
        vim.g.tex_flavor = "latex"
        vim.opt.conceallevel = 2

        -- Markdown
        use "lukas-reineke/headlines.nvim"
        use {
            "iamcco/markdown-preview.nvim",
            opt = true,
            run = function()
                vim.fn["mkdp#util#install"]()
            end,
            ft = "markdown",
            cmd = { "MarkdownPreview" },
            requires = { "zhaozg/vim-diagram", "aklt/plantuml-syntax" },
        }
        use {
            "jakewvincent/mkdnflow.nvim",
            config = function()
                require("mkdnflow").setup {}
            end,
            ft = "markdown",
        }
        use {
            "nvim-neorg/neorg",
            config = function()
                require("neorg").setup {
                    load = {
                        ["core.defaults"] = {},
                        ["core.presenter"] = {
                            config = {
                                zen_mode = "truezen",
                            },
                        },
                    },
                }
            end,
            ft = "norg",
            after = "nvim-treesitter",
            requires = { "nvim-lua/plenary.nvim", "Pocco81/TrueZen.nvim" },
            disable = true,
        }

        -- use 'vinibispo/ruby.nvim'
        use {
            "vinibispo/ruby.nvim",
            requires = {
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter",
            },
        } -- Ruby general
        use "arnoudbuzing/wolfram-vim"
        use {
            "cuducos/yaml.nvim",
            requires = {
                "nvim-treesitter/nvim-treesitter",
                "nvim-telescope/telescope.nvim",
            },
        } -- Yaml navigation

        use "tjdevries/green_light.nvim"
        use "justinmk/vim-syntax-extra"

        -- Kotlin
        use { "udalov/kotlin-vim", ft = { "kotlin" }, disable = true }

        use "jvirtanen/vim-octave"
        use { "ellisonleao/glow.nvim", branch = "main" }

        -- Java
        use { "mfussenegger/nvim-jdtls", ft = { "java" } }

        -- Flutter
        use {
            "akinsho/flutter-tools.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                require("config.flutter").setup()
            end,
            disable = true,
        }

        -- Rust
        use {
            "simrat39/rust-tools.nvim",
            requires = { "nvim-lua/plenary.nvim", "rust-lang/rust.vim" },
            opt = true,
            module = "rust-tools",
            ft = { "rust" },
            -- branch = "modularize_and_inlay_rewrite",
            -- config = function()
            --   require("config.rust").setup()
            -- end,
        }
        use {
            "saecki/crates.nvim",
            event = { "BufRead Cargo.toml" },
            requires = { { "nvim-lua/plenary.nvim" } },
            config = function()
                -- local null_ls = require "null-ls"
                require("crates").setup {
                    null_ls = {
                        enabled = true,
                        name = "crates.nvim",
                    },
                }
            end,
            disable = false,
        }

        -- Go
        use {
            "ray-x/go.nvim",
            ft = { "go" },
            config = function()
                require("go").setup()
            end,
            disable = true,
        }

        -- Nav ===============================================================

        -- use "yamatsum/nvim-cursorline"
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

        -- Motions
        use { "andymass/vim-matchup", event = "CursorMoved" }
        use { "wellle/targets.vim", event = "CursorMoved" }
        --[[ Mostra a letra se usar f,t,F,T,;
        use {
            "unblevable/quick-scope",
            event = "CursorMoved",
            disable = false,
        } ]]
        use {
            "chaoren/vim-wordmotion",
            opt = true,
            fn = { "<Plug>WordMotion_w" },
        }

        -- Jumps
        use {
            "phaazon/hop.nvim",
            cmd = { "HopWord", "HopChar1" },
            config = function()
                require("hop").setup {}
            end,
        }

        -- Buffer
        use { "kazhala/close-buffers.nvim", cmd = { "BDelete", "BWipeout" } }
        use {
            "matbme/JABS.nvim",
            cmd = "JABSOpen",
            config = function()
                require("config.jabs").setup()
            end,
            disable = false,
        }
        use {
            "chentoast/marks.nvim",
            event = "BufReadPre",
            config = function()
                require("marks").setup {}
            end,
        }
        --  Plugins:  Navegando usando `marks'
        --[[
        use "kshenoy/vim-signature"
mx         Toggle mark 'x' and display it in the leftmost column
dmx        Remove mark 'x' where x is a-zA-Z

m,         Place the next available mark
m.         If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
m-         Delete all marks from the current line
m<Space>   Delete all marks from the current buffer
]`         Jump to next mark
[`         Jump to prev mark
]'         Jump to start of next line containing a mark
['         Jump to start of prev line containing a mark
`]         Jump by alphabetical order to next mark
`[         Jump by alphabetical order to prev mark
']         Jump by alphabetical order to start of next line having a mark
'[         Jump by alphabetical order to start of prev line having a mark
m/         Open location list and display marks from current buffer

m[0-9]     Toggle the corresponding marker !@#$%^&*()
m<S-[0-9]> Remove all markers of the same type
]-         Jump to next line having a marker of the same type
[-         Jump to prev line having a marker of the same type
]=         Jump to next line having a marker of any type
[=         Jump to prev line having a marker of any type
m?         Open location list and display markers from current buffer
m<BS>      Remove all markers
--]]

        -- Nav/Code/motion ===================================================

        use { "google/vim-searchindex", event = "BufReadPre" }

        --
        -- STREAM: Show off edit_alternate.vim
        use {
            "tjdevries/edit_alternate.vim",
            config = function()
                vim.api.nvim_set_keymap(
                    "n",
                    "<leader>ea",
                    "<cmd>EditAlternate<CR>",
                    { silent = true }
                )
            end,
        }

        use {
            "stevearc/aerial.nvim",
            config = function()
                require("aerial").setup()
            end,
            module = { "aerial" },
            cmd = { "AerialToggle" },
        }

        -- Lua
        use {
            "abecodes/tabout.nvim",
            config = function()
                require("tabout").setup {
                    tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
                    backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
                    act_as_tab = true, -- shift content if tab out is not possible
                    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
                    default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
                    default_shift_tab = "<C-d>", -- reverse shift default action,
                    enable_backwards = true, -- well ...
                    completion = true, -- if the tabkey is used in a completion pum
                    tabouts = {
                        { open = "'", close = "'" },
                        { open = '"', close = '"' },
                        { open = "`", close = "`" },
                        { open = "(", close = ")" },
                        { open = "[", close = "]" },
                        { open = "{", close = "}" },
                    },
                    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
                    exclude = {}, -- tabout will ignore these filetypes
                }
            end,
            wants = { "nvim-treesitter" }, -- or require if not used so far
            -- after = {'completion-nvim'} -- if a completion plugin is using tabs load it before
        }

        -- AI completion
        -- use { "github/copilot.vim", event = "InsertEnter", disable = true }

        -- Legendary
        use {
            "mrjones2014/legendary.nvim",
            opt = true,
            keys = { [[<C-p>]] },
            -- wants = { "dressing.nvim" },
            module = { "legendary" },
            cmd = { "Legendary" },
            config = function()
                require("config.legendary").setup()
            end,
            -- requires = { "stevearc/dressing.nvim" },
        }

        -- Harpoon
        use {
            "ThePrimeagen/harpoon",
            keys = { [[<leader>j]] },
            module = {
                "harpoon",
                "harpoon.cmd-ui",
                "harpoon.mark",
                "harpoon.ui",
                "harpoon.term",
            },
            wants = { "telescope.nvim" },
            config = function()
                require("config.harpoon").setup()
            end,
        }

        -- Test/Debug=========================================================

        -- Debugging
        use {
            "mfussenegger/nvim-dap",
            opt = true,
            -- event = "BufReadPre",
            keys = { [[<leader>d]] },
            module = { "dap" },
            wants = {
                "nvim-dap-virtual-text",
                "nvim-dap-ui",
                "nvim-dap-python",
                "which-key.nvim",
            },
            requires = {
                -- "alpha2phi/DAPInstall.nvim",
                -- { "Pocco81/dap-buddy.nvim", branch = "dev" },
                "theHamsta/nvim-dap-virtual-text",
                "rcarriga/nvim-dap-ui",
                "mfussenegger/nvim-dap-python",
                "nvim-telescope/telescope-dap.nvim",
                { "leoluz/nvim-dap-go", module = "dap-go" },
                { "jbyuki/one-small-step-for-vimkind", module = "osv" },
            },
            config = function()
                require("config.dap").setup()
            end,
            disable = false,
        }

        use {
            "andrewferrier/debugprint.nvim",
            config = function()
                require("debugprint").setup {
                    create_keymaps = false,
                    create_commands = false,
                }
            end,
        }

        -- vimspector
        use {
            "puremourning/vimspector",
            cmd = { "VimspectorInstall", "VimspectorUpdate" },
            fn = {
                "vimspector#Launch()",
                "vimspector#ToggleBreakpoint",
                "vimspector#Continue",
            },
            config = function()
                require("config.vimspector").setup()
            end,
            disable = true,
        }

        -- Test
        use {
            "nvim-neotest/neotest",
            opt = true,
            wants = {
                "plenary.nvim",
                "nvim-treesitter",
                "FixCursorHold.nvim",
                "neotest-python",
                "neotest-plenary",
                "neotest-go",
                "neotest-jest",
                "neotest-vim-test",
                "neotest-rust",
                "vim-test",
                "overseer.nvim",
            },
            requires = {
                "vim-test/vim-test",
                "nvim-lua/plenary.nvim",
                "nvim-treesitter/nvim-treesitter",
                "antoinemadec/FixCursorHold.nvim",
                "nvim-neotest/neotest-python",
                "nvim-neotest/neotest-plenary",
                "nvim-neotest/neotest-go",
                "haydenmeade/neotest-jest",
                "nvim-neotest/neotest-vim-test",
                "rouge8/neotest-rust",
            },
            module = { "neotest", "neotest.async" },
            cmd = {
                "TestNearest",
                "TestFile",
                "TestSuite",
                "TestLast",
                "TestVisit",
            },
            config = function()
                require("config.neotest").setup()
            end,
            disable = false,
        }
        -- use {
        --   "rcarriga/vim-ultest",
        --   requires = { "vim-test/vim-test" },
        --   opt = true,
        --   keys = { "<leader>t" },
        --   cmd = {
        --     "TestNearest",
        --     "TestFile",
        --     "TestSuite",
        --     "TestLast",
        --     "TestVisit",
        --     "Ultest",
        --     "UltestNearest",
        --     "UltestDebug",
        --     "UltestLast",
        --     "UltestSummary",
        --   },
        --   module = "ultest",
        --   run = ":UpdateRemotePlugins",
        --   config = function()
        --     require("config.test").setup()
        --   end,
        -- }
        use { "diepm/vim-rest-console", ft = { "rest" }, disable = false }
        use {
            "NTBBloodbath/rest.nvim",
            config = function()
                require("rest-nvim").setup {}
                vim.keymap.set(
                    "n",
                    "<C-j>",
                    "<Plug>RestNvim",
                    { noremap = true, silent = true }
                )
            end,
            disable = true,
        }

        -- User interface ====================================================

        use {
            "stevearc/dressing.nvim",
            event = "BufReadPre",
            config = function()
                require("dressing").setup {
                    input = { relative = "editor" },
                    select = {
                        backend = { "telescope", "fzf", "builtin" },
                    },
                }
            end,
            disable = false,
        }

        use {
            "ray-x/guihua.lua",
            run = "cd lua/fzy && make",
            disable = true,
        }

        -- WhichKey
        use {
            "folke/which-key.nvim",
            event = "VimEnter",
            -- keys = { [[<leader>]] },
            config = function()
                require("config.whichkey").setup()
            end,
            disable = false,
        }
        -- Lua
        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function()
                require("todo-comments").setup {
                    -- your configuration comes here
                    -- or leave it empty to use the default settings
                    -- refer to the configuration section below
                }
            end,
            -- PERF: fully optimised
            -- HACK: hmmm, this looks a bit funky
            -- TODO: What else?
            -- NOTE: adding a note
            -- FIX: this needs fixing
            -- WARNING: ???
            -- FIX: ddddd
            -- todo: fooo
            -- @TODO foobar
            -- @hack foobar
        }
        -- IndentLine
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufReadPre",
            config = function()
                require("config.indentblankline").setup()
            end,
        }

        -- Better icons
        use {
            "kyazdani42/nvim-web-devicons",
            module = "nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup { default = true }
            end,
        }

        -- Better Comment
        use { "numToStr/Comment.nvim" }

        -- Better surround
        use { "tpope/vim-surround", event = "BufReadPre" }
        -- use {
        --     "Matt-A-Bennett/vim-surround-funk",
        --     event = "BufReadPre",
        --     config = function()
        --         require("config.surroundfunk").setup()
        --     end,
        --     disable = true,
        -- }
        --
        -- NVIM-LUA ==========================================================
        --
        use { "nvim-lua/popup.nvim" }
        -- use { "nvim-lua/plenary.nvim", rocks = "lyaml"}

        -- ULTISNIPS =========================================================

        use {
            "SirVer/ultisnips",
            requires = { { "honza/vim-snippets", rtp = "." } },
            config = function()
                vim.g.UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
                vim.g.UltiSnipsJumpForwardTrigger =
                    "<Plug>(ultisnips_jump_forward)"
                vim.g.UltiSnipsJumpBackwardTrigger =
                    "<Plug>(ultisnips_jump_backward)"
                vim.g.UltiSnipsListSnippets = "<c-x><c-s>"
                vim.g.UltiSnipsRemoveSelectModeMappings = 0
                vim.g.UltiSnipsSnippetDirectories = { "UltiSnips" }
                vim.g.UltiSnipsEditSplit = "vertical"
            end,
        }

        use "lopesivan/vim-pythonx"

        -- CMP
        use "quangnguyen30192/cmp-nvim-ultisnips"

        use "lopesivan/noah.vim"

        -- junegunn ==========================================================

        use { "Junegunn/vim-easy-align" }
        -- use { "junegunn/vim-emoji" }
        -- use {'junegunn/vim-peekaboo'}
        -- use { "junegunn/vim-journal" }
        -- use {'junegunn/seoul256.vim'}
        -- use { "junegunn/gv.vim" }
        -- use { "junegunn/rainbow_parentheses.vim" }
        -- use { "junegunn/fzf.vim" }
        -- use { "junegunn/fzf", run = "./install --all" } -- Fuzzy Searcher

        -- Colorscheme =======================================================
        --
        use {
            "Mofiqul/adwaita.nvim",
            config = function()
                vim.cmd "colorscheme adwaita"
            end,
        }

        use {
            "norcalli/nvim-colorizer.lua",
            -- cmd = "ColorizerToggle",
            config = function()
                require("colorizer").setup()
            end,
        }
        --[[

        use "rebelot/kanagawa.nvim"

        use {
          "folke/tokyonight.nvim",
          config = function()
            vim.cmd "colorscheme tokyonight"
          end,
          disable = true,
        }


        use {
          "rktjmp/lush.nvim",
          cmd = { "LushRunQuickstart", "LushRunTutorial", "Lushify", "LushImport" },
          disable = false,
        }

--]]
        use "tjdevries/colorbuddy.nvim"

        -- TREE SITTER =======================================================
        --
        -- use "nvim-treesitter/nvim-treesitter"
        use "nvim-treesitter/playground"
        use "nvim-treesitter/nvim-treesitter-refactor"
        use "theHamsta/nvim-treesitter-pairs"

        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            opt = true,
            event = "BufReadPre",
            run = ":TSUpdate",
            config = function()
                require("config.treesitter").setup()
            end,
            requires = {
                {
                    "nvim-treesitter/nvim-treesitter-textobjects",
                    event = "BufReadPre",
                },
                { "windwp/nvim-ts-autotag", event = "InsertEnter" },
                {
                    "JoosepAlviste/nvim-ts-context-commentstring",
                    event = "BufReadPre",
                },
                -- { "p00f/nvim-ts-rainbow", event = "BufReadPre" },
                {
                    "RRethy/nvim-treesitter-textsubjects",
                    event = "BufReadPre",
                },
                -- { "nvim-treesitter/nvim-treesitter-context", event = "BufReadPre" },
                -- { "yioneko/nvim-yati", event = "BufReadPre" },
            },
        }

        use { "nvim-telescope/telescope.nvim" }
        use { "nvim-telescope/telescope-rs.nvim" }
        use { "nvim-telescope/telescope-fzf-writer.nvim" }

        use {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        }
        -- use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }

        use { "nvim-telescope/telescope-packer.nvim" }
        -- use { "nvim-telescope/telescope-fzy-native.nvim" }
        use { "nvim-telescope/telescope-hop.nvim" }
        -- use { "nvim-telescope/telescope-file-browser.nvim" }
        use { "nvim-telescope/telescope-ui-select.nvim" }
        use { "nvim-telescope/telescope-smart-history.nvim" }

        use { "nvim-telescope/telescope-github.nvim" }
        use { "nvim-telescope/telescope-symbols.nvim" }

        -- compila
        use "pianocomposer321/yabs.nvim"
        use "WaylonWalker/Telegraph.nvim"

        use "RishabhRD/nvim-cheat.sh"
        use "RishabhRD/popfix"
        use "nvim-telescope/telescope-cheat.nvim"
        use "nvim-telescope/telescope-project.nvim"
        use "cljoly/telescope-repo.nvim"
        use "nvim-telescope/telescope-file-browser.nvim"
        use {
            "nvim-telescope/telescope-frecency.nvim",
            requires = "tami5/sqlite.lua",
        }

        use { "nvim-telescope/telescope-fzy-native.nvim" }

        -- Debugging
        -- Debug adapter protocol
        -- use "mfussenegger/nvim-dap"
        -- use "rcarriga/nvim-dap-ui"
        -- use "theHamsta/nvim-dap-virtual-text"
        use "nvim-telescope/telescope-dap.nvim"
        -- use "mfussenegger/nvim-dap-python"

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

        -- Optional: Used to make nice menus
        use "skywind3000/quickmenu.vim"

        -- For narrowing regions of text to look at them alone
        use { "chrisbra/NrrwRgn" }

        use "godlygeek/tabular" -- Quickly align text by pattern
        use "tommcdo/vim-exchange"
        use "AndrewRadev/switch.vim"

        use "mg979/vim-visual-multi"

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
        --[[
		-- use "Pocco81/dap-buddy.nvim"
		use "alpha2phi/DAPInstall.nvim"

		use "jbyuki/one-small-step-for-vimkind" -- <-- this is a plugin OSV
		use "leoluz/nvim-dap-go"
		use "TravonteD/luajob"
        --]]

        -- nvim-tree
        use {
            "kyazdani42/nvim-tree.lua",
            opt = true,
            wants = "nvim-web-devicons",
            cmd = { "NvimTreeToggle", "NvimTreeClose" },
            -- module = "nvim-tree",
            config = function()
                require("config.nvimtree").setup()
            end,
        }

        -- Buffer line
        use {
            "akinsho/nvim-bufferline.lua",
            event = "BufReadPre",
            wants = "nvim-web-devicons",
            config = function()
                require("config.bufferline").setup()
            end,
        }

        -- CMP ===============================================================

        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-calc",
                "octaltree/cmp-look",
                "uga-rosa/cmp-dictionary",
                "hrsh7th/cmp-emoji",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp-signature-help",
                "hrsh7th/cmp-path",
                "davidsierradz/cmp-conventionalcommits",
                "ray-x/cmp-treesitter",
                "lopesivan/cmp-jptemplate",
                "hrsh7th/cmp-cmdline",
            },
        }

        -- Comparators
        use "lukas-reineke/cmp-under-comparator"

        -- Completion
        --[[ use {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            opt = true,
            config = function()
                require("config.cmp").setup()
            end,
            wants = { "LuaSnip" },
            requires = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lua",
                "ray-x/cmp-treesitter",
                "hrsh7th/cmp-cmdline",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lsp-signature-help",
                -- "onsails/lspkind-nvim",
                -- "hrsh7th/cmp-calc",
                -- "f3fora/cmp-spell",
                -- "hrsh7th/cmp-emoji",
                {
                    "L3MON4D3/LuaSnip",
                    wants = { "friendly-snippets", "vim-snippets" },
                    config = function()
                        require("config.snip").setup()
                    end,
                },
                "rafamadriz/friendly-snippets",
                "honza/vim-snippets",
            },
        } ]]

        use {
            "ericpubu/lsp_codelens_extensions.nvim",
            config = function()
                require("codelens_extensions").setup()
            end,
        }

        -- ===================================================================
        -- ===================================================================
    end,

    config = {
        display = {
            -- open_fn = require('packer.util').float,
        },
    },
}
