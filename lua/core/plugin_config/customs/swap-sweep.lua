local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"


local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>ss', ':lua require("core.plugin_config.customs.swap-sweep").find_and_sweep()<CR>', opts)

local S = {}
S.find_and_sweep = function(options)
  local swap_file_dir = os.getenv('HOME') .."/.local/state/nvim/swap/"
  options = options or {
    cmd = 'vsplit term//:rm $HOME/.local/state/nvim/swap/%s'
  }


  local telescope_opts = require('telescope.themes').get_dropdown({
    prompt_title = options.title or "Delete Swap File",
    previewer = false,
    cwd = swap_file_dir
  })

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

return S
