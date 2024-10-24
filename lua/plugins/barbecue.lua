return {
  "utilyre/barbecue.nvim",
  enabled = true,
  version = "*",
  event = { "VeryLazy" },
  command = {
    "Barbecue"
  },
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- Optional dependency
  },
  opts = {
      theme = "catppuccin",
      exclude_filetypes = {
        "gitcommit",
        "neogit",
        "oil",
        "toggleterm",
        "neo-tree",
      },
  },
}

