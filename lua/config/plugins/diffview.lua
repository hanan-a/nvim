local utils = require('config.utils')

return {
  'sindrets/diffview.nvim',
  lazy = 'VeryLazy',
  keys = {
    { '<leader>dv', '<cmd>DiffviewOpen<cr>', desc = 'Open Diffview' },
    {
      '<leader>cm',
      function()
        local default_branch = utils.get_default_branch()
        vim.cmd('DiffviewOpen ' .. default_branch .. '...HEAD')
      end,
      desc = 'Diffview compare HEAD to default branch',
    },
    { '<leader>dc', '<cmd>DiffviewClose<cr>', desc = 'Close Diffview' },
    { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = 'File History' },
  },
}
