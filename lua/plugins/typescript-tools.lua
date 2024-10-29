return {
  "pmizio/typescript-tools.nvim",
  lazy = true,
  event = "BufRead",
  enabled = false,
  ft = { "typescript", "typescriptreact" },
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
}
