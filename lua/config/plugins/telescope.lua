return {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  version = '0.1.x', -- or branch = '0.1.x',
  dependencies = { {'nvim-lua/plenary.nvim'} },
  config = function()
    require('telescope').setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "-L",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
        },
        prompt_prefix = "   ",
        selection_caret = "  ",
        entry_prefix = "  ",
        initial_mode = "insert",
        -- initial_mode = "normal",
        selection_strategy = "reset",
        sorting_strategy = "ascending",
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        file_sorter = require("telescope.sorters").get_fuzzy_file,
        file_ignore_patterns = { "node_modules" },
        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
        -- path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        -- Developer configurations: Not meant for general override
        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        mappings = {
          n = {
            ["q"] = require("telescope.actions").close,
            ["d"] = require("telescope.actions").delete_buffer,
          },
        },
      },

      extensions_list = { "themes", "terms" },
      extensions = {
        fzf = {},
      }
    })
    local builtin = require('telescope.builtin')
    local map = vim.keymap
    map.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files' })
    map.set('n', '<leader>fg', builtin.live_grep, { desc = 'Search - Live Grep' })
    map.set('n', '<leader>fw', builtin.grep_string, { desc = 'Search word under cursor' })
    map.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help Tags' })
    map.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Old Files' })
    map.set('n', '<C-p>', builtin.git_files, { desc = 'Git Files' })
    map.set('n', '<leader>sb', builtin.git_branches, { desc = 'Git Branches' })
    map.set('n', '<leader>gc', builtin.git_commits, { desc = 'Git Commits' })
    map.set('n', '<leader>gb', builtin.git_bcommits, { desc = 'Git Buffer Commits' })
    map.set('n', '<leader>st', ':Telescope git_status initial_mode=normal<CR>', { desc = 'Git Status' })
    map.set('n', '<leader>sd', ':Telescope diagnostics initial_mode=normal<CR>', { desc = 'Diagnostics' })
    -- map.set('n', 'H', ':Telescope buffers initial_mode=normal sort_mru=true sort_lastused=true<CR>', { desc = 'Buffers' })
    map.set('n', '<leader>ss', builtin.spell_suggest, { desc = 'Spell Suggest' })
    map.set('n', '<leader>ql', builtin.quickfix, { desc = 'Quickfix List' })
    map.set('n', '<leader>mk', builtin.marks, { desc = 'List Marks' })
    map.set({ 'n', 'v', 't' }, '<leader>rr', builtin.registers, { desc = 'Registers' })
    require('telescope').load_extension('fzf')
  end
}

