local M = {
  'codota/tabnine-nvim',
  build = "./dl_binaries.sh"
}

M.config = function()
  require('tabnine').setup({
    disable_auto_comment=true,
    accept_keymap="<Tab>",
    dismiss_keymap = "<C-]>",
    debounce_ms = 800,
    suggestion_color = {gui = "#808080", cterm = 244},
    exclude_filetypes = {"TelescopePrompt", "NvimTree"},
    log_file_path = nil, -- absolute path to Tabnine log file
  })
end

M.init = function()
  --- Example integration with Tabnine and LuaSnip; falling back to inserting tab if neither has a completion
  vim.keymap.set("i", "<tab>", function()
    if require("tabnine.keymaps").has_suggestion() then
      return require("tabnine.keymaps").accept_suggestion()
    elseif require("luasnip").jumpable(1) then
      return require("luasnip").jump(1)
    else
      return "<tab>"
    end
  end, { expr = true })
end

return M
