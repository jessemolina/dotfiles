return {
  "nvim-telescope/telescope.nvim", -- Highly extendable fuzzy finder
  branch = "0.1.x",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")
    local themes = require("telescope.themes")

    -- Retrieve the ivy theme settings
    local ivy_theme = themes.get_ivy()

    -- Merge ivy theme settings into defaults
    telescope.setup({
      defaults = vim.tbl_extend("force", ivy_theme, {
        -- You can add other default configurations here
      }),
      pickers = {
        find_files = {
          hidden = true, -- Specific configuration for find_files picker
        },
      },
    })
  end,
}
