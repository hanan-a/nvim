return {
  'sindrets/diffview.nvim',
  lazy = 'VeryLazy',
  keys = {
    { '<leader>dv', '<cmd>DiffviewOpen<cr>', desc = 'Open Diffview' },
    { '<leader>dc', '<cmd>DiffviewClose<cr>', desc = 'Close Diffview' },
    { '<leader>gh', '<cmd>DiffviewFileHistory<cr>', desc = 'File History' },
  },
}
