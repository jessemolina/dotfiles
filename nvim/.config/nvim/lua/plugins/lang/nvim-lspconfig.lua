local languages = require("config.languages")

return {
  "neovim/nvim-lspconfig",   -- Configure LSP use with neovim
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "nvimtools/none-ls.nvim",

    { 'folke/neodev.nvim', opts = {} },
  },
  config = function()
    -- FIX: Determine if snippets should be done via cmp_nvim_lsp
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    for _, config in pairs(languages) do
      if config.lsp then
        require('lspconfig')[config.lsp].setup({
          capabilities = capabilities
        })
      end
    end
  end

}
