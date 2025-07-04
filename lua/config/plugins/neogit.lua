return {
  "NeogitOrg/neogit",
  lazy = true,
  cmd = { "Neogit" },
  dependencies = {
    "nvim-lua/plenary.nvim",  -- required
    "sindrets/diffview.nvim", -- optional - Diff integration

    -- Only one of these is needed, not both.
    "nvim-telescope/telescope.nvim", -- optional
    "folke/snacks.nvim",             --optional - Snacks integration
  },
  config = function()
    require("neogit").setup({
      disable_signs = false,
      -- disable_context_highlighting = true,
      -- disable_commit_confirmation = true,
      --  -- Show message with spinning animation when a git command is running.
      process_spinner = false,
      -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
      -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
      auto_refresh = true,
      integrations = {
        -- If enabled, use telescope for menu selection rather than vim.ui.select.
        -- Allows multi-select and some things that vim.ui.select doesn't.
        telescope = nil,
        -- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
        -- The diffview integration enables the diff popup.
        --
        -- Requires you to have `sindrets/diffview.nvim` installed.
        diffview = true,

        -- If enabled, uses fzf-lua for menu selection. If the telescope integration
        -- is also selected then telescope is used instead
        -- Requires you to have `ibhagwan/fzf-lua` installed.
        fzf_lua = nil,

        -- If enabled, uses mini.pick for menu selection. If the telescope integration
        -- is also selected then telescope is used instead
        -- Requires you to have `echasnovski/mini.pick` installed.
        mini_pick = nil,

        -- If enabled, uses snacks.picker for menu selection. If the telescope integration
        -- is also selected then telescope is used instead
        -- Requires you to have `folke/snacks.nvim` installed.
        snacks = true,
      },
    })
  end,
  keys = {
    { "+",          "<cmd>Neogit<CR>",     desc = "Toggle Neogit" },
    { "<leader>gl", "<cmd>Neogit log<CR>", desc = "Toggle Neogit log" },
  },
}
