vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require('nvim-tree').init({
  view = {
    preserve_window_proportions = true,
    float = {
      enable = false,
      open_win_config = {
        border = "rounded",
        width = 30,
        height = 50,
      }
    },
  },
  diagnostics = {
    enable = true
  }
})

vim.keymap.set('n', '<C-n>', ':NvimTreeFindFileToggle<CR>')
