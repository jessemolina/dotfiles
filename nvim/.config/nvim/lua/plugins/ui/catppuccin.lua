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
      custom_highlights = function(colors)
        return {
          -- Markdown code blocks use original catppuccin base
          ["@markup.raw.block.markdown"] = { bg = "#1e1e2e" },
          ["@markup.raw.markdown"] = { bg = "#1e1e2e" },
          
          -- render-markdown.nvim highlights
          RenderMarkdownCode = { bg = "#1e1e2e" },
          RenderMarkdownCodeInline = { bg = colors.surface0, fg = colors.text },
          RenderMarkdownBullet = { fg = colors.blue },
          RenderMarkdownDash = { fg = colors.surface2 },
          RenderMarkdownUnchecked = { fg = colors.overlay0 },
          RenderMarkdownChecked = { fg = colors.green },
          RenderMarkdownTodo = { fg = colors.yellow },
          RenderMarkdownTableHead = { bg = colors.surface0 },
          RenderMarkdownTableRow = { bg = colors.mantle },
          RenderMarkdownTableFill = { bg = colors.surface0 },
          
          -- Fix nvim-notify highlights
          NotifyBackground = { bg = colors.base },
          NotifyERRORBorder = { fg = colors.red },
          NotifyWARNBorder = { fg = colors.yellow },
          NotifyINFOBorder = { fg = colors.blue },
          NotifyDEBUGBorder = { fg = colors.surface2 },
          NotifyTRACEBorder = { fg = colors.mauve },
        }
      end,
    })
  end,
}
-- return {
--   "catppuccin/nvim",
--   name = "catppuccin‑pulse",
--   priority = 1000,
--
--   config = function()
--     require("catppuccin").setup({
--       flavour = "mocha",
--
--       -- map the five swatches onto Catppuccin’s logical slots
--       color_overrides = {
--         mocha = {
--           -- backgrounds
--           base   = "#141414", -- Eclipse Frame
--           mantle = "#141414",
--           crust  = "#000000",
--
--           -- foreground
--           text = "#FFFFFF",   -- Celestial
--
--           -- accents
--           red   = "#E53859",  -- Pulse Horizon
--           pink  = "#E53859",
--           maroon= "#E53859",
--
--           green = "#6EE48E",  -- Signal Root
--           teal  = "#6EE48E",
--
--           blue      = "#4776D2", -- Core Vector
--           sapphire  = "#4776D2",
--           lavender  = "#4776D2",
--         },
--       },
--     })
--
--     vim.cmd.colorscheme("catppuccin")
--   end,
-- }
