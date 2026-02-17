return {
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = {
    'rafamadriz/friendly-snippets',
    'ribru17/blink-cmp-spell',
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
      providers = {
        spell = {
          name = 'Spell',
          module = 'blink-cmp-spell',
          opts = {
            enable_in_context = function()
              local curpos = vim.api.nvim_win_get_cursor(0)
              local captures = vim.treesitter.get_captures_at_pos(
                0,
                curpos[1] - 1,
                curpos[2] - 1
              )
              local in_spell_capture = false
              for _, cap in ipairs(captures) do
                if cap.capture == 'spell' then
                  in_spell_capture = true
                elseif cap.capture == 'nospell' then
                  return false
                end
              end
              return in_spell_capture
            end,
          },
        },
      },
    },

    -- Rust fuzzy matcher for typo resistance and significantly better performance
    fuzzy = {
      implementation = "prefer_rust_with_warning",
      sorts = {
        function(a, b)
          local sort = require('blink.cmp.fuzzy.sort')
          if a.source_id == 'spell' and b.source_id == 'spell' then
            return sort.label(a, b)
          end
        end,
        -- This is the normal default order, which we fall back to
        'score',
        'kind',
        'label',
      },
    },
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
