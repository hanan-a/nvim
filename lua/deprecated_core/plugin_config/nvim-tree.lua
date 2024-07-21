vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').setup({
  view = {
    preserve_window_proportions = true,
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        border = "rounded",
        width = 40,
        height = 50,
        row = 1,
        col = 1,
      }
    },
  },
  diagnostics = {
    enable = true
  },
  filters = {
    dotfiles = false,
    git_ignored = false,
  }
})

vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')
