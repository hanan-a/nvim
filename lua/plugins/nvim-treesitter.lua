return   {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = {
        "json",
        "javascript",
        "jsdoc",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "svelte",
        "bash",
        "fish",
        "lua",
        "dockerfile",
        "gitignore",
        "rust",
        "lua",
        "python",
        "vue",
        "angular",
        "sql",
        "tmux",
        "http",
        "go",
        "gitignore",
        "dockerfile",
        "diff",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

