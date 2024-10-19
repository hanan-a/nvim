local set = vim.opt

set.expandtab = true
set.smarttab = true
set.shiftwidth = 2
set.tabstop = 2
set.hlsearch = true
set.incsearch = true
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.splitright = true
set.wrap = false
set.scrolloff = 5
set.fileencoding = 'utf-8'
set.termguicolors = true

set.relativenumber = true
set.number = true
set.cursorline = true

set.hidden = true
set.mouse = 'a'

set.spelllang = 'en_us'
set.spell = true

set.shell = '/bin/bash'

-- Save undo history
vim.o.undofile = true


vim.opt.foldmethod = "manual"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
 -- "virtual_text = true" is needed for tiny-inline-diagnostic
vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
    -- linehl = {
    --   [vim.diagnostic.severity.ERROR] = "ErrorMsg",
    -- },
    -- numhl = {
    --   [vim.diagnostic.severity.ERROR] = "Error",
    -- },
  }
})
