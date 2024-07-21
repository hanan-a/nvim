return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
    options = {
      -- theme = 'tokyonight'
      theme = 'catppuccin',
      component_separators = " ",
      section_separators = { left = "", right = "" },
    },
    sections = { 
      -- DEFAULTS -------------------------------
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff', 'diagnostics'},
      lualine_c = {'filename'},
      lualine_x = {'encoding', 'fileformat', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
      -- DEFAULTS -------------------------------

      -- lualine_b = {'branch', 'diff', 'diagnostics'},
      -- lualine_c = {'lsp_progress'},
      -- lualine_x = {'tabnine', 'encoding', 'fileformat', 'filetype'},
      -- lualine_y = { 'progress' },
    }
  }
  end
}
