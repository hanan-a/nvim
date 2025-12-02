return {
  "folke/tokyonight.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
  opts = {
    transparent = false,
  },
  config = function (_, opts)
    require("tokyonight").setup(opts)
    vim.cmd [[ colorscheme tokyonight-night ]]
  end
}
