require("copilot").setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<C-y>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
  panel = { enabled = true },
})

