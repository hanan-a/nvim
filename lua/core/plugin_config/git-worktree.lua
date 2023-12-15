local Worktree = require("git-worktree")
Worktree.setup({
    -- change_directory_command = <str> -- default: "cd",
    -- update_on_change = <boolean> -- default: true,
    -- update_on_change_command = <str> -- default: "e .",
    -- clearjumps_on_change = <boolean> -- default: true,
    -- autopush = <boolean> -- default: false,
})

-- -- Creates a worktree.  Requires the path, branch name, and the upstream
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

require("telescope").load_extension("git_worktree")

-- :lua require('telescope').extensions.git_worktree.git_worktrees()
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-f> - toggles forcing of the next deletion


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
