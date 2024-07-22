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
map('n', '<leader>_', '<C-w>v', opts)

-- Terminal handling
map('n', '<leader>t', ':term<CR>', opts)
vim.api.nvim_command('autocmd TermOpen * startinsert') -- Enter terminal mode in insert mode
vim.api.nvim_command('autocmd TermOpen * setlocal nonumber norelativenumber') -- Hide line numbers in terminal
vim.api.nvim_command('autocmd TermOpen * setlocal signcolumn=no') -- Hide sign column in terminal
map('t', '<ESC>', '<C-\\><C-n>', opts) -- Exit terminal mode with ESC

-- -- Pane Split navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
-- map('n', '<C-c>', '<C-w>c', opts)

-- Copy to clipboard
map('n', '<leader>y', '"+y', opts)
map('v', '<leader>y', '"+y', opts)
-- Paste to clipboard
map('n', '<leader>p', '"+p', opts)
map('v', '<leader>p', '"+p', opts)


-- LazyGit
map('n', '<leader>lg', ':LazyGit<CR>', opts)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- LSP Commands
map('n', '<leader>rlsp', ':LspRestart<CR>', opts)


-- -- LSP SAGA ---------------------------------------------------
-- -- LSP finder - Find the symbol's definition
-- -- If there is no definition, it will instead be hidden
-- -- When you use an action in finder like "open vsplit",
-- -- you can use <C-t> to jump back
-- map("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
--
-- local keymap = vim.keymap.set
-- -- Code action
-- keymap({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>")
--
-- -- Rename all occurrences of the hovered word for the entire file
-- keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>")
--
-- -- Rename all occurrences of the hovered word for the selected files
-- keymap("n", "<leader>rn", "<cmd>Lspsaga rename ++project<CR>")
--
-- -- Peek definition
-- -- You can edit the file containing the definition in the floating window
-- -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- -- It also supports tagstack
-- -- Use <C-t> to jump back
-- keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")
--
-- -- Go to definition
-- keymap("n","gd", "<cmd>Lspsaga goto_definition<CR>")
--
-- -- Peek type definition
-- -- You can edit the file containing the type definition in the floating window
-- -- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- -- It also supports tagstack
-- -- Use <C-t> to jump back
-- keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")
--
-- -- -- Go to type definition
-- keymap("n","gt", "<cmd>Lspsaga goto_type_definition<CR>")
--
--
-- -- Show line diagnostics
-- -- You can pass argument ++unfocus to
-- -- unfocus the show_line_diagnostics floating window
-- keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
--
-- -- -- Show buffer diagnostics
-- -- keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
--
-- -- -- Show workspace diagnostics
-- -- keymap("n", "<leader>sw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")
--
-- -- Show cursor diagnostics
-- keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
--
-- -- Diagnostic jump
-- -- You can use <C-o> to jump back to your previous location
-- keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
-- keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
--
-- -- Diagnostic jump with filters such as only jumping to an error
-- keymap("n", "[E", function()
--   require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end)
-- keymap("n", "]E", function()
--   require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end)
--
-- -- Toggle outline
-- keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")
--
-- -- Hover Doc
-- -- If there is no hover doc,
-- -- there will be a notification stating that
-- -- there is no information available.
-- -- To disable it just use ":Lspsaga hover_doc ++quiet"
-- -- Pressing the key twice will enter the hover window
-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")
--
-- -- If you want to keep the hover window in the top right hand corner,
-- -- you can pass the ++keep argument
-- -- Note that if you use hover with ++keep, pressing this key again will
-- -- close the hover window. If you want to jump to the hover window
-- -- you should use the wincmd command "<C-w>w"
-- keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")
--
-- -- Call hierarchy
-- keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
-- keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
--
-- -- Floating terminal
-- keymap({"n", "t"}, "<A-d>", "<cmd>Lspsaga term_toggle<CR>")

