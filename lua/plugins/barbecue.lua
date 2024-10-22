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
  config = function()
    require("barbecue").setup({
      theme = "catppuccin",
      exclude_filetypes = {
        "gitcommit",
        "neogit",
        "oil",
        "toggleterm",
        "neo-tree",
      },
    })
  end
}

