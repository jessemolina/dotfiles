return {
  "catppuccin/nvim", -- Pastel colors, balanced between low and high contrast
  name = "catppuccin",
  priority = 1000,
  init = function()
    vim.cmd.colorscheme("catppuccin")
  end,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      color_overrides = {
        mocha = {
          base = "#000000",
          mante = "#000000",
          crust = "#000000",
        },
      },
    })
  end,
}
