local languages = require("config.languages")

return {
  "nvim-treesitter/nvim-treesitter",   -- Enable enhanced syntax highlighting
  build = ":TSUpdate",
  config = function()
    local ensure_installed = {}
    for lang, config in pairs(languages) do
      if config.treesitter ~= false then
        table.insert(ensure_installed, lang)
      end
    end
    require("nvim-treesitter.configs").setup({
      ensure_installed = ensure_installed,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
