Snacks = Snacks
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    dashboard = { enabled = false, example = "github" },
    terminal = {
      bo = {
        filetype = "snacks_terminal",
      },
      wo = {},
      keys = {
        q = "hide",
        gf = function(self)
          local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
          if f == "" then
            Snacks.notify.warn("No file under cursor")
          else
            self:hide()
            vim.schedule(function()
              vim.cmd("e " .. f)
            end)
          end
        end,
        term_normal = {
          "<esc>",
          function(self)
            self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
            if self.esc_timer:is_active() then
              self.esc_timer:stop()
              vim.cmd("stopinsert")
            else
              self.esc_timer:start(200, 0, function() end)
              return "<esc>"
            end
          end,
          mode = "t",
          expr = true,
          desc = "Double escape to normal mode",
        },
      },
    },
  },
  keys = {
    { "<leader>gg", function() Snacks.lazygit() end,               "Snacks: Open lazygit" },
    { "<leader>lg", function() Snacks.lazygit.log() end,           "Snacks: Open lazygit Log" },
    { "<M-o>",      function() Snacks.terminal() end,              desc = "Toggle Terminal" },
    { "<leader>nh", function() Snacks.notifier.show_history() end, desc = "Show notifier history" },
  }
}
