local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Reload Config
map('n', '<leader>R', ':source $MYVIMRC<CR>', opts)

-- Don't yank with x
map('n', 'x', '"_x', opts)

-- Buffer navigation
map('n', '<leader>l', ':bn<CR>', opts)
map('n', '<leader>h', ':bp<CR>', opts)

-- Splits
map('n', '<leader>-', '<C-w>s', opts)
map('n', '<leader>\\', '<C-w>v', opts)

-- Terminal handling
map('n', '<leader>t', ':term<CR>', opts)

-- -- Pane Split navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-c>', '<C-w>c', opts)

-- Copy to clipboard
map('n', '<leader>y', '"+y', opts)
map('v', '<leader>y', '"+y', opts)
-- Paste to clipboard
map('n', '<leader>p', '"+p', opts)
map('v', '<leader>p', '"+p', opts)

-- Exit Terminal
map('t', '<ESC>', '<C-\\><C-n>', opts)

-- LazyGit
map('n', '<leader>lg', ':LazyGit<CR>', opts)


-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
map('n', '<C-t>', ':TroubleToggle<CR>', opts)

