return {
  "eldritch-theme/eldritch.nvim",
  enabled = false,
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    vim.cmd[[colorscheme eldritch]]
  end,
}
