local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Reload Config
map('n', '<leader>R', ':source $MYVIMRC<CR>', opts)

-- Don't yank with x
map('n', 'x', '"_x', opts)

-- Splits
map('n', '<leader>-', '<C-w>s', opts)
map('n', '<leader>_', '<C-w>v', opts)
map('n', '<leader>cp', '<C-w>c', opts)
map('n', '<leader>co', '<C-w>o', opts)

-- Pane Split navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)

-- Copy to clipboard
map('n', '<leader>y', '"+y', opts)
map('v', '<leader>y', '"+y', opts)
-- Paste to clipboard
map('n', '<leader>p', '"+p', opts)
map('v', '<leader>p', '"+p', opts)

-- LSP Commands
map('n', '<leader>rlsp', ':LspRestart<CR>', opts)

-- Select all
map('n', '<leader>A', 'ggVG', opts)
-- Yank all into clipboard
map('n', '<leader>ay', 'ggVG"+y', opts)
-- Clear buffer
map('n', '<leader>cb', ':%d<CR>', opts)
