return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      transparent_background = false, -- disables setting the background color.
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = true,
        diffview = true,
        harpoon = true,
        neogit = true,
        noice = true,
        mason = true,

        dap = true, -- Addtional conifg needed in nvim-dap
        dap_ui = true,
        lsp_trouble = true,
        nvim_surround = true,
        which_key = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        alpha = false,
        barbecue = {
          dim_dirname = true, -- directory name is dimmed by default
          bold_basename = true,
          dim_context = true,
          alt_background = true,
        },
        telescope = {
          enabled = true,
          style = "nvchad",
        },
        indent_blankline = {
          enabled = true,
          scope_color = "", -- catppuccin color (eg. `lavender`) Default: text
          colored_indent_levels = false,
        },
        --         -- for more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })

    vim.cmd([[colorscheme catppuccin]])
  end,
}

