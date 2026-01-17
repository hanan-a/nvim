return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 
    'rafamadriz/friendly-snippets',
    'L3MON4D3/LuaSnip', -- For snippet expansion
  },
  event = 'InsertEnter',
  enabled = true,

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- Use 'enter' preset for Enter to accept (matches nvim-cmp behavior)
    -- We'll override Tab/Shift-Tab in config to work with LuaSnip
    keymap = { preset = 'enter' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Sources matching nvim-cmp configuration
    -- Note: copilot and tabnine work independently via their own plugins
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- Rust fuzzy matcher for typo resistance and significantly better performance
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
  
  config = function(_, opts)
    local blink = require('blink.cmp')
    blink.setup(opts)
    
    -- Integrate with LuaSnip for snippet expansion
    local luasnip = require('luasnip')
    
    -- Custom keymap handling for Tab to work with LuaSnip
    -- This matches the nvim-cmp behavior: Tab navigates completion menu or jumps snippets
    vim.keymap.set({ 'i', 's' }, '<Tab>', function()
      if blink.is_visible() then
        blink.select_next()
      elseif luasnip.locally_jumpable(1) then
        luasnip.jump(1)
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
      end
    end, { desc = 'Next item or jump snippet' })
    
    vim.keymap.set({ 'i', 's' }, '<S-Tab>', function()
      if blink.is_visible() then
        blink.select_prev()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<S-Tab>', true, false, true), 'n', false)
      end
    end, { desc = 'Previous item or jump snippet' })
    
    -- Enter key handling - expand snippet if possible, otherwise confirm completion
    vim.keymap.set('i', '<CR>', function()
      if blink.is_visible() then
        if luasnip.expandable() then
          luasnip.expand()
        else
          blink.confirm({ select = true })
        end
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<CR>', true, false, true), 'n', false)
      end
    end, { desc = 'Confirm completion or expand snippet' })
  end,
}
