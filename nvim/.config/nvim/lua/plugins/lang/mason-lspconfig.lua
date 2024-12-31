local languages = require("config.languages")


local function is_nixos()
  local handle = io.popen("grep -qi nixos /etc/os-release && echo 'true' || echo 'false'")
  local result = handle:read("*a")
  handle:close()
  return result:find("true") ~= nil
end

return {
  "williamboman/mason-lspconfig.nvim", -- Ensure defined LSP server installation
  config = function()

    if is_nixos() then
      -- Skip LSP installation via Mason on NixOS
      print("Detected NixOS: Skipping Mason LSP installation")
    return

    end
    local ensure_installed = {}
    for _, config in pairs(languages) do
      if config.lsp then
        table.insert(ensure_installed, config.lsp)
      end
    end
    require("mason-lspconfig").setup({
      ensure_installed = ensure_installed,
    })
  end
}
