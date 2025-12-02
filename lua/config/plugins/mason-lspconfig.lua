return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    -- LSP settings.
    local on_attach = function(client, bufnr)
      -- Create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end
        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      -- Create a function that lets us more easily define mappings specific
      -- for LSP related items in normal and visual mode.
      local nvmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end
        vim.keymap.set({'n', 'v'}, keys, func, { buffer = bufnr, desc = desc })
      end

      -- LSP keymaps
      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nvmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      nmap('gd', function()
        require('telescope.builtin').lsp_definitions({
          initial_mode = "normal",
          layout_config = {
            prompt_position = "top",
          },
        })
      end, '[G]oto [D]efinition')
      nmap('gr', function()
        require('telescope.builtin').lsp_references({
          initial_mode = "normal",
          layout_config = {
            prompt_position = "top",
          },
        })
      end, '[G]oto [R]eferences')
      nmap('gI', function()
        require('telescope.builtin').lsp_implementations({
          initial_mode = "normal",
          layout_config = {
            prompt_position = "top",
          },
        })
      end, '[G]oto [I]mplementation')
      nmap('<leader>D', function()
        require('telescope.builtin').lsp_type_definitions({
          initial_mode = "normal",
          layout_config = {
            prompt_position = "top",
          },
        })
      end, 'Type [D]efinition')
      nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

      -- Show inline diagnostic error or message
      nmap('<leader>d', vim.diagnostic.open_float, '[D]iagnostics')

      -- Lesser used LSP functionality
      nmap('gD', function()
        require('telescope.builtin').lsp_declarations({
          initial_mode = "normal",
          layout_config = {
            prompt_position = "top",
          },
        })
      end, '[G]oto [D]eclaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })

      -- Add format keybinding
      nmap('<leader>F', ':Format<CR>', '[F]ormat buffer')

      -- Special handling for Svelte
      if client.name == "svelte" then
        vim.api.nvim_create_autocmd("BufWritePost", {
          pattern = { "*.js", "*.ts" },
          group = vim.api.nvim_create_augroup("svelte_ondidchangetsorjsfile", { clear = true }),
          callback = function(ctx)
            client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
          end,
        })
      end
    end

    -- Enable the following language servers
    local servers = {
      lua_ls = {},
      rust_analyzer = {},
      vtsls = {},
      gopls = {},
      golangci_lint_ls = {},
      pyright = {},
      tailwindcss = {},
      cssls = {},
      css_variables = {},
      dockerls = {},
      html = {},
      eslint = {},
      jsonls = {},
      somesass_ls = {},
      sqlls = {},
      svelte = {},
      angularls = {},
      diagnosticls = {},
    }

    -- Setup mason
    require('mason').setup()

    -- Setup mason-lspconfig
    require('mason-lspconfig').setup({
      ensure_installed = vim.tbl_keys(servers),
      automatic_installation = true,
    })

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Setup each server
    for server_name, server_config in pairs(servers) do
      vim.lsp.config(server_name, {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = server_config,
      })

      vim.lsp.enable({ server_name })
    end
  end
}
