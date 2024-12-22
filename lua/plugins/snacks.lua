return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    dashboard = { enabled = false, example = "github" },
  },
  keys = {
    { "<leader>gg", function () Snacks.lazygit() end, "Snacks: Open lazygit" },
    { "<leader>lg", function () Snacks.lazygit.log() end, "Snacks: Open lazygit" },
    { "<M-/>",      function() Snacks.terminal() end, desc = "Toggle Terminal" },
  }
}