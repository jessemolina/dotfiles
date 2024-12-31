return {
  "nvim-lualine/lualine.nvim", -- Status line
  requires = { "nvim-tree/nvim-web-devicons", opt = true },
  init = function()
    require("lualine").setup({
      options = { section_separators = "", component_separators = "" },
    })
  end,
}
