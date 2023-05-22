local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = {
  'wbthomason/packer.nvim',
  'folke/tokyonight.nvim',
  'nvim-lualine/lualine.nvim',
  "windwp/nvim-autopairs",
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'rcarriga/nvim-notify',
  'nvim-lua/plenary.nvim',
  'ThePrimeagen/harpoon',
  'm-demare/hlargs.nvim',
  {
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  },
  { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',

      -- Additional lua configuration, makes nvim stuff amazing
      'folke/neodev.nvim',
    },
  },
  { -- Trouble
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  -- Snippets
  "rafamadriz/friendly-snippets",
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    tag = "v1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    run = "make install_jsregexp",
    dependencies = {
      "rafamadriz/friendly-snippets"
    },
  },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip'
    },
  },
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} }
  },
  {
    'tzachar/cmp-tabnine',
    run='./install.sh',
    dependencies = 'hrsh7th/nvim-cmp'
  },
  -- DAP Related
  'mfussenegger/nvim-dap',
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap"}
  },
  { "mxsdev/nvim-dap-vscode-js", dependencies = {"mfussenegger/nvim-dap"} },
  {
    "microsoft/vscode-js-debug",
    opt = true,
    run = "npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out"
  },
  'theHamsta/nvim-dap-virtual-text',
  -- TMUX related
  'aserowy/tmux.nvim',

  -- Git related plugins
  'kdheepak/lazygit.nvim',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb', -- Enables :GBrowse to go to GitHub links
  'lewis6991/gitsigns.nvim',
  'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  -- Startup screen
  -- use {
  --   "startup-nvim/startup.nvim",
  --   dependencies = {"nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim"}
  -- }
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
  },

  {
    "utilyre/barbecue.nvim",
    tag = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    after = "nvim-web-devicons", -- keep this if you're using NvChad
    config = function()
      require("barbecue").init()
    end,
  },
  {
    "folke/which-key.nvim",
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").init {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  },
  {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  },
  {
    "folke/noice.nvim",
    config = function()
      require("noice").init({
        -- add any options here
      })
    end,
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
}

require("lazy").setup(plugins, opts);
