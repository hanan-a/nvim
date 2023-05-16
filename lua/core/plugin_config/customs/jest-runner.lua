local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>Jr', ':lua require("core.plugin_config.customs.jest-runner").find_and_run({ title = "Run a Jest Suite", filter = ".spec.*$", cmd = "vsplit term://npx jest %s"})<CR>', opts)
map('n', '<leader>Jw', ':lua require("core.plugin_config.customs.jest-runner").find_and_run({ title = "Run a Jest Suite", filter = ".spec.*$", cmd = "vsplit term://npx jest --watch %s"})<CR>', opts)

local function find_and_run(options)
  options = options or {}

  local telescope_opts = require('telescope.themes').get_dropdown({
    prompt_title = options.title or "Jest Runner",
    previewer = false,
  })

  if options.filter then
    telescope_opts["search_file"] = options.filter
  end

  telescope_opts['initial_mode'] = 'normal'

  telescope_opts["attach_mappings"] = function(prompt_bufnr)
    actions.select_default:replace(function()
      actions.close(prompt_bufnr)

      local selection = action_state.get_selected_entry()
      local cmd = string.format(options.cmd, selection[1])

      vim.cmd(cmd)
    end)

    return true
  end

  require('telescope.builtin').find_files(telescope_opts)
end

return {
  find_and_run = find_and_run,
}

