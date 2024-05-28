local opts = { noremap = true, silent = true }

require("telescope").load_extension('harpoon')

require("harpoon").setup({
  mark_branch = true,
})

local ui = require("harpoon.ui")
local mark = require("harpoon.mark")

-- map('n', '<C-m>', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
vim.keymap.set('n', '<leader>e', ui.toggle_quick_menu, opts)
vim.keymap.set('n', '<leader>m', mark.add_file, opts)
vim.keymap.set('n', '<leader>mr', mark.rm_file, opts)
vim.keymap.set('n', '<C-c>', ui.nav_next, opts)
vim.keymap.set('n', '<C-x>', ui.nav_prev, opts)

vim.keymap.set('n', '<C-e>', ':Telescope harpoon marks initial_mode=normal<CR>', opts)
-- vim.keymap.set('n', '<leader>e', ':Telescope harpoon marks initial_mode=normal previewer=false<CR>', opts)
