return {
  "zbirenbaum/copilot.lua",
  enabled = true,
  config = function()
    require('copilot').setup({
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
    })
  end
}
