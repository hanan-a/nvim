return {
  "zbirenbaum/copilot-cmp",
  enabled = false, -- Disabled: migrated to blink.cmp (copilot.lua works independently)
  config = function ()
    require("copilot_cmp").setup()
  end
}

