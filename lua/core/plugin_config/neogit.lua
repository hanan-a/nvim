local neogit = require('neogit')
neogit.setup {}

vim.keymap.set("n", "~", ":Neogit<CR>", { desc = "Open parent directory" })
