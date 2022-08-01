require('nvim_comment').setup()
require('null-ls').setup({
    sources = {
        require("null-ls").builtins.formatting.stylua,
        require("null-ls").builtins.formatting.eslint_d,
        require("null-ls").builtins.formatting.fixjson,
        require("null-ls").builtins.formatting.stylelint,
        require("null-ls").builtins.diagnostics.eslint_d,
        require("null-ls").builtins.diagnostics.jsonlint,
        require("null-ls").builtins.diagnostics.luacheck,
        require("null-ls").builtins.diagnostics.stylelint,
        require("null-ls").builtins.completion.spell,
        require("null-ls").builtins.completion.luasnip,
        require("null-ls").builtins.completion.tags,
        require("null-ls").builtins.completion.vsnip,
        require("null-ls").builtins.code_actions.refactoring,
        require("null-ls").builtins.code_actions.eslint_d,
        require("null-ls").builtins.code_actions.gitsigns,
    },
    debounce = 250,
    debug = false,
    default_timeout = 5000,
    diagnostics_format = "[#{c}] #{m} (#{s})"
})

local cmp = require'cmp'

local mappings_utils = require('renamer.mappings.utils')
require('renamer').setup({
    -- The popup title, shown if `border` is true
    title = 'Rename',
    -- The padding around the popup content
    padding = {
        top = 0,
        left = 0,
        bottom = 0,
        right = 0,
    },
    -- The minimum width of the popup
    min_width = 15,
    -- The maximum width of the popup
    max_width = 45,
    -- Whether or not to shown a border around the popup
    border = true,
    -- The characters which make up the border
    border_chars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    -- Whether or not to highlight the current word references through LSP
    show_refs = true,
    -- Whether or not to add resulting changes to the quickfix list
    with_qf_list = true,
    -- Whether or not to enter the new name through the UI or Neovim's `input`
    -- prompt
    with_popup = true,
    -- The keymaps available while in the `renamer` buffer. The example below
    -- overrides the default values, but you can add others as well.
    mappings = {
        ['<c-i>'] = mappings_utils.set_cursor_to_start,
        ['<c-a>'] = mappings_utils.set_cursor_to_end,
        ['<c-e>'] = mappings_utils.set_cursor_to_word_end,
        ['<c-b>'] = mappings_utils.set_cursor_to_word_start,
        ['<c-c>'] = mappings_utils.clear_line,
        ['<c-u>'] = mappings_utils.undo,
        ['<c-r>'] = mappings_utils.redo,
    },
    -- Custom handler to be run after successfully renaming the word. Receives
    -- the LSP 'textDocument/rename' raw response as its parameter.
    handler = nil,
})

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'cmp_tabnine' },
    { name = 'nvim_lsp' },
    { name = 'nvim_lua' },
    { name = 'path' },
    -- { name = 'vsnip' }, -- For vsnip users.
    { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Setup lspconfig.
--  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
-- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
-- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
--  capabilities = capabilities
--}
--
require("luasnip.loaders.from_vscode").lazy_load()
