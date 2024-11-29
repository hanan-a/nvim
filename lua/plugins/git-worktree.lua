return {
  'ThePrimeagen/git-worktree.nvim',
  dependencies = {
    "nvim-telescope/telescope.nvim", -- optional
  },
  lazy = true,
  keys = function ()
    local keys = {
    { '<leader>gw', function() require('telescope').extensions.git_worktree.git_worktrees() end, desc = "Git Worktree: Switch" },
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
  config = function ()
    require('telescope').load_extension('git_worktree')

    local Worktree = require("git-worktree")
    -- op = Operations.Switch, Operations.Create, Operations.Delete
    -- metadata = table of useful values (structure dependent on op)
    --      Switch
    --          path = path you switched to
    --          prev_path = previous worktree path
    --      Create
    --          path = path where worktree created
    --          branch = branch name
    --          upstream = upstream remote name
    --      Delete
    --          path = path where worktree deleted

    Worktree.on_tree_change(function(op, metadata)
      if op == Worktree.Operations.Switch then
        print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
      end
end)
  end
}
