return {
  "NeogitOrg/neogit",
  lazy = true,
  cmd = { "Neogit" },
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
  },
  config = true,
  keys = {
    { "+", "<cmd>Neogit<CR>", desc = "Toggle Neogit" },
  },
}
