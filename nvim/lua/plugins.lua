local utils = require("utils")
local fn = vim.fn

-- The root dir to install all plugins. Plugins are under opt/ or start/ sub-directory.
vim.g.plugin_home = fn.stdpath("data") .. "/site/pack/packer"

-- Where to install packer.nvim -- the package manager (we make it opt)
local packer_dir = vim.g.plugin_home .. "/opt/packer.nvim"

-- Whether this is a fresh install, i.e., packer itself and plugins have not been installed.
local fresh_install = false

-- Auto-install packer in case it hasn't been installed.
if fn.glob(packer_dir) == "" then
  fresh_install = true

  -- Now we need to install packer.nvim first.
  local packer_repo = "https://github.com/wbthomason/packer.nvim"
  local install_cmd = string.format("!git clone --depth=1 %s %s", packer_repo, packer_dir)

  vim.api.nvim_echo({ { "Installing packer.nvim", "Type" } }, true, {})
  vim.cmd(install_cmd)
end

-- Load packer.nvim
vim.cmd("packadd packer.nvim")

local packer = require("packer")
local packer_util = require("packer.util")

packer.startup {
    function(use)
        -- it is recommended to put impatient.nvim before any other plugins
        use { "lewis6991/impatient.nvim", config = [[require('impatient')]] }

        use { "wbthomason/packer.nvim", opt = true }
        use { 'neoclide/coc.nvim', branch = 'release'
          -- config = [[require('config.coc-nvim')]]
        }

        -- FZF: fuzzy finder
        use { 'junegunn/fzf', run = './install --bin', }
        use { 'ibhagwan/fzf-lua',
            -- optional for icon support
            requires = { 'kyazdani42/nvim-web-devicons' }
          }
        -- use 'nvim-treesitter/nvim-treesitter'

        -- Python indent (follows the PEP8 style): A nicer Python indentation style for vim.
        use { "Vimjas/vim-python-pep8-indent", ft = { "python" } }

        -- Python-related text object
        use { "jeetsukumaran/vim-pythonsense", ft = { "python" } }

        use { "machakann/vim-swap", event = "VimEnter" }

          -- colorbuddy allows us to run the gloombuddy theme
        use 'tjdevries/colorbuddy.nvim'
        use 'bkegley/gloombuddy'
        use 'tjdevries/gruvbuddy.nvim'
        use 'lalitmee/cobalt2.nvim'
        use 'bbenzikry/snazzybuddy.nvim'

        -- use { 'psf/black', branch = 'stable' }
        -- use 'brentyi/isort.vim'
        use 'kyazdani42/nvim-web-devicons'

        use {
            "nvim-lualine/lualine.nvim",
            event = "VimEnter",
            config = [[require('config.statusline')]],
        }

        use {
            "kyazdani42/nvim-tree.lua",
            requires = { "kyazdani42/nvim-web-devicons" },
            config = [[require('config.nvim-tree')]],
        }

        use "tpope/vim-obsession"

        use "tweekmonster/django-plus.vim"

        -- Displays a popup with possible keybindings of the command you started typing.
        -- Lua
        use {
          "folke/which-key.nvim",
          config = function()
            require("which-key").setup {
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
            }
          end
        }

        -- Smooth scrolling neovim plugin written in lua
        use {
          "karb94/neoscroll.nvim",
          event = "VimEnter",
          config = function()
            vim.defer_fn(function()
              require("config.neoscroll")
            end, 2000)
          end,
        }

        -- Only install these plugins if ctags are installed on the system
        if utils.executable("ctags") then
          -- show file tags in vim window
          use { "liuchengxu/vista.vim", cmd = "Vista" }
        end

        -- Better git log display
        use { "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } }
        -- GitHub extension for fugitive.vim
        use "tpope/vim-rhubarb"

        -- Show git change (change, delete, add) signs in vim sign column
        use "lewis6991/gitsigns.nvim"

        -- Better git commit experience
        use { "rhysd/committia.vim", opt = true, setup = [[vim.cmd('packadd committia.vim')]] }

        -- Async isort plugin for Vim + Neovim
        use 'brentyi/isort.vim'

        -- Find the enemy and replace them with dark power.
        use 'nvim-lua/plenary.nvim' 
        use 'windwp/nvim-spectre'

        -- markdown preview plugin for (neo)vim
        use {
            'iamcco/markdown-preview.nvim',
            run = function() vim.fn['mkdp#util#install']() end,
            ft = {'markdown'},
        }
        use 'git-time-metric/gtm-vim-plugin'
        use 'fladson/vim-kitty'
    end
}


