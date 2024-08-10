return   {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "svelte",
        "bash",
        "lua",
        "dockerfile",
        "gitignore",
        "rust",
        "lua",
        "python",
        "svelte",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

