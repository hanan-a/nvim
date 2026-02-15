return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    -- Use the official install script which downloads the pre-built binary
    local install_path = vim.fn.stdpath("data") .. "/lazy/markdown-preview.nvim/app"
    vim.fn.system(string.format("cd %s && bash install.sh", install_path))
  end,
  config = function()
    -- Set to 1 to open preview in browser automatically
    vim.g.mkdp_auto_start = 0
    
    -- Set to 1 to auto close when leaving markdown buffer
    vim.g.mkdp_auto_close = 1
    
    -- Set to 1 to refresh markdown when saving the buffer or leaving from insert mode
    vim.g.mkdp_refresh_slow = 0
    
    -- Browser to open preview
    -- Default uses system default browser
    vim.g.mkdp_browser = ""
    
    -- Preview server port (set to empty for auto-assign)
    vim.g.mkdp_port = ""
    
    -- Echo preview page url in command line when open preview page
    vim.g.mkdp_echo_preview_url = 1
    
    -- Preview theme (dark or light)
    vim.g.mkdp_theme = "dark"
    
    -- Use a compatible fifo file path
    vim.g.mkdp_fifo = ""
    
    -- Keybindings for markdown preview
    vim.keymap.set("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "Toggle Markdown Preview" })
  end,
}

