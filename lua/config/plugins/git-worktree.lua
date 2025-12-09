return {
  'polarmutex/git-worktree.nvim',
  version = '^2',
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim", -- optional
  },
  lazy = true,
  keys = function()
    local keys = {
      { '<leader>gw', function() require('telescope').extensions.git_worktree.git_worktree() end, desc = "Git Worktree: Switch" },

      --     -- Creates a worktree.  Requires the path, branch name, and the upstream
      -- -- Example:
      -- :lua require("git-worktree").create_worktree("feat-69", "master", "origin")
      --
      -- -- switches to an existing worktree.  Requires the path name
      -- -- Example:
      -- :lua require("git-worktree").switch_worktree("feat-69")
      --
      -- -- deletes to an existing worktree.  Requires the path name
      -- -- Example:
      -- :lua require("git-worktree").delete_worktree("feat-69")
    }

    return keys
  end,
  opts = {},
  config = function()
    require('telescope').load_extension('git_worktree')
    local Hooks = require("git-worktree.hooks")
    local config = require('git-worktree.config')
    local update_on_switch = Hooks.builtins.update_current_buffer_on_switch

    Hooks.register(Hooks.type.SWITCH, function(path, prev_path)
      vim.notify("Moved from " .. prev_path .. " to " .. path)
      update_on_switch(path, prev_path)
    end)

    Hooks.register(Hooks.type.DELETE, function()
      vim.cmd(config.update_on_change_command)
    end)
  end
}
