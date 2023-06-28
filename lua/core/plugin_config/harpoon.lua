local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require("telescope").load_extension('harpoon')

map('n', '<C-m>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
-- map('n', '<C-e>', ':Telescope harpoon marks initial_mode=normal previewer=false<CR>', opts)
map('n', '<leader>m', ':lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<leader>mr', ':lua require("harpoon.mark").rm_file()<CR>', opts)
map('n', '<C-c>', ':lua require("harpoon.ui").nav_next()<CR>', opts)
map('n', '<C-x>', ':lua require("harpoon.ui").nav_prev()<CR>', opts)
