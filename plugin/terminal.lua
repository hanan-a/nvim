local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>tr', ':term<CR>', opts)
map('t', '<ESC><ESC>', '<C-\\><C-n>', opts) -- Exit terminal mode with ESC

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('PTerm', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

local job_id = nil
vim.keymap.set("n", "<leader>pt", function ()
  if job_id ~= nil then
    -- hide the split
    vim.cmd("q")
  else
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd("J")
    vim.api.nvim_win_set_height(0, 10)
    job_id = vim.bo.channel
  end
end)
