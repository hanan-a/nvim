require'telescope'.load_extension('project')

require('telescope').setup{
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    live_grep = {
      theme = "dropdown",
    }
  }
}
