return {
  "rachartier/tiny-inline-diagnostic.nvim",
  enabled = false,
  event = "VeryLazy",
  config = function()
    require('tiny-inline-diagnostic').setup()
    vim.diagnostic.config({
      virtual_text = false,
    })
  end,
}
