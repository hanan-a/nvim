return   {
  'stevearc/oil.nvim',
  opts = {
    keymaps = {
      ["q"] = "actions.close",
    },
    -- configuration for the floating window in oil.open_float
    float = {
      -- padding around the floating window
      padding = 5,
      max_width = 0,
      max_height = 0,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
    },
    view_options = {
      show_hidden = true,
    }
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Oil",
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open Oil Explorer" },
    { "_", "<cmd>Oil --float<cr>", desc = "Open Oil Explorer" },
  },
}
