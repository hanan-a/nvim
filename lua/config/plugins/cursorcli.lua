return {
  "suiramdev/cursorcli.nvim",
  config = function()
    require("cursorcli").setup {
      -- By default this runs `agent` in the current working directory.
      command = { "agent" },
      -- Optional tweaks:
      -- auto_insert = true, -- jump into insert mode after opening
      notify = true,      -- use vim.notify for status messages
      -- path = { relative_to_cwd = true },
      -- float = { width = 0.9, height = 0.8, border = "rounded" },
    }
  end,
  keys = {
    -- { "<leader>af", "<Cmd>CursorCliOpenWithLayout float<CR>",   desc = "Open Cursor CLI (floating window)",   mode = "n" },
    -- { "<leader>av", "<Cmd>CursorCliOpenWithLayout vsplit<CR>", desc = "Open Cursor CLI (vertical split)",   mode = "n" },
    -- { "<leader>ah", "<Cmd>CursorCliOpenWithLayout hsplit<CR>", desc = "Open Cursor CLI (horizontal split)", mode = "n" },
    -- { "<leader>ac", function() require("cursorcli").close() end,  desc = "Close Cursor CLI terminal",     mode = "n" },
    -- { "<leader>an", function() require("cursorcli").new_chat() end, desc = "New Cursor CLI chat", mode = "n" },
    -- { "<leader>as", function() require("cursorcli").select_chat() end, desc = "Select chat (fuzzy finder with preview)", mode = "n" },
    -- { "<leader>ar", function() require("cursorcli").rename_chat() end, desc = "Rename current Cursor CLI chat", mode = "n" },
    -- { "<leader>aR", function() require("cursorcli").resume() end, desc = "Resume last Cursor CLI chat", mode = "n" },
    -- { "<leader>ax", function() require("cursorcli").restart() end, desc = "Restart Cursor CLI (new session in current chat)", mode = "n" },
    -- { "<leader>al", function() require("cursorcli").list_sessions() end, desc = "List Cursor CLI sessions (agent ls)", mode = "n" },
    { "<leader>aa", function() require("cursorcli").add_visual_selection() end,
      desc = "Add visual selection to Cursor CLI chat", mode = "x" },
    { "<leader>aA", function() require("cursorcli").request_fix_error_at_cursor_in_new_session() end,
      desc = "New session: send error at cursor", mode = "n" },
    { "<leader>aA", function() require("cursorcli").add_visual_selection_to_new_session() end,
      desc = "New session: send visual selection", mode = "x" },
  },
}
