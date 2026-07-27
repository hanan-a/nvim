local M = {}

--- Emit OSC 7 so herdr/tmux track nvim's cwd while it owns the pane.
function M.report_cwd()
  if vim.env.HERDR_ENV ~= '1' and not vim.env.TMUX then
    return
  end

  local cwd = vim.fn.getcwd()
  if cwd == '' then
    return
  end

  local path = vim.fn.fnamemodify(cwd, ':p')
  if path ~= '/' and path:sub(-1) == '/' then
    path = path:sub(1, -2)
  end

  local url = string.format('file://%s%s', vim.fn.hostname(), path)
  io.stderr:write(string.format('\27]7;%s\27\\', url))
end

function M.setup()
  vim.api.nvim_create_autocmd({ 'DirChanged', 'VimEnter' }, {
    group = vim.api.nvim_create_augroup('herdr_cwd', { clear = true }),
    callback = function()
      M.report_cwd()
    end,
  })
end

return M
