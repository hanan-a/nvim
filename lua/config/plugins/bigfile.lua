return {
  "LunarVim/bigfile.nvim",
  enabled = true,
  event = "BufRead",
  opts = {
    filesize = 2,
    pattern = { "*" },
    features = {
      "indent_blankline",
      "lsp",
      "treesitter",
      "syntax",
      "matchparen",
      "vimopts",
      "filetype",
    }
  }
}
