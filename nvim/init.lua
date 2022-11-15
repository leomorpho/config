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

-- https://github.com/catppuccin/nvim
vim.cmd.colorscheme "catppuccin"

require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false,
    term_colors = false,
    dim_inactive = {
        enabled = true,
        shade = "dark",
        percentage = 0.15,
    },
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        treesitter = true,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

