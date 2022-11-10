-- Based on https://github.com/jdhao/nvim-config
-- Current font I use in my terminal: VictorMono Nerd Font

local api = vim.api
local utils = require("utils")

-- Check if we have the latest version of nvim
local expected_ver = "0.8.0"
local nvim_ver = utils.get_nvim_version()

-- if nvim_ver ~= expected_ver then
-- 	local msg = string.format("Unsupported nvim version: expected %s, but got %s", expected_ver, nvim_ver)
-- 	api.nvim_err_writeln(msg)
-- 	return
-- end

local core_conf_files = {
	"globals.lua", -- global settings
 	"options.vim", -- setting options in nvim
 	"autocommands.vim",
 	"mappings.lua",  -- all user-defined mappings
 	"mappings.vim",  -- all user-defined mappings
 	"plugins.vim", -- plugins and their configs
    "coc-nvim.vim",
    "markdown-preview.vim",
-- 	"colorschemes.lua", 
}

for _, name in ipairs(core_conf_files) do
	local path = string.format("%s/core/%s", vim.fn.stdpath("config"), name)
	local source_cmd = "source " .. path
	vim.cmd(source_cmd)
end

require'colorbuddy'.colorscheme('snazzybuddy')

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}

vim.cmd 'set nornu'

