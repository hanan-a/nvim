return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  lazy = true,
  event = 'VimEnter',
  opts = {
    options = {
      -- theme = 'catppuccin',
      theme = GET_COLORSCHEME(),
      component_separators = " ",
      -- component_separators = { left = "", right = "" },
      -- section_separators = "",
      -- section_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
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
    },
    extensions = {
      --- Keep short to improve performance
      'oil',
      'trouble',
      'nvim-dap-ui',
      'lazy',
    }
  },
}
