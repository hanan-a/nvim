return { 
  "zbirenbaum/copilot.lua",
  enabled = false,
  config = function()
    require('copilot').setup({
      suggestion = {
        enabled = false,
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
