return {
  "pmizio/typescript-tools.nvim",
  lazy = true,
  event = "BufRead",
  ft = { "typescript", "typescriptreact" },
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
}
