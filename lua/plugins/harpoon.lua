local function toggle_telescope(harpoon_files)
  -- basic telescope configuration
  local conf = require("telescope.config").values
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

return {
  "ThePrimeagen/harpoon",
  lazy = false,
  name = "Harpoon",
  cmd = { "Harpoon" },
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = function()
    local harpoon = require("harpoon")
    local keys = {
      {
        "<leader>m",
        function()
          harpoon:list():add()
        end,
        desc = "Mark file with Harpoon",
      },
      {
        "<leader>e",
        function()
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
      {
        "<C-c>",
        function()
          harpoon:list():next()
        end,
        desc = "Navigate to next Harpoon file",
      },
      {
        "<C-x>",
        function()
          harpoon:list():prev()
        end,
        desc = "Navigate to previous Harpoon file",
      },
      {
        "<C-e>",
        function()
          toggle_telescope(harpoon:list())
        end,
        desc = "Open Harpoon list with Telescope",
      }
    }

    for i = 1, 5 do
      table.insert(keys, {
        "<leader>" .. i,
        function()
          harpoon:list():select(i)
        end,
        desc = "Harpoon to File " .. i,
      })
    end
    return keys
  end,
}

