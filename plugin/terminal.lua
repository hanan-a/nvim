local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Terminal handling
map('n', '<leader>tr', ':term<CR>', opts)
vim.api.nvim_command('autocmd TermOpen * startinsert') -- Enter terminal mode in insert mode
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber') -- Hide line numbers in terminal
vim.api.nvim_command('autocmd TermOpen * setlocal signcolumn=no') -- Hide sign column in terminal
map('t', '<ESC><ESC>', '<C-\\><C-n>', opts) -- Exit terminal mode with ESC

-- local pterminal_group = vim.api.nvim_create_augroup('PTerm', { clear = true })
-- local terminal_buf = nil
-- vim.api.nvim_create_autocmd('TermOpen', {
--   callback = function()
--     if terminal_buf == nil then
--       terminal_buf = vim.api.nvim_get_current_buf()
--     else
--       vim.api.nvim_buf_set_option(terminal_buf, 'buflisted', false)
--     end
--   end,
--   group = pterminal_group,
--   pattern = '*',
-- })
