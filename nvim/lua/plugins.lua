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
        
        -- vscode-like pictograms for neovim lsp completion items
        use { "onsails/lspkind-nvim", event = "VimEnter" }
        -- auto-completion engine
        use { "hrsh7th/nvim-cmp", after = "lspkind-nvim", config = [[require('config.nvim-cmp')]] }

        -- nvim-cmp completion sources
        use { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" }
        use { "hrsh7th/cmp-path", after = "nvim-cmp" }
        use { "hrsh7th/cmp-buffer", after = "nvim-cmp" }
        use { "hrsh7th/cmp-omni", after = "nvim-cmp" }
        use { "quangnguyen30192/cmp-nvim-ultisnips", after = { "nvim-cmp", "ultisnips" } }
        if vim.g.is_mac then
          use { "hrsh7th/cmp-emoji", after = "nvim-cmp" }
        end

        -- Snippet engine and snippet template
        use { "SirVer/ultisnips", event = "InsertEnter" }
        use { "honza/vim-snippets", after = "ultisnips" }

        -- nvim-lsp configuration (it relies on cmp-nvim-lsp, so it should be loaded after cmp-nvim-lsp).
        use { "neovim/nvim-lspconfig", after = "cmp-nvim-lsp", config = [[require('config.lsp')]] }

        -- Portable package manager for Neovim that runs everywhere Neovim runs.
        -- Easily install and manage LSP servers, DAP servers, linters, and formatters.
        use {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        }
    
        -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
        use({
            "jose-elias-alvarez/null-ls.nvim",
            config = function()
                require("null-ls").setup()
            end,
            requires = { "nvim-lua/plenary.nvim" },
        })
        
        -- lugin that creates missing LSP diagnostics highlight groups for color 
        -- schemes that don't yet support the Neovim 0.5 builtin LSP client.
        use 'folke/lsp-colors.nvim'

        use 'nvim-treesitter/nvim-treesitter'

        -- Python indent (follows the PEP8 style): A nicer Python indentation style for vim.
        use { "Vimjas/vim-python-pep8-indent", ft = { "python" } }

        -- Python-related text object
        use { "jeetsukumaran/vim-pythonsense", ft = { "python" } }

        use { "machakann/vim-swap", event = "VimEnter" }

        use {
            'nvim-telescope/telescope.nvim', tag = '0.1.0',
          -- or                            , branch = '0.1.x',
            requires = { {'nvim-lua/plenary.nvim'} }
          }
        use { "nvim-telescope/telescope-file-browser.nvim" , config = [[require('config.telescope')]] }
        -- search emoji and other symbols
        use { "nvim-telescope/telescope-symbols.nvim", after = "telescope.nvim" }

          -- colorbuddy allows us to run the gloombuddy theme
        use 'tjdevries/colorbuddy.nvim'
        use 'bkegley/gloombuddy'

        use { 'psf/black', branch = 'stable' }
        use 'brentyi/isort.vim'
        
        use 'kyazdani42/nvim-web-devicons'

        -- Add maktaba and codefmt to the runtimepath.
        -- (The latter must be installed before it can be used.)
        use 'google/vim-maktaba'
        use 'google/vim-codefmt'

        -- Also add Glaive, which is used to configure codefmt's maktaba flags. See
        -- `:help :Glaive` for usage.
        use 'google/vim-glaive'

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
        use "folke/which-key.nvim"

        -- Embed Neovim in Chrome, Firefox, Thunderbird & others.
        use {
            'glacambre/firenvim',
            run = function() vim.fn['firenvim#install'](0) end 
        }

        -- Markdown support
        use 'godlygeek/tabular'
        use 'preservim/vim-markdown'
        use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

        -- A fancy, configurable, notification manager for NeoVim
        use 'rcarriga/nvim-notify'

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

        -- Modernity meets insane extensibility. The future of organizing your life in Neovim.
        use {
            "nvim-neorg/neorg",
            -- config = function()
            --     require('neorg').setup {
            --         ... -- check out setup part...
            --     }
            -- end,
            requires = "nvim-lua/plenary.nvim"
        }

        -- A (Neo)vim plugin for formatting code.
        use { "sbdchd/neoformat", cmd = { "Neoformat" } }

        -- Better git log display
        use { "rbong/vim-flog", requires = "tpope/vim-fugitive", cmd = { "Flog" } }

        -- Show git change (change, delete, add) signs in vim sign column
        use "lewis6991/gitsigns.nvim"

        -- Better git commit experience
        use { "rhysd/committia.vim", opt = true, setup = [[vim.cmd('packadd committia.vim')]] }

        -- Markdown JSON header highlight plugin
        use { "elzr/vim-json", ft = { "json", "markdown" } }
        
        -- A pretty diagnostics, references, telescope results, quickfix and location 
        -- list to help you solve all the trouble your code is causing.
        use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }

        use {
            "cuducos/yaml.nvim",
            ft = {"yaml"}, -- optional
            requires = {
              "nvim-treesitter/nvim-treesitter",
              "nvim-telescope/telescope.nvim" -- optional
            },
          }

    end
}
