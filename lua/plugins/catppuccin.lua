return {
  "catppuccin/nvim", 
  lazy = false,
  name = "catppuccin", 
  priority = 1000,
  opt = {
    transparent_background = true, -- disables setting the background color.
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
      alpha = true,
      barbecue = {
        dim_dirname = true, -- directory name is dimmed by default
        bold_basename = true,
        dim_context = false,
        alt_background = false,
      },
      telescope = {
        enabled = true,
        style = "nvchad",
      },
      --         -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  },
  config = function()
    vim.cmd([[colorscheme catppuccin]])
  end
}

