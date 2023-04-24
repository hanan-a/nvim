local map = vim.keymap.set;

map("n", "<F5>", ":lua require'dap'.continue()<CR>")
map("n", "<F8>", ":lua require'dap'.set_over()<CR>")
map("n", "<F7>", ":lua require'dap'.set_into()<CR>")
map("n", "<F9>", ":lua require'dap'.set_out()<CR>")

map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
-- map("n", "<leader>B", ":lua require'dap'.()<CR>")


require("dapui").setup()
local dap = require('dap');

dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = {os.getenv("HOME") .. "/debuggers/vscode-chrome-debug/out/src/chromeDebug.js"}
}

dap.configurations.javascript = {
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

dap.configurations.javascriptreact = {
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

dap.configurations.typescript = {
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}

dap.configurations.typescriptreact = {
    {
        type = "chrome",
        request = "attach",
        program = "${file}",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        port = 9222,
        webRoot = "${workspaceFolder}"
    }
}
