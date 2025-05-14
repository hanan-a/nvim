return {
  'hanan-a/npm-runner',
  dir = vim.fn.stdpath("data") .. "/npm-runner",
  dev = true,
  name = 'npm-runner',
  -- opts = {},
  dependencies = {
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    require('npm-runner').setup({
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    })
  end,
}
