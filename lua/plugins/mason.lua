return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
  }
}
