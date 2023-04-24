local builtin = require('telescope.builtin')

local map = vim.keymap
map.set('n', '<leader>ff', builtin.find_files, {})
map.set('n', '<C-e>', ':Telescope buffers initial_mode=normal<CR>', {})
map.set('n', '<leader>fg', builtin.live_grep, {})
map.set('n', '<leader>fh', builtin.help_tags, {})
map.set('n', '<leader>fo', builtin.oldfiles, {})
map.set('n', '<C-p>', builtin.git_files, {})
