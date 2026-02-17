return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-jest",
    "marilari88/neotest-vitest",
  },
  keys = {
    {
      "<leader>tt",
      function() require("neotest").summary.toggle() end,
      desc = "Toggle Test Summary",
    },
    {
      "<leader>tr",
      function() require("neotest").run.run() end,
      desc = "Run Nearest Test",
    },
    {
      "<leader>tf",
      function() require("neotest").run.run(vim.fn.expand("%")) end,
      desc = "Run Test File",
    },
    {
      "<leader>td",
      function() require("neotest").run.run({ strategy = "dap" }) end,
      desc = "Debug Nearest Test",
    },
    {
      "<leader>tD",
      function() require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" }) end,
      desc = "Debug Test File",
    },
    {
      "<leader>ts",
      function() require("neotest").run.stop() end,
      desc = "Stop Test",
    },
    {
      "<leader>to",
      function() require("neotest").output.open({ enter = true }) end,
      desc = "Show Test Output",
    },
    {
      "<leader>tp",
      function() require("neotest").output_panel.toggle() end,
      desc = "Toggle Output Panel",
    },
  },
  config = function()
    -- NOTE: neotest-playwright is intentionally omitted. Playwright debugging is
    -- handled via DAP configurations in dap.lua instead of a neotest adapter.
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
          jestCommand = "npm test --",
          jestConfigFile = "jest.config.js",
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
          dap = {
            type = "pwa-node",
            request = "launch",
            name = "Debug Jest Tests",
            runtimeExecutable = "node",
            runtimeArgs = {
              "./node_modules/.bin/jest",
              "--runInBand",
              "--no-coverage",
              "--no-cache",
              "--watchAll=false",
            },
            rootPath = "${workspaceFolder}",
            cwd = "${workspaceFolder}",
            console = "integratedTerminal",
            internalConsoleOptions = "neverOpen",
            sourceMaps = true,
            skipFiles = { "<node_internals>/**", "node_modules/**" },
          },
        }),
        require("neotest-vitest")({
          filter_dir = function(name)
            return name ~= "node_modules"
          end,
        }),
      },
      discovery = {
        enabled = false,
        concurrent = 0,
      },
      diagnostic = {
        enabled = true,
      },
      status = {
        enabled = true,
        virtual_text = true,
        signs = true,
      },
    })
  end,
}
