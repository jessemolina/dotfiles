return {
  "nvim-telescope/telescope-ui-select.nvim", -- Set vim ui select to telescope
  config = function()
    require("telescope").setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })
  end,
}
