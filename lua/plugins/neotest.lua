return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "marilari88/neotest-vitest",
    'nvim-neotest/neotest-jest',
  },
  keys = function()
    local neotest = require('neotest')
    local keys = {
      {
        "<leader>ntp",
        function()
          neotest.output_panel.toggle()
        end,
        desc = "Neotest Open Output Panel",
      },
      {
        "<leader>nts",
        function()
          neotest.summary.toggle()
        end,
        desc = "Neotest Open Summary",
      },
      {
        "<leader>ntc",
        function()
          neotest.output.close()
          neotest.summary.close()
          neotest.output_panel.close()
        end,
        desc = "Neotest Close Windows",
      },
      {
        "<leader>tt",
        function ()
          neotest.summary.open()
          neotest.run.run({
            vitestCommand = 'npm test -- ',
            jestCommand = 'npm test -- ',
          })
        end,
        desc = "Run Watch",
      },
      {
        "<leader>tdv",
        function ()
          neotest.summary.open()
          neotest.run.run({
            vitestCommand = 'npm test -- ',
            jestCommand = 'npm test -- ',
            strategy = 'dap',
          })
        end,
      },
    }

    return keys
  end,
  opts = function(_, opts)
    if not opts then
      opts = {
        discovery = {
          enabled = false,
          concurrent = 0,
        },
      }
    end

    if not opts.adapters then
      opts.adapters = {}
    end

    table.insert(opts.adapters, require('neotest-vitest')({
      -- Filter directories when searching for test files. Useful in large projects (see Filter directories notes).
      filter_dir = function(name)
        return name ~= "node_modules"
      end,
    }))

    table.insert(opts.adapters, require('neotest-jest')({
      jestCommand = "npm test --",
      jestConfigFile = "custom.jest.config.ts",
      env = { CI = true },
      adapters = {
        jest_test_discovery = false,
      },
      cwd = function()
        return vim.fn.getcwd()
      end,
    }))

    return opts
  end,
}
