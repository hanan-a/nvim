return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Theme
    use "EdenEast/nightfox.nvim"
    --use 'Mofiqul/dracula.nvim'
    --use 'marko-cerovac/material.nvim'

    --use 'airblade/vim-gitgutter'
    use {
      'lewis6991/gitsigns.nvim',
    }
    use 'tpope/vim-fugitive'
    use 'tpope/vim-surround'
    use 'mfussenegger/nvim-dap'
    use 'editorconfig/editorconfig-vim'
    use 'booperlv/nvim-gomove'
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" }, { "BurntSushi/ripgrep" } },
      config = function()
        require("telescope").load_extension("lazygit")
      end,
    })
    use { 'nvim-telescope/telescope-project.nvim' }
    use 'jose-elias-alvarez/null-ls.nvim'
    use {
      'VonHeikemen/lsp-zero.nvim',
      requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/nvim-lsp-installer'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets
          {'L3MON4D3/LuaSnip'},
          {'rafamadriz/friendly-snippets'},
      }
    }
    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'
   --completion
    use "hrsh7th/nvim-cmp" 
--    use {'neoclide/coc.nvim', branch = 'release'}
    --Tabnine windows
    --use {'tzachar/cmp-tabnine', after = "nvim-cmp", run='powershell ./install.ps1', requires = 'hrsh7th/nvim-cmp'}
    --Tabnine Linux
    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        'lewis6991/spellsitter.nvim',
    }
    use {
      "windwp/nvim-autopairs",
      config = function() require("nvim-autopairs").setup {} end
    }
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icon
        },
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use {
      'goolord/alpha-nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
      config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
      end
    }
    use {
      'phaazon/hop.nvim',
      branch = 'v1', -- optional but strongly recommended
      config = function()
        -- you can configure Hop the way you like here; see :h hop-config
        require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      end
    }
    use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
      }
    }
    use
    {
      "lmburns/lf.nvim",
      config = function()
        -- This feature will not work if the plugin is lazy-loaded
        vim.g.lf_netrw = 1

        require("lf").setup(
        {
          escape_quit = false,
          border = "rounded",
          --highlights = {FloatBorder = {guifg = require("kimbox.palette").colors.magenta}}
        }
        )
      end,
      requires = {
        "plenary.nvim", 
        "toggleterm.nvim"
      }
    }
    use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
    end}
    use {
      'filipdutescu/renamer.nvim',
      branch = 'master',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- Tabline
    use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}
    use ({ 'projekt0n/github-nvim-theme' })
    use 'folke/lsp-colors.nvim'
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {     
      }         -- your configuration comes here
  end
}
end)
