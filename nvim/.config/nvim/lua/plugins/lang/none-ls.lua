local languages = require("config.languages")

return {
  "nvimtools/none-ls.nvim",   -- Inject LSP diagnostic, code actions, and more
  config = function()
    local null_ls = require("null-ls")
    for _, config in pairs(languages) do
      if config.formatter then
        null_ls.setup({
          sources = {
            null_ls.builtins.formatting[config.formatter]
          }
        })
      end
    end
  end
}
