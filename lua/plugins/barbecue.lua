return {
  "utilyre/barbecue.nvim",
  enabled = true,
  version = "*",
  lazy = "VeryLazy",
  event = "BufRead",
  command = {
    "Barbecue"
  },
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- Optional dependency
  },
  opts = {
      -- theme = "catppuccin",
      theme = GET_COLORSCHEME(),
      exclude_filetypes = {
        "gitcommit",
        "neogit",
        "oil",
        "toggleterm",
        "neo-tree",
      },
  },
}

