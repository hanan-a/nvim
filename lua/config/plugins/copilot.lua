local ZBIRENBAUM = {
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

---@diagnostic disable-next-line: unused-local
local COPILOT = {
  "github/copilot.vim",
  enabled = true,
  lazy = true,
  cmd = "InsertEnter",
  opts = {},
  key = function ()
    local keys = {
      { "<C-y>", "copilot#accept", desc = "Copilot: Accept Suggestion", mode = "i" },
    }

    return keys
  end,
}

return ZBIRENBAUM
