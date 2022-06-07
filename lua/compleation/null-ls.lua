require"null-ls".setup({
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
