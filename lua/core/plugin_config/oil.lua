require("oil").setup({
  -- git = {
  --   -- Return true to automatically git add/mv/rm files
  --   add = function(path)
  --     return false
  --   end,
  --   mv = function(src_path, dest_path)
  --     return true
  --   end,
  --   rm = function(path)
  --     return true
  --   end,
  -- },
  -- Configuration for the floating window in oil.open_float
  float = {
    -- Padding around the floating window
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  }
})

-- vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "-", ":lua require('oil').open_float()<CR>", { desc = "Open parent directory" })
