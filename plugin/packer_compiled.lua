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
  ["adwaita.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme adwaita\bcmd\bvim\0" },
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/adwaita.nvim",
    url = "https://github.com/Mofiqul/adwaita.nvim"
  },
  ["contextmenu.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/contextmenu.nvim",
    url = "https://github.com/lopesivan/contextmenu.nvim"
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
  ["kanagawa.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/kanagawa.nvim",
    url = "https://github.com/rebelot/kanagawa.nvim"
  },
  ["lush.nvim"] = {
    commands = { "LushRunQuickstart", "LushRunTutorial", "Lushify", "LushImport" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["maps.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/maps.vim",
    url = "https://github.com/lopesivan/maps.vim"
  },
  ["neotemplate.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/neotemplate.nvim",
    url = "https://github.com/lopesivan/neotemplate.nvim"
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
  ["nvim-cheetah"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/nvim-cheetah",
    url = "https://github.com/lopesivan/nvim-cheetah"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerToggle" },
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-jptemplate"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/nvim-jptemplate",
    url = "https://github.com/lopesivan/nvim-jptemplate"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18config.notify\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/nvim-treesitter",
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
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\venable\2\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag",
    wants = { "nvim-treesitter" }
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
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
  ["template.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/template.vim",
    url = "https://github.com/lopesivan/template.vim"
  },
  ["typecast.vim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/typecast.vim",
    url = "https://github.com/lopesivan/typecast.vim"
  },
  ["uppercase.nvim"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/uppercase.nvim",
    url = "https://github.com/lopesivan/uppercase.nvim"
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
  ["vim-fold"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-fold",
    url = "https://github.com/lopesivan/vim-fold"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-git"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-git",
    url = "https://github.com/tpope/vim-git"
  },
  ["vim-haml"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-haml",
    url = "https://github.com/tpope/vim-haml"
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
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-projectionist",
    url = "https://github.com/tpope/vim-projectionist"
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
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-scriptease"] = {
    commands = { "Messages", "Verbose", "Time" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/opt/vim-scriptease",
    url = "https://github.com/tpope/vim-scriptease"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-sensible",
    url = "https://github.com/tpope/vim-sensible"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-tbone"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-tbone",
    url = "https://github.com/tpope/vim-tbone"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-unimpaired",
    url = "https://github.com/tpope/vim-unimpaired"
  },
  ["vim-vividchalk"] = {
    loaded = true,
    path = "/home/ivan/.config/nvim-beginner/share/nvim/site/pack/packer/start/vim-vividchalk",
    url = "https://github.com/tpope/vim-vividchalk"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^nvim%-autopairs"] = "nvim-autopairs",
  ["^nvim%-autopairs%.completion%.cmp"] = "nvim-autopairs"
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

-- Config for: adwaita.nvim
time([[Config for adwaita.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme adwaita\bcmd\bvim\0", "config", "adwaita.nvim")
time([[Config for adwaita.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Lushify lua require("packer.load")({'lush.nvim'}, { cmd = "Lushify", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LushImport lua require("packer.load")({'lush.nvim'}, { cmd = "LushImport", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Messages lua require("packer.load")({'vim-scriptease'}, { cmd = "Messages", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerToggle lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Verbose lua require("packer.load")({'vim-scriptease'}, { cmd = "Verbose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Time lua require("packer.load")({'vim-scriptease'}, { cmd = "Time", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LushRunQuickstart lua require("packer.load")({'lush.nvim'}, { cmd = "LushRunQuickstart", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LushRunTutorial lua require("packer.load")({'lush.nvim'}, { cmd = "LushRunTutorial", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'vim-rbenv', 'vim-bundler', 'vim-rails'}, { ft = "ruby" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-treesitter-endwise', 'nvim-ts-autotag', 'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-notify'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
