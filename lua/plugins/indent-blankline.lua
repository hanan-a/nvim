return {
  "lukas-reineke/indent-blankline.nvim",
  enabled = true,
  lazy = true,
  event = "BufReadPre",
  main = "ibl",
  opts = {
    scope = {
      enabled = true,
      show_start = false,
    }
  },
}
