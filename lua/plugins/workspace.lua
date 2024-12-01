return {
  "sanathks/workspace.nvim",
  dependencies = {"nvim-telescope/telescope.nvim"},
  opts = {
    workspaces = {
      { name = "Work",  path = "~/wrk",  keymap = { "<leader>w" } },
      { name = "Own", path = "~/own", keymap = { "<leader>p" } },
    },
---@diagnostic disable-next-line: unused-local
    tmux_session_name_generator = function (project_name, workspace_name)
      return project_name
    end
  },
  keys = function ()
    local ws = require('workspace')
    local keys = {
      { "<leader>as", function () ws.tmux_sessions() end, desc = "Switch TMUX sessions" },
    }

    return keys
  end
}
