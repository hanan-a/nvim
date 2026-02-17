return {
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  opts = {},
  config = function(_, opts)
    require("mason").setup(opts)

    local ensure_installed = {
      "js-debug-adapter",
    }

    local registry = require("mason-registry")
    registry.refresh(function()
      for _, name in ipairs(ensure_installed) do
        local ok, pkg = pcall(registry.get_package, name)
        if ok and not pkg:is_installed() then
          pkg:install()
        end
      end
    end)
  end,
}
