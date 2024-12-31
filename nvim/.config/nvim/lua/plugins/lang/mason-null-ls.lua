local languages = require("config.languages")

return {
  "jay-babu/mason-null-ls.nvim",   -- Ensure defined formatters installation
  config = function()
    local ensure_installed = {}
    for _, config in pairs(languages) do
      if config.formatter then
        table.insert(ensure_installed, config.formatter)
      end
    end
    require("mason-null-ls").setup({
      ensure_installed = ensure_installed
    })
  end
}
