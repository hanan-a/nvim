local neogit = require('neogit')
neogit.setup {}

vim.keymap.set("n", "+", neogit.open, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>gb", ':Telescope git_branches<CR>', { noremap = true, silent = true })
