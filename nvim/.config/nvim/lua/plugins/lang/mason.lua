return {
  "williamboman/mason.nvim",   -- Easily manage and install LSP servers
  config = function()
    require("mason").setup({
      PATH = "append",
    })
  end
}
