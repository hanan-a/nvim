local M = {}

function M.get_default_branch()
  -- Try to get the default branch from the 'origin' remote
  local handle = io.popen("git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null")
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result and result ~= '' then
      local branch = result:gsub('^origin/', ''):gsub('%s+', '')
      if branch ~= '' then
        return branch
      end
    end
  end

  -- If remote is not set up, try to find 'main' or 'master' locally.
  -- This is more reliable than `git branch --list` as it doesn't include the '*' for the current branch.
  handle = io.popen("git branch --format='%(refname:short)' --list main master | head -n 1")
  if handle then
    local result = handle:read("*a")
    handle:close()
    if result and result ~= '' then
      return result:gsub('%s+', '')
    end
  end

  -- Fallback to main
  return "main"
end

return M