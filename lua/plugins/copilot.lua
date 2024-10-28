return {
  "zbirenbaum/copilot.lua",
  enabled = true,
  lazy = true,
  event = "BufRead",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<c-y>",
        next = "<m-]>",
        prev = "<m-[>",
        dismiss = "<c-]>",
      },
    },
    panel = { enabled = true },
  },
}
