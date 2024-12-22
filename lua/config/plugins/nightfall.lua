return {
  "2giosangmitom/nightfall.nvim",
  lazy = false,
  enabled = false,
  priority = 1000,
  opts = {
    integrations = {
      lazy = { enabled = true },
      telescope = { enabled = true, style = "borderless" },
      treesitter = { enabled = true, context = true },
      lspconfig = { enabled = true },
    }
  },
  init = function ()
    vim.cmd.colorscheme("nightfall")
  end
}
