
-- Debug Adapter Protocol client implementation
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    -- Provides a beautiful UI for nvim-dap
    {
      "rcarriga/nvim-dap-ui",
      dependencies = { "nvim-neotest/nvim-nio" }, -- Required dependency for nvim-dap-ui
      config = function()
        local dapui = require("dapui")
        dapui.setup({
          -- Layout configuration (customize as needed)
          layouts = {
            {
              elements = {
                { id = "scopes", size = 0.25 },
                { id = "breakpoints", size = 0.25 },
                { id = "stacks", size = 0.25 },
                { id = "watches", size = 0.25 },
              },
              size = 40,
              position = "left",
            },
            {
              elements = {
                { id = "repl", size = 0.5 },
                { id = "console", size = 0.5 },
              },
              size = 10,
              position = "bottom",
            },
          },
          -- Other dapui settings can go here
          -- e.g., floating = { max_height = 0.9, max_width = 0.9 }
        })

        local dap = require("dap")
        -- Automatically open/close dap-ui when debugging starts/stops
        dap.listeners.after.event_initialized["dapui_config"] = function()
          dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
          dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
          dapui.close()
        end
      end,
    },
    -- Add other DAP adapter/configuration plugins here if needed
    -- e.g., { "theHamsta/nvim-dap-virtual-text" }
    -- Installs and configures the Node debugger adapter for JS/TS
    {
      "mxsdev/nvim-dap-vscode-js",
      dependencies = { "mfussenegger/nvim-dap" },
      opts = {
        -- Path to node executable. Defaults to $NODE_PATH, and then "node"
        -- node_path = "node",

        -- Path to debugger package. Defaults to $NODE_PATH, and then ~/.local/share/nvim/mason/packages/js-debug-adapter
        debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",

        -- Command to use to launch the debug server. Takes precedence over node_path and debugger_path
        -- debugger_cmd = { "node" },

        -- which adapters to register in nvim-dap
        adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },

        -- Path for file logging
        -- log_file_path = "(stdpath cache)/dap_vscode_js.log",

        -- Logging level for output to file. Set to false to disable logging.
        -- log_level = false,

        -- Logging level for output to console. Set to false to disable console output.
        -- log_console_level = vim.log.levels.ERROR,
      },
    },
  },
  config = function()
    local dap = require("dap")
    local map = vim.keymap.set
    local opts = { silent = true }

    -- Basic debugging keymaps
    map("n", "<leader>b", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint", silent = true })
    map("n", "<F5>", dap.continue, { desc = "DAP: Continue", silent = true })
    map("n", "<F10>", dap.step_over, { desc = "DAP: Step Over", silent = true })
    map("n", "<F7>", dap.step_into, { desc = "DAP: Step Into", silent = true })
    map("n", "<F9>", dap.step_out, { desc = "DAP: Step Out", silent = true })
    map("n", "<leader>dr", dap.repl.open, { desc = "DAP: Open REPL", silent = true })
    map("n", "<leader>dl", dap.run_last, { desc = "DAP: Run Last", silent = true })
    map("n", "<leader>dt", dap.terminate, { desc = "DAP: Terminate", silent = true })

    -- Keymaps for dap-ui
    map("n", "<leader>dui", require("dapui").toggle, { desc = "DAP UI: Toggle", silent = true })
    map("n", "<leader>due", require("dapui").eval, { desc = "DAP UI: Evaluate", silent = true }) -- Evaluate expression under cursor

    -- Define adapters and configurations for other languages below

    -- Setup JS/TS debugging via nvim-dap-vscode-js
    require("dap-vscode-js").setup({
      -- Path to node executable. Defaults to $NODE_PATH, and then "node"
      -- node_path = "node",

      -- Path to debugger package. Defaults to $NODE_PATH, and then ~/.local/share/nvim/mason/packages/js-debug-adapter
      debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",

      -- Command to use to launch the debug server. Takes precedence over node_path and debugger_path
      -- debugger_cmd = { "node" },

      -- which adapters to register in nvim-dap
      adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },

      -- Path for file logging
      -- log_file_path = "(stdpath cache)/dap_vscode_js.log",

      -- Logging level for output to file. Set to false to disable logging.
      -- log_level = false,

      -- Logging level for output to console. Set to false to disable console output.
      -- log_console_level = vim.log.levels.ERROR,
    })

    -- Define configurations for JavaScript and TypeScript (including Jest)
    for _, language in ipairs({ "typescript", "javascript" }) do
      dap.configurations[language] = {
        -- Debug single file (Node)
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        -- Attach to running process (Node)
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require("dap.utils").pick_process,
          cwd = "${workspaceFolder}",
        },
        -- Debug Jest tests
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug Jest Tests",
          -- trace = true, -- include debugger info
          runtimeExecutable = "node",
          runtimeArgs = {
            "./node_modules/jest/bin/jest.js",
            "--runInBand",
          },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
        -- Debug Jest tests for the current file
        {
          type = "pwa-node",
          request = "launch",
          name = "Debug Current Jest File",
          -- trace = true, -- include debugger info
          runtimeExecutable = "node",
          runtimeArgs = {
            "./node_modules/jest/bin/jest.js",
            "${fileBasename}",
          },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
      }
    end

    -- Example for Python (requires debugpy: :MasonInstall python-debug-adapter)
    -- dap.adapters.python = {
    --   type = 'executable',
    --   command = require("mason-registry").get_package("python-debug-adapter"):get_install_path() .. "/venv/bin/python",
    --   args = { '-m', 'debugpy.adapter' }
    -- }
    --
    -- dap.configurations.python = {
    --   {
    --     type = 'python',
    --     request = 'launch',
    --     name = "Launch file",
    --     program = "${file}",
    --     pythonPath = function()
    --       -- Add logic to detect virtual envs, etc.
    --       return '/usr/bin/python' -- Or your default python
    --     end,
    --   },
    -- }

    print("nvim-dap configured with JS/TS/Jest support.")
  end,
}
