local oil = require("oil")

oil.setup({
  -- git = {
  --   -- return true to automatically git add/mv/rm files
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
  -- configuration for the floating window in oil.open_float
  float = {
    -- padding around the floating window
    padding = 2,
    max_width = 0,
    max_height = 0,
    border = "rounded",
    win_options = {
      winblend = 0,
    },
  },
  view_options = {
    show_hidden = true,
  }
})

vim.keymap.set("n", "-", oil.open, { desc = "Open parent directory" })
vim.keymap.set("n", "_", oil.open_float, { desc = "Open parent directory" })
