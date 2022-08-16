-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/ivan/.config/nvim-beginner/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/ivan/.config/nvim-beginner/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/ivan/.config/nvim-beginner/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/ivan/.config/nvim-beginner/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/ivan/.config/nvim-beginner/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    config = { "\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1d\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  ["JABS.nvim"] = {
    commands = { "JABSOpen" },
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16config.jabs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/JABS.nvim",
    url = "https://github.com/matbme/JABS.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16config.snip\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip",
    wants = { "friendly-snippets", "vim-snippets" }
  },
  NrrwRgn = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/NrrwRgn",
    url = "https://github.com/chrisbra/NrrwRgn"
  },
  ReplaceWithRegister = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/ReplaceWithRegister",
    url = "https://github.com/vim-scripts/ReplaceWithRegister"
  },
  ["Telegraph.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/Telegraph.nvim",
    url = "https://github.com/WaylonWalker/Telegraph.nvim"
  },
  ["adwaita.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/adwaita.nvim",
    url = "https://github.com/Mofiqul/adwaita.nvim"
  },
  ["aerial.nvim"] = {
    commands = { "AerialToggle" },
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vaerial\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["asyncrun.extra"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/asyncrun.extra",
    url = "https://github.com/skywind3000/asyncrun.extra"
  },
  ["asyncrun.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/asyncrun.vim",
    url = "https://github.com/skywind3000/asyncrun.vim"
  },
  ["asynctasks.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/asynctasks.vim",
    url = "https://github.com/skywind3000/asynctasks.vim"
  },
  ["auto-session"] = {
    after = { "session-lens" },
    commands = { "SaveSession", "RestoreSession" },
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18bad_practices\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/auto-session",
    url = "https://github.com/rmagatti/auto-session",
    wants = { "telescope.nvim", "session-lens" }
  },
  ["close-buffers.nvim"] = {
    commands = { "BDelete", "BWipeout" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/close-buffers.nvim",
    url = "https://github.com/kazhala/close-buffers.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after_files = { "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-nvim-ultisnips"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/cmp-nvim-ultisnips",
    url = "https://github.com/quangnguyen30192/cmp-nvim-ultisnips"
  },
  ["cmp-path"] = {
    after_files = { "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-treesitter"] = {
    after_files = { "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-treesitter/after/plugin/cmp_treesitter.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    after_files = { "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["colorbuddy.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/colorbuddy.nvim",
    url = "https://github.com/tjdevries/colorbuddy.nvim"
  },
  ["conf.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/conf.vim",
    url = "https://github.com/tjdevries/conf.vim"
  },
  ["contextmenu.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/contextmenu.nvim",
    url = "https://github.com/lopesivan/contextmenu.nvim"
  },
  ["crates.nvim"] = {
    after_files = { "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/crates.nvim/after/plugin/cmp_crates.lua" },
    config = { "\27LJ\2\nh\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fnull_ls\1\0\0\1\0\2\tname\16crates.nvim\fenabled\2\nsetup\vcrates\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/crates.nvim",
    url = "https://github.com/saecki/crates.nvim"
  },
  ["cyclist.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/cyclist.vim",
    url = "https://github.com/tjdevries/cyclist.vim"
  },
  ["dial.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/dial.nvim",
    url = "https://github.com/monaqa/dial.nvim"
  },
  ["dotenv.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vdotenv\frequire\0" },
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/dotenv.nvim",
    url = "https://github.com/ellisonleao/dotenv.nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\nš\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\vselect\fbackend\1\0\0\1\4\0\0\14telescope\bfzf\fbuiltin\ninput\1\0\0\1\0\1\rrelative\veditor\nsetup\rdressing\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  ["edit_alternate.vim"] = {
    config = { "\27LJ\2\nr\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\27<cmd>EditAlternate<CR>\15<leader>ea\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/edit_alternate.vim",
    url = "https://github.com/tjdevries/edit_alternate.vim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["git-blame.nvim"] = {
    commands = { "GitBlameToggle" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["git-conflict.nvim"] = {
    commands = { "GitConflictChooseTheirs", "GitConflictChooseOurs", "GitConflictChooseBoth", "GitConflictChooseNone", "GitConflictNextConflict", "GitConflictPrevConflict", "GitConflictListQf" },
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17git-conflict\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/git-conflict.nvim",
    url = "https://github.com/akinsho/git-conflict.nvim"
  },
  ["git-worktree.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17git-worktree\frequire\0" },
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/git-worktree.nvim",
    url = "https://github.com/ThePrimeagen/git-worktree.nvim"
  },
  ["gitlinker.nvim"] = {
    config = { "\27LJ\2\n>\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\0\nsetup\14gitlinker\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/gitlinker.nvim",
    url = "https://github.com/ruifm/gitlinker.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim",
    wants = { "plenary.nvim" }
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/glow.nvim",
    url = "https://github.com/ellisonleao/glow.nvim"
  },
  ["green_light.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/green_light.nvim",
    url = "https://github.com/tjdevries/green_light.nvim"
  },
  ["gundo.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/gundo.vim",
    url = "https://github.com/sjl/gundo.vim"
  },
  harpoon = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config.harpoon\frequire\0" },
    keys = { { "", "<leader>j" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon",
    wants = { "telescope.nvim" }
  },
  ["headlines.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/headlines.nvim",
    url = "https://github.com/lukas-reineke/headlines.nvim"
  },
  ["hop.nvim"] = {
    commands = { "HopWord", "HopChar1" },
    config = { "\27LJ\2\n5\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["hp50g.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/hp50g.vim",
    url = "https://github.com/lopesivan/hp50g.vim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["inc-rename.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15inc_rename\frequire\0" },
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/inc-rename.nvim",
    url = "https://github.com/smjonas/inc-rename.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\27config.indentblankline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["inlay-hints.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16inlay-hints\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/inlay-hints.nvim",
    url = "https://github.com/simrat39/inlay-hints.nvim"
  },
  ["jupyter_ascending.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/jupyter_ascending.vim",
    url = "https://github.com/untitled-ai/jupyter_ascending.vim"
  },
  ["legendary.nvim"] = {
    commands = { "Legendary" },
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config.legendary\frequire\0" },
    keys = { { "", "<C-p>" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/legendary.nvim",
    url = "https://github.com/mrjones2014/legendary.nvim"
  },
  ["lir-git-status.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/lir-git-status.nvim",
    url = "https://github.com/tamago324/lir-git-status.nvim"
  },
  ["lir-mmv.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/lir-mmv.nvim",
    url = "https://github.com/tamago324/lir-mmv.nvim"
  },
  ["lir.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/lir.nvim",
    url = "https://github.com/tamago324/lir.nvim"
  },
  ["lsp-status.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/lsp-status.nvim",
    url = "https://github.com/wbthomason/lsp-status.nvim"
  },
  ["lsp_codelens_extensions.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24codelens_extensions\frequire\0" },
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/lsp_codelens_extensions.nvim",
    url = "https://github.com/ericpubu/lsp_codelens_extensions.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lspsaga.nvim"] = {
    commands = { "Lspsaga" },
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lua-dev.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config.lualine\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim",
    wants = { "nvim-web-devicons" }
  },
  ["maps.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/maps.vim",
    url = "https://github.com/lopesivan/maps.vim"
  },
  ["markdown-preview.nvim"] = {
    after = { "vim-diagram", "plantuml-syntax" },
    commands = { "MarkdownPreview" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["marks.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\nmarks\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/marks.nvim",
    url = "https://github.com/chentoast/marks.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason-tool-installer.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/mason-tool-installer.nvim",
    url = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
  },
  ["mason.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["mkdnflow.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rmkdnflow\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/mkdnflow.nvim",
    url = "https://github.com/jakewvincent/mkdnflow.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  neogen = {
    commands = { "Neogen" },
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config.neogen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/neogen",
    url = "https://github.com/danymat/neogen"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config.neogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["neotemplate.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/neotemplate.nvim",
    url = "https://github.com/lopesivan/neotemplate.nvim"
  },
  neotest = {
    after = { "neotest-jest", "neotest-python", "neotest-plenary", "neotest-go", "neotest-vim-test", "neotest-rust", "vim-test" },
    commands = { "TestNearest", "TestFile", "TestSuite", "TestLast", "TestVisit" },
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config.neotest\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/neotest",
    url = "https://github.com/nvim-neotest/neotest",
    wants = { "plenary.nvim", "nvim-treesitter", "FixCursorHold.nvim", "neotest-python", "neotest-plenary", "neotest-go", "neotest-jest", "neotest-vim-test", "neotest-rust", "vim-test", "overseer.nvim" }
  },
  ["neotest-go"] = {
    load_after = {
      neotest = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/neotest-go",
    url = "https://github.com/nvim-neotest/neotest-go"
  },
  ["neotest-jest"] = {
    load_after = {
      neotest = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/neotest-jest",
    url = "https://github.com/haydenmeade/neotest-jest"
  },
  ["neotest-plenary"] = {
    load_after = {
      neotest = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/neotest-plenary",
    url = "https://github.com/nvim-neotest/neotest-plenary"
  },
  ["neotest-python"] = {
    load_after = {
      neotest = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/neotest-python",
    url = "https://github.com/nvim-neotest/neotest-python"
  },
  ["neotest-rust"] = {
    load_after = {
      neotest = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/neotest-rust",
    url = "https://github.com/rouge8/neotest-rust"
  },
  ["neotest-vim-test"] = {
    load_after = {
      neotest = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/neotest-vim-test",
    url = "https://github.com/nvim-neotest/neotest-vim-test"
  },
  ["noah.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/noah.vim",
    url = "https://github.com/lopesivan/noah.vim"
  },
  ["null-ls.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n>\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\21config.autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs",
    wants = { "nvim-treesitter" }
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config.bufferline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-bufferline.lua",
    url = "https://github.com/akinsho/nvim-bufferline.lua",
    wants = { "nvim-web-devicons" }
  },
  ["nvim-cheat.sh"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/nvim-cheat.sh",
    url = "https://github.com/RishabhRD/nvim-cheat.sh"
  },
  ["nvim-cheetah"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/nvim-cheetah",
    url = "https://github.com/lopesivan/nvim-cheetah"
  },
  ["nvim-cmp"] = {
    after = { "LuaSnip", "cmp-nvim-lua", "cmp-nvim-lsp-signature-help", "cmp-path", "cmp-buffer", "cmp-treesitter", "cmp-cmdline", "friendly-snippets", "cmp-nvim-lsp", "cmp_luasnip" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config.cmp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp",
    wants = { "LuaSnip" }
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-dap"] = {
    after = { "nvim-dap-go", "one-small-step-for-vimkind", "nvim-dap-ui", "nvim-dap-python", "nvim-dap-virtual-text" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config.dap\frequire\0" },
    keys = { { "", "<leader>d" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-dap",
    url = "https://github.com/mfussenegger/nvim-dap",
    wants = { "nvim-dap-virtual-text", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" }
  },
  ["nvim-dap-go"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-dap-go",
    url = "https://github.com/leoluz/nvim-dap-go"
  },
  ["nvim-dap-python"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-dap-python",
    url = "https://github.com/mfussenegger/nvim-dap-python"
  },
  ["nvim-dap-ui"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-dap-ui",
    url = "https://github.com/rcarriga/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text",
    url = "https://github.com/theHamsta/nvim-dap-virtual-text"
  },
  ["nvim-jdtls"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-jptemplate"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/nvim-jptemplate",
    url = "https://github.com/lopesivan/nvim-jptemplate"
  },
  ["nvim-lspconfig"] = {
    after = { "mason.nvim", "mason-lspconfig.nvim", "mason-tool-installer.nvim", "lua-dev.nvim", "vim-illuminate", "schemastore.nvim", "typescript.nvim", "nvim-navic", "lsp_lines.nvim", "inlay-hints.nvim", "null-ls.nvim", "fidget.nvim" },
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15config.lsp\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig",
    wants = { "mason.nvim", "mason-lspconfig.nvim", "mason-tool-installer.nvim", "cmp-nvim-lsp", "lua-dev.nvim", "vim-illuminate", "null-ls.nvim", "schemastore.nvim", "typescript.nvim", "nvim-navic", "inlay-hints.nvim" }
  },
  ["nvim-navic"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\15nvim-navic\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-navic",
    url = "https://github.com/SmiteshP/nvim-navic"
  },
  ["nvim-neoclip.lua"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config.notify\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-pqf"] = {
    config = { "\27LJ\2\n1\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\bpqf\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-pqf",
    url = "https://gitlab.com/yorickpeterse/nvim-pqf"
  },
  ["nvim-spectre"] = {
    keys = { { "", "<leader>s" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-spectre",
    url = "https://github.com/nvim-pack/nvim-spectre"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeToggle", "NvimTreeClose" },
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config.nvimtree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua",
    wants = { "nvim-web-devicons" }
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects", "nvim-treesitter-textsubjects", "nvim-ts-context-commentstring", "nvim-ts-rainbow", "lualine.nvim" },
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-endwise"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-treesitter-endwise",
    url = "https://github.com/RRethy/nvim-treesitter-endwise",
    wants = { "nvim-treesitter" }
  },
  ["nvim-treesitter-pairs"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/nvim-treesitter-pairs",
    url = "https://github.com/theHamsta/nvim-treesitter-pairs"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-treesitter-textsubjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-treesitter-textsubjects",
    url = "https://github.com/RRethy/nvim-treesitter-textsubjects"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag",
    wants = { "nvim-treesitter" }
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    commands = { "Octo" },
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tocto\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim",
    wants = { "telescope.nvim", "plenary.nvim", "nvim-web-devicons" }
  },
  ["one-small-step-for-vimkind"] = {
    load_after = {
      ["nvim-dap"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/one-small-step-for-vimkind",
    url = "https://github.com/jbyuki/one-small-step-for-vimkind"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plantuml-syntax"] = {
    load_after = {
      ["markdown-preview.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/plantuml-syntax",
    url = "https://github.com/aklt/plantuml-syntax"
  },
  playground = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["project.nvim"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config.project\frequire\0" },
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/project.nvim",
    url = "https://github.com/ahmedkhalf/project.nvim"
  },
  ["quickmenu.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/quickmenu.vim",
    url = "https://github.com/skywind3000/quickmenu.vim"
  },
  ["redismru.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/redismru.vim",
    url = "https://github.com/neoclide/redismru.vim"
  },
  ["refactoring.nvim"] = {
    config = { "\27LJ\2\n@\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\23config.refactoring\frequire\0" },
    keys = { { "", "<leader>r" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/refactoring.nvim",
    url = "https://github.com/ThePrimeagen/refactoring.nvim",
    wants = { "telescope.nvim" }
  },
  ["renamer.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\frenamer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/renamer.nvim",
    url = "https://github.com/filipdutescu/renamer.nvim"
  },
  ["rust-tools.nvim"] = {
    after = { "rust.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["rust.vim"] = {
    load_after = {
      ["rust-tools.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/rust.vim",
    url = "https://github.com/rust-lang/rust.vim"
  },
  ["schemastore.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/schemastore.nvim",
    url = "https://github.com/b0o/schemastore.nvim"
  },
  ["session-lens"] = {
    load_after = {
      ["auto-session"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/session-lens",
    url = "https://github.com/rmagatti/session-lens"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["standard.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/standard.vim",
    url = "https://github.com/tjdevries/standard.vim"
  },
  ["switch.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/switch.vim",
    url = "https://github.com/AndrewRadev/switch.vim"
  },
  ["tabout.nvim"] = {
    config = { "\27LJ\2\n•\3\0\0\5\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\a\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\3=\3\n\0024\3\0\0=\3\v\2B\0\2\1K\0\1\0\fexclude\ftabouts\1\0\2\nclose\6}\topen\6{\1\0\2\nclose\6]\topen\6[\1\0\2\nclose\6)\topen\6(\1\0\2\nclose\6`\topen\6`\1\0\2\nclose\6\"\topen\6\"\1\0\2\nclose\6'\topen\6'\1\0\t\21enable_backwards\2\15completion\2\vtabkey\n<Tab>\21ignore_beginning\2\21backwards_tabkey\f<S-Tab>\15act_as_tab\2\21act_as_shift_tab\1\16default_tab\n<C-t>\22default_shift_tab\n<C-d>\nsetup\vtabout\frequire\0" },
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/tabout.nvim",
    url = "https://github.com/abecodes/tabout.nvim",
    wants = { "nvim-treesitter" }
  },
  ["targets.vim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telescope-cheat.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-cheat.nvim",
    url = "https://github.com/nvim-telescope/telescope-cheat.nvim"
  },
  ["telescope-dap.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-dap.nvim",
    url = "https://github.com/nvim-telescope/telescope-dap.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-frecency.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-fzf-writer.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-fzf-writer.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-writer.nvim"
  },
  ["telescope-github.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-hop.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-hop.nvim",
    url = "https://github.com/nvim-telescope/telescope-hop.nvim"
  },
  ["telescope-packer.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-repo.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope-rs.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-rs.nvim",
    url = "https://github.com/nvim-telescope/telescope-rs.nvim"
  },
  ["telescope-smart-history.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-smart-history.nvim",
    url = "https://github.com/nvim-telescope/telescope-smart-history.nvim"
  },
  ["telescope-symbols.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["template.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/template.vim",
    url = "https://github.com/lopesivan/template.vim"
  },
  ["toggleterm.nvim"] = {
    commands = { "ToggleTerm", "TermExec" },
    config = { "\27LJ\2\n?\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\22config.toggleterm\frequire\0" },
    keys = { { "", "<space>ot" } },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "TroubleToggle", "Trouble" },
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\25use_diagnostic_signs\2\nsetup\ftrouble\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim",
    wants = { "nvim-web-devicons" }
  },
  ["typecast.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/typecast.vim",
    url = "https://github.com/lopesivan/typecast.vim"
  },
  ["typescript.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/typescript.nvim",
    url = "https://github.com/jose-elias-alvarez/typescript.nvim"
  },
  ultisnips = {
    config = { "\27LJ\2\n²\3\0\0\2\0\15\0\0296\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0)\1\0\0=\1\n\0006\0\0\0009\0\1\0005\1\f\0=\1\v\0006\0\0\0009\0\1\0'\1\14\0=\1\r\0K\0\1\0\rvertical\23UltiSnipsEditSplit\1\2\0\0\14UltiSnips UltiSnipsSnippetDirectories&UltiSnipsRemoveSelectModeMappings\15<c-x><c-s>\26UltiSnipsListSnippets$<Plug>(ultisnips_jump_backward)!UltiSnipsJumpBackwardTrigger#<Plug>(ultisnips_jump_forward) UltiSnipsJumpForwardTrigger\29<Plug>(ultisnips_expand)\27UltiSnipsExpandTrigger\6g\bvim\0" },
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/ultisnips",
    url = "https://github.com/SirVer/ultisnips"
  },
  ["uppercase.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/uppercase.nvim",
    url = "https://github.com/lopesivan/uppercase.nvim"
  },
  ["venn.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/venn.nvim",
    url = "https://github.com/jbyuki/venn.nvim"
  },
  ["vgit.nvim"] = {
    commands = { "VGit" },
    config = { "\27LJ\2\n2\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\tvgit\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vgit.nvim",
    url = "https://github.com/tanvirtin/vgit.nvim"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-bundler"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-bundler",
    url = "https://github.com/tpope/vim-bundler"
  },
  ["vim-characterize"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-characterize",
    url = "https://github.com/tpope/vim-characterize"
  },
  ["vim-diagram"] = {
    load_after = {
      ["markdown-preview.nvim"] = true
    },
    loaded = false,
    needs_bufread = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-diagram",
    url = "https://github.com/zhaozg/vim-diagram"
  },
  ["vim-dict"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-dict",
    url = "https://github.com/lopesivan/vim-dict"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-dispatch",
    url = "https://github.com/tpope/vim-dispatch"
  },
  ["vim-dispatch-neovim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-dispatch-neovim",
    url = "https://github.com/radenling/vim-dispatch-neovim"
  },
  ["vim-doge"] = {
    commands = { "DogeGenerate", "DogeCreateDocStandard" },
    config = { "\27LJ\2\n9\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\16config.doge\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-doge",
    url = "https://github.com/kkoomen/vim-doge"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-easy-align",
    url = "https://github.com/Junegunn/vim-easy-align"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-endwise",
    url = "https://github.com/tpope/vim-endwise"
  },
  ["vim-eunuch"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-eunuch",
    url = "https://github.com/tpope/vim-eunuch"
  },
  ["vim-flog"] = {
    commands = { "Flog", "Flogsplit", "Floggit" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-flog",
    url = "https://github.com/rbong/vim-flog",
    wants = { "vim-fugitive" }
  },
  ["vim-fold"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-fold",
    url = "https://github.com/lopesivan/vim-fold"
  },
  ["vim-fugitive"] = {
    after = { "vim-merginal" },
    commands = { "Git", "GBrowse", "Gdiffsplit", "Gvdiffsplit" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-gist"] = {
    after = { "webapi-vim" },
    commands = { "Gist" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-gist",
    url = "https://github.com/mattn/vim-gist"
  },
  ["vim-git"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-git",
    url = "https://github.com/tpope/vim-git"
  },
  ["vim-github-link"] = {
    commands = { "GetCommitLink", "GetCurrentBranchLink", "GetCurrentCommitLink" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-github-link",
    url = "https://github.com/knsh14/vim-github-link"
  },
  ["vim-haml"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-haml",
    url = "https://github.com/tpope/vim-haml"
  },
  ["vim-illuminate"] = {
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-liquid"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-liquid",
    url = "https://github.com/tpope/vim-liquid"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-markdown",
    url = "https://github.com/tpope/vim-markdown"
  },
  ["vim-matchup"] = {
    after_files = { "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-matchup",
    url = "https://github.com/andymass/vim-matchup"
  },
  ["vim-merginal"] = {
    load_after = {
      ["vim-fugitive"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-merginal",
    url = "https://github.com/idanarye/vim-merginal"
  },
  ["vim-octave"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-octave",
    url = "https://github.com/jvirtanen/vim-octave"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
  },
  ["vim-pythonx"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-pythonx",
    url = "https://github.com/lopesivan/vim-pythonx"
  },
  ["vim-ragtag"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-ragtag",
    url = "https://github.com/tpope/vim-ragtag"
  },
  ["vim-rails"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-rake"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-rake",
    url = "https://github.com/tpope/vim-rake"
  },
  ["vim-rbenv"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-rbenv",
    url = "https://github.com/tpope/vim-rbenv"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-rest-console"] = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-rest-console",
    url = "https://github.com/diepm/vim-rest-console"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-rooter"] = {
    config = { "\27LJ\2\n:\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\t.git\20rooter_patterns\6g\bvim\0" },
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-scriptease"] = {
    commands = { "Messages", "Verbose", "Time" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-scriptease",
    url = "https://github.com/tpope/vim-scriptease"
  },
  ["vim-searchindex"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-searchindex",
    url = "https://github.com/google/vim-searchindex"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-silicon"] = {
    commands = { "Silicon" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-silicon",
    url = "https://github.com/segeljakt/vim-silicon"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-snippets/.",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-syntax-extra"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-syntax-extra",
    url = "https://github.com/justinmk/vim-syntax-extra"
  },
  ["vim-tbone"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-tbone",
    url = "https://github.com/tpope/vim-tbone"
  },
  ["vim-test"] = {
    load_after = {
      neotest = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-translator"] = {
    commands = { "Translate", "TranslateV", "TranslateW", "TranslateWV", "TranslateR", "TranslateRV", "TranslateX" },
    config = { "\27LJ\2\ne\0\0\2\0\5\0\t6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0+\1\2\0=\1\4\0K\0\1\0\30translator_history_enable\aen\27translator_target_lang\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-translator",
    url = "https://github.com/voldikss/vim-translator"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-visual-multi"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-visual-multi",
    url = "https://github.com/mg979/vim-visual-multi"
  },
  ["vim-vividchalk"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-vividchalk",
    url = "https://github.com/tpope/vim-vividchalk"
  },
  ["vim-wordmotion"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  },
  vimux = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vimux",
    url = "https://github.com/preservim/vimux"
  },
  ["webapi-vim"] = {
    load_after = {
      ["vim-gist"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/webapi-vim",
    url = "https://github.com/mattn/webapi-vim"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20config.whichkey\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wolfram-vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/wolfram-vim",
    url = "https://github.com/arnoudbuzing/wolfram-vim"
  },
  ["yabs.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/yabs.nvim",
    url = "https://github.com/pianocomposer321/yabs.nvim"
  },
  ["yaml.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/yaml.nvim",
    url = "https://github.com/cuducos/yaml.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Runtimepath customization
time([[Runtimepath customization]], true)
vim.o.runtimepath = vim.o.runtimepath .. ",/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-snippets/."
time([[Runtimepath customization]], false)
local module_lazy_loads = {
  ["^aerial"] = "aerial.nvim",
  ["^dap"] = "nvim-dap",
  ["^dap%-go"] = "nvim-dap-go",
  ["^gitlinker"] = "gitlinker.nvim",
  ["^harpoon"] = "harpoon",
  ["^harpoon%.cmd%-ui"] = "harpoon",
  ["^harpoon%.mark"] = "harpoon",
  ["^harpoon%.term"] = "harpoon",
  ["^harpoon%.ui"] = "harpoon",
  ["^legendary"] = "legendary.nvim",
  ["^neogen"] = "neogen",
  ["^neotest"] = "neotest",
  ["^neotest%.async"] = "neotest",
  ["^nvim%-autopairs"] = "nvim-autopairs",
  ["^nvim%-autopairs%.completion%.cmp"] = "nvim-autopairs",
  ["^nvim%-navic"] = "nvim-navic",
  ["^nvim%-web%-devicons"] = "nvim-web-devicons",
  ["^osv"] = "one-small-step-for-vimkind",
  ["^refactoring"] = "refactoring.nvim",
  ["^renamer"] = "renamer.nvim",
  ["^rust%-tools"] = "rust-tools.nvim",
  ["^spectre"] = "nvim-spectre",
  ["^telescope"] = "refactoring.nvim",
  ["^toggleterm"] = "toggleterm.nvim",
  ["^toggleterm%.terminal"] = "toggleterm.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: ultisnips
time([[Config for ultisnips]], true)
try_loadstring("\27LJ\2\n²\3\0\0\2\0\15\0\0296\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0'\1\a\0=\1\6\0006\0\0\0009\0\1\0'\1\t\0=\1\b\0006\0\0\0009\0\1\0)\1\0\0=\1\n\0006\0\0\0009\0\1\0005\1\f\0=\1\v\0006\0\0\0009\0\1\0'\1\14\0=\1\r\0K\0\1\0\rvertical\23UltiSnipsEditSplit\1\2\0\0\14UltiSnips UltiSnipsSnippetDirectories&UltiSnipsRemoveSelectModeMappings\15<c-x><c-s>\26UltiSnipsListSnippets$<Plug>(ultisnips_jump_backward)!UltiSnipsJumpBackwardTrigger#<Plug>(ultisnips_jump_forward) UltiSnipsJumpForwardTrigger\29<Plug>(ultisnips_expand)\27UltiSnipsExpandTrigger\6g\bvim\0", "config", "ultisnips")
time([[Config for ultisnips]], false)
-- Config for: vim-rooter
time([[Config for vim-rooter]], true)
try_loadstring("\27LJ\2\n:\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\t.git\20rooter_patterns\6g\bvim\0", "config", "vim-rooter")
time([[Config for vim-rooter]], false)
-- Config for: inc-rename.nvim
time([[Config for inc-rename.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15inc_rename\frequire\0", "config", "inc-rename.nvim")
time([[Config for inc-rename.nvim]], false)
-- Config for: git-worktree.nvim
time([[Config for git-worktree.nvim]], true)
try_loadstring("\27LJ\2\n>\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\17git-worktree\frequire\0", "config", "git-worktree.nvim")
time([[Config for git-worktree.nvim]], false)
-- Config for: edit_alternate.vim
time([[Config for edit_alternate.vim]], true)
try_loadstring("\27LJ\2\nr\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\27<cmd>EditAlternate<CR>\15<leader>ea\6n\20nvim_set_keymap\bapi\bvim\0", "config", "edit_alternate.vim")
time([[Config for edit_alternate.vim]], false)
-- Config for: project.nvim
time([[Config for project.nvim]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19config.project\frequire\0", "config", "project.nvim")
time([[Config for project.nvim]], false)
-- Config for: tabout.nvim
time([[Config for tabout.nvim]], true)
try_loadstring("\27LJ\2\n•\3\0\0\5\0\f\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\a\0005\4\4\0>\4\1\0035\4\5\0>\4\2\0035\4\6\0>\4\3\0035\4\a\0>\4\4\0035\4\b\0>\4\5\0035\4\t\0>\4\6\3=\3\n\0024\3\0\0=\3\v\2B\0\2\1K\0\1\0\fexclude\ftabouts\1\0\2\nclose\6}\topen\6{\1\0\2\nclose\6]\topen\6[\1\0\2\nclose\6)\topen\6(\1\0\2\nclose\6`\topen\6`\1\0\2\nclose\6\"\topen\6\"\1\0\2\nclose\6'\topen\6'\1\0\t\21enable_backwards\2\15completion\2\vtabkey\n<Tab>\21ignore_beginning\2\21backwards_tabkey\f<S-Tab>\15act_as_tab\2\21act_as_shift_tab\1\16default_tab\n<C-t>\22default_shift_tab\n<C-d>\nsetup\vtabout\frequire\0", "config", "tabout.nvim")
time([[Config for tabout.nvim]], false)
-- Config for: dotenv.nvim
time([[Config for dotenv.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vdotenv\frequire\0", "config", "dotenv.nvim")
time([[Config for dotenv.nvim]], false)
-- Config for: lsp_codelens_extensions.nvim
time([[Config for lsp_codelens_extensions.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\24codelens_extensions\frequire\0", "config", "lsp_codelens_extensions.nvim")
time([[Config for lsp_codelens_extensions.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateX lua require("packer.load")({'vim-translator'}, { cmd = "TranslateX", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DogeGenerate lua require("packer.load")({'vim-doge'}, { cmd = "DogeGenerate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file DogeCreateDocStandard lua require("packer.load")({'vim-doge'}, { cmd = "DogeCreateDocStandard", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogen lua require("packer.load")({'neogen'}, { cmd = "Neogen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AerialToggle lua require("packer.load")({'aerial.nvim'}, { cmd = "AerialToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Messages lua require("packer.load")({'vim-scriptease'}, { cmd = "Messages", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Verbose lua require("packer.load")({'vim-scriptease'}, { cmd = "Verbose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Time lua require("packer.load")({'vim-scriptease'}, { cmd = "Time", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file MarkdownPreview lua require("packer.load")({'markdown-preview.nvim'}, { cmd = "MarkdownPreview", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SaveSession lua require("packer.load")({'auto-session'}, { cmd = "SaveSession", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file RestoreSession lua require("packer.load")({'auto-session'}, { cmd = "RestoreSession", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gist lua require("packer.load")({'vim-gist'}, { cmd = "Gist", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Floggit lua require("packer.load")({'vim-flog'}, { cmd = "Floggit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Flogsplit lua require("packer.load")({'vim-flog'}, { cmd = "Flogsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Silicon lua require("packer.load")({'vim-silicon'}, { cmd = "Silicon", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lspsaga lua require("packer.load")({'lspsaga.nvim'}, { cmd = "Lspsaga", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GetCommitLink lua require("packer.load")({'vim-github-link'}, { cmd = "GetCommitLink", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GetCurrentBranchLink lua require("packer.load")({'vim-github-link'}, { cmd = "GetCurrentBranchLink", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GetCurrentCommitLink lua require("packer.load")({'vim-github-link'}, { cmd = "GetCurrentCommitLink", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Flog lua require("packer.load")({'vim-flog'}, { cmd = "Flog", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file VGit lua require("packer.load")({'vgit.nvim'}, { cmd = "VGit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitBlameToggle lua require("packer.load")({'git-blame.nvim'}, { cmd = "GitBlameToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TroubleToggle lua require("packer.load")({'trouble.nvim'}, { cmd = "TroubleToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gvdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gvdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file BDelete lua require("packer.load")({'close-buffers.nvim'}, { cmd = "BDelete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ToggleTerm lua require("packer.load")({'toggleterm.nvim'}, { cmd = "ToggleTerm", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TermExec lua require("packer.load")({'toggleterm.nvim'}, { cmd = "TermExec", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitConflictChooseTheirs lua require("packer.load")({'git-conflict.nvim'}, { cmd = "GitConflictChooseTheirs", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitConflictChooseOurs lua require("packer.load")({'git-conflict.nvim'}, { cmd = "GitConflictChooseOurs", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitConflictChooseBoth lua require("packer.load")({'git-conflict.nvim'}, { cmd = "GitConflictChooseBoth", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitConflictChooseNone lua require("packer.load")({'git-conflict.nvim'}, { cmd = "GitConflictChooseNone", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitConflictNextConflict lua require("packer.load")({'git-conflict.nvim'}, { cmd = "GitConflictNextConflict", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitConflictPrevConflict lua require("packer.load")({'git-conflict.nvim'}, { cmd = "GitConflictPrevConflict", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GitConflictListQf lua require("packer.load")({'git-conflict.nvim'}, { cmd = "GitConflictListQf", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestNearest lua require("packer.load")({'neotest'}, { cmd = "TestNearest", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Legendary lua require("packer.load")({'legendary.nvim'}, { cmd = "Legendary", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file GBrowse lua require("packer.load")({'vim-fugitive'}, { cmd = "GBrowse", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file BWipeout lua require("packer.load")({'close-buffers.nvim'}, { cmd = "BWipeout", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestFile lua require("packer.load")({'neotest'}, { cmd = "TestFile", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopChar1 lua require("packer.load")({'hop.nvim'}, { cmd = "HopChar1", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestLast lua require("packer.load")({'neotest'}, { cmd = "TestLast", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestVisit lua require("packer.load")({'neotest'}, { cmd = "TestVisit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeClose lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file JABSOpen lua require("packer.load")({'JABS.nvim'}, { cmd = "JABSOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Octo lua require("packer.load")({'octo.nvim'}, { cmd = "Octo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TestSuite lua require("packer.load")({'neotest'}, { cmd = "TestSuite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Translate lua require("packer.load")({'vim-translator'}, { cmd = "Translate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateV lua require("packer.load")({'vim-translator'}, { cmd = "TranslateV", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateW lua require("packer.load")({'vim-translator'}, { cmd = "TranslateW", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateWV lua require("packer.load")({'vim-translator'}, { cmd = "TranslateWV", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateR lua require("packer.load")({'vim-translator'}, { cmd = "TranslateR", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TranslateRV lua require("packer.load")({'vim-translator'}, { cmd = "TranslateRV", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <leader>d <cmd>lua require("packer.load")({'nvim-dap'}, { keys = "<lt>leader>d", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <C-p> <cmd>lua require("packer.load")({'legendary.nvim'}, { keys = "<lt>C-p>", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>r <cmd>lua require("packer.load")({'refactoring.nvim'}, { keys = "<lt>leader>r", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>j <cmd>lua require("packer.load")({'harpoon'}, { keys = "<lt>leader>j", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <space>ot <cmd>lua require("packer.load")({'toggleterm.nvim'}, { keys = "<lt>space>ot", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> <leader>s <cmd>lua require("packer.load")({'nvim-spectre'}, { keys = "<lt>leader>s", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim', 'mkdnflow.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType java ++once lua require("packer.load")({'nvim-jdtls'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'vim-rbenv', 'vim-rails', 'vim-bundler'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType rest ++once lua require("packer.load")({'vim-rest-console'}, { ft = "rest" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-treesitter-endwise', 'nvim-ts-autotag', 'nvim-cmp', 'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'vim-matchup', 'targets.vim'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'ReplaceWithRegister'}, { event = "BufEnter *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'which-key.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'marks.nvim', 'nvim-bufferline.lua', 'indent-blankline.nvim', 'nvim-treesitter-textobjects', 'vim-surround', 'FixCursorHold.nvim', 'gitsigns.nvim', 'dressing.nvim', 'nvim-treesitter', 'nvim-lspconfig', 'nvim-treesitter-textsubjects', 'nvim-ts-context-commentstring', 'nvim-ts-rainbow', 'lualine.nvim', 'nvim-pqf', 'nvim-notify', 'vim-searchindex'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead Cargo.toml ++once lua require("packer.load")({'crates.nvim'}, { event = "BufRead Cargo.toml" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
  -- Function lazy-loads
time([[Defining lazy-load function autocommands]], true)
vim.cmd[[au FuncUndefined <Plug>WordMotion_w ++once lua require("packer.load")({'vim-wordmotion'}, {}, _G.packer_plugins)]]
time([[Defining lazy-load function autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-rest-console/ftdetect/rest.vim]], true)
vim.cmd [[source /home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-rest-console/ftdetect/rest.vim]]
time([[Sourcing ftdetect script at: /home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-rest-console/ftdetect/rest.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
