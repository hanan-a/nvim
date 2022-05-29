return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Theme
    use "EdenEast/nightfox.nvim"
    --use 'Mofiqul/dracula.nvim'
    --use 'marko-cerovac/material.nvim'

    use 'airblade/vim-gitgutter'
    use 'tpope/vim-fugitive'
    use 'f-person/git-blame.nvim'
    use 'tpope/vim-surround'
    use 'mfussenegger/nvim-dap'
    use({
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" }, { "kdheepak/lazygit.nvim" } },
      config = function()
        require("telescope").load_extension("lazygit")
      end,
    })
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
    --completion
    use "hrsh7th/nvim-cmp" 
    use {'neoclide/coc.nvim', branch = 'release'}
    use {'tzachar/cmp-tabnine', after = "nvim-cmp", run='powershell ./install.ps1', requires = 'hrsh7th/nvim-cmp'}
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        'lewis6991/spellsitter.nvim',
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
      "SmiteshP/nvim-gps",
      requires = "nvim-treesitter/nvim-treesitter"
    }
end)
