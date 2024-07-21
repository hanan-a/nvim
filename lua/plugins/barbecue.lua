return {
  "utilyre/barbecue.nvim",
  lazy = true,
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  config = function()
    require("barbecue").setup({
      theme = "catppuccin"
    })
  end,
}

