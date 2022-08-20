R('telescope')
R('plenary')

local async_static_finder = require('telescope.finders.async_static_finder')
local pickers             = require('telescope.pickers')
local conf                = require('telescope.config').values

local f = async_static_finder {
	".ccls",
	".ccls-root",
	".exrc",
	".gitignore",
	".local.vimrc",
	".luaenv-vars",
	".nvimrc",
	".nvimrc.lua",
	".projectile",
	"gradle.projections.json",
	".projections.json",
	".pyenv-vars",
	".stylua.toml",
	".tasks",
	"CMakeLists.txt",
	"Makefile",
	"README.md",
	"build.haml",
	"local.properties",
	"package.json",
	"pom.xml",
	"pubspec.yaml",
	"settings.gradle",
	"stylua.toml",
	"tsconfig.json",
	"custom_rules.xml",
	"build.xml",
	"build.sh",
	"cansi.projections.json",
	"cpp.projections.json",
}

pickers.new({}, {
	prompt_title = 'Async Finder',
	finder = f,
	previewer = false,
	sorter = conf.file_sorter({}),
}):find()
