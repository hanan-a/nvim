local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '
map('i', ';;', '<Esc>', opts)
map('n', '<leader>t', ':tabnew<CR>', opts)

-- NvimTree
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)

-- Split navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-c>', '<C-w>c', opts)

-- Split resizing
map('n', '<A-j>', '<C-w>-', opts)
map('v', '<A-j>', '<C-w>-', opts)
map('n', '<A-k>', '<C-w>+', opts)
map('v', '<A-k>', '<C-w>+', opts)
map('n', '<A-l>', '<C-w>>', opts)
map('v', '<A-l>', '<C-w>>', opts)
map('n', '<A-h>', '<C-w><', opts)
map('v', '<A-h>', '<C-w><', opts)

-- Copy to clipboard
map('n', '<leader>y', '"+y', opts)
map('v', '<leader>y', '"+y', opts)
-- Paste to clipboard
map('n', '<leader>p', '"+p', opts)
map('v', '<leader>p', '"+p', opts)

-- Exit Terminal
map('t', '<ESC>', '<C-\\><C-n>', opts)

-- Telescope
map('n', '<leader>z', '<cmd>lua require("telescope.builtin").find_files()<cr>', opts)
map('n', '<leader>g', '<cmd>lua require("telescope.builtin").live_grep()<cr>', opts)
map('n', '<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>', opts)
map('n', '<leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>', opts)
map('n', '<leader>fp', ':Telescope project<CR>', opts)

-- Hop
map('n', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
map('n', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
map('o', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
map('o', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false, inclusive_jump = true })<cr>", {})
--map('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>", {})
--map('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>", {})
map('n', '<leader>n', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
map('v', '<leader>n', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>", {})
map('o', '<leader>n', "<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>", {})

map('n', '<leader>lg', ':LazyGit<CR>', opts)

-- Renamer
map('n', '<S-F6>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
map('v', '<S-F6>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

-- Remaps for the refactoring operations currently offered by the plugin
map("v", "<leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
map("v", "<leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
map("v", "<leader>rv", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], {noremap = true, silent = true, expr = false})
map("v", "<leader>ri", [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Extract block doesn't need visual mode
map("n", "<leader>rb", [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], {noremap = true, silent = true, expr = false})
map("n", "<leader>rbf", [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]], {noremap = true, silent = true, expr = false})

-- Inline variable can also pick up the identifier currently under the cursor without visual mode
map("n", "<leader>ri", [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], {noremap = true, silent = true, expr = false})

-- Barbar
map('s', '<C-n>', "<cmd>lua require'tree'.toggle()<CR>", opts)

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-.>', '<Cmd>BufferNext<CR>', opts)
-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
-- Sort automatically by...
map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used
