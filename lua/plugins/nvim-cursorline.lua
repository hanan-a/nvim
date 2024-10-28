return {
  "yamatsum/nvim-cursorline",
  lazy = true,
  event = "BufRead",
  opts = {
    cursorline = {
      enable = true,
      timeout = 0,
      number = false,
    },
    cursorword = {
      enable = true,
      min_length = 3,
      hl = { underline = true },
    }
  },
}
