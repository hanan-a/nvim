local print_packer_install = function()
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
end

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end


local packer_bootstrap = ensure_packer() -- TODO: Check documentation to see why not working

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim'
  use 'nvim-lualine/lualine.nvim'
  use "windwp/nvim-autopairs"
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use 'rcarriga/nvim-notify'
  use 'nvim-lua/plenary.nvim'
  use 'ThePrimeagen/harpoon'

  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  })

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  }

  use { -- Trouble
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use({
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v<CurrentMajor>.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp"
  })

  use { -- TODO: Sort the nvim-tree installation
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'tzachar/cmp-tabnine',
    run='./install.sh',
    requires = 'hrsh7th/nvim-cmp'
  }


  -- DAP Related

  use 'mfussenegger/nvim-dap'
  use {
    "rcarriga/nvim-dap-ui",
    requires = {"mfussenegger/nvim-dap"}
  }

  use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }

  use {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out" 
  }

  use 'theHamsta/nvim-dap-virtual-text'

  -- TMUX related
  use 'aserowy/tmux.nvim'

  -- Git related plugins
  use 'kdheepak/lazygit.nvim'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb' -- Enables :GBrowse to go to GitHub links
  use 'lewis6991/gitsigns.nvim'


  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines

  -- Startup screen
  -- use {
  --   "startup-nvim/startup.nvim",
  --   requires = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
  -- }
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
      require("barbecue").setup()
    end,
  })

  use {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
    print_packer_install()
  end
end)
