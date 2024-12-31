return {
  "folke/which-key.nvim",   -- Display available keybinds per initialized key commands
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    local presets = require("which-key.plugins.presets")
    presets.operators["c"] = nil
  end,
  opts = {
    preset = "helix"
  },
}
