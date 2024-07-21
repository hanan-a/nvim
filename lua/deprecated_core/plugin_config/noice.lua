require("noice").setup({
  -- add any options here
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
  },
})
