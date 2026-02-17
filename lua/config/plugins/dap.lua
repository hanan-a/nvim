return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
  },
  keys = {
    -- Breakpoints
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    {
      "<leader>dB",
      function() require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: ")) end,
      desc = "Conditional Breakpoint",
    },
    {
      "<leader>dL",
      function() require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: ")) end,
      desc = "Log Point",
    },

    -- Controls
    { "<leader>dc", function() require("dap").continue() end, desc = "Continue / Start Debugging" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>do", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dO", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down in Stack" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up in Stack" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },

    -- Session Management
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate Session" },
    { "<leader>dr", function() require("dap").restart() end, desc = "Restart Session" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last Configuration" },

    -- UI
    { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle Debug UI" },
    { "<leader>de", function() require("dapui").eval() end, mode = { "n", "v" }, desc = "Evaluate Expression" },
    {
      "<leader>dE",
      function() require("dapui").eval(vim.fn.input("Expression: ")) end,
      desc = "Evaluate Input",
    },

    -- REPL
    { "<leader>dR", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },

    -- Hover / Scopes
    { "<leader>dh", function() require("dap.ui.widgets").hover() end, desc = "Hover Variables" },
    {
      "<leader>ds",
      function()
        local widgets = require("dap.ui.widgets")
        widgets.centered_float(widgets.scopes)
      end,
      desc = "Scopes",
    },
  },
  config = function()
    local dap = require("dap")

    ---------------------------------------------------------------------------
    -- Adapter: vscode-js-debug via Mason
    ---------------------------------------------------------------------------
    local js_debug_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"
    if vim.fn.isdirectory(js_debug_path) == 0 then
      vim.notify(
        "js-debug-adapter is not installed. Run :MasonInstall js-debug-adapter",
        vim.log.levels.WARN
      )
      return
    end

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          js_debug_path .. "/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }

    -- Aliases for compatibility
    dap.adapters["node"] = dap.adapters["pwa-node"]
    dap.adapters["pwa-chrome"] = dap.adapters["pwa-node"]

    ---------------------------------------------------------------------------
    -- Debug Configurations
    ---------------------------------------------------------------------------
    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch Current File (Node)",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
      },
      {
        type = "pwa-node",
        request = "attach",
        name = "Attach to Node Process",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
      },
      {
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
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Jest Current File",
        runtimeExecutable = "node",
        runtimeArgs = {
          "./node_modules/.bin/jest",
          "${file}",
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
      {
        type = "pwa-node",
        request = "launch",
        name = "Debug Playwright Tests",
        runtimeExecutable = "node",
        runtimeArgs = {
          "./node_modules/.bin/playwright",
          "test",
          "--debug",
        },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
        sourceMaps = true,
      },
      {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch Chrome",
        url = "http://localhost:3000",
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        skipFiles = { "<node_internals>/**" },
      },
      {
        type = "pwa-chrome",
        request = "attach",
        name = "Attach to Chrome",
        port = 9222,
        webRoot = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
      },
    }

    -- TypeScript / React share the same configurations
    dap.configurations.typescript = dap.configurations.javascript
    dap.configurations.typescriptreact = dap.configurations.javascript
    dap.configurations.javascriptreact = dap.configurations.javascript

    ---------------------------------------------------------------------------
    -- Signs
    ---------------------------------------------------------------------------
    vim.fn.sign_define("DapBreakpoint", {
      text = "🔴",
      texthl = "DapBreakpoint",
      linehl = "",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapBreakpointCondition", {
      text = "🟡",
      texthl = "DapBreakpoint",
      linehl = "",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapBreakpointRejected", {
      text = "⭕",
      texthl = "DapBreakpoint",
      linehl = "",
      numhl = "DapBreakpoint",
    })
    vim.fn.sign_define("DapLogPoint", {
      text = "📝",
      texthl = "DapLogPoint",
      linehl = "",
      numhl = "DapLogPoint",
    })
    vim.fn.sign_define("DapStopped", {
      text = "▶️",
      texthl = "DapStopped",
      linehl = "DapStoppedLine",
      numhl = "DapStopped",
    })

    ---------------------------------------------------------------------------
    -- Which-key group label
    ---------------------------------------------------------------------------
    local wk_ok, wk = pcall(require, "which-key")
    if wk_ok then
      wk.add({
        { "<leader>d", group = "Debug" },
      })
    end
  end,
}
