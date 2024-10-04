return {
  "ThePrimeagen/harpoon",
  lazy = false,
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  init = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>m", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    -- vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
    -- vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
    -- vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
    -- vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-x>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-c>", function() harpoon:list():next() end)

    -- map('n', '<c-m>', ':lua require("harpoon.ui").toggle_quick_menu()<cr>', opts)
    -- vim.keymap.set('n', '<leader>e', ui.toggle_quick_menu, opts)
    -- vim.keymap.set('n', '<leader>m', mark.add_file, opts)
    -- vim.keymap.set('n', '<leader>mr', mark.rm_file, opts)
    -- vim.keymap.set('n', '<c-c>', ui.nav_next, opts)
    -- vim.keymap.set('n', '<c-x>', ui.nav_prev, opts)
    --
    -- vim.keymap.set('n', '<c-e>', ':telescope harpoon marks initial_mode=normal<cr>', opts)
    -- vim.keymap.set('n', '<leader>e', ':telescope harpoon marks initial_mode=normal previewer=false<cr>', opts)
    
    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
        initial_mode = "normal",
      }):find()
    end
    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })
  end
}

