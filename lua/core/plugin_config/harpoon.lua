local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }


map('n', '<C-e>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
map('n', '<leader>m', ':lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<leader>mr', ':lua require("harpoon.mark").rm_file()<CR>', opts)
