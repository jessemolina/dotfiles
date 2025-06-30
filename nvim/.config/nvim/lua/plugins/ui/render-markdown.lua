return {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    code = {
      -- Style code blocks with catppuccin base background
      style = "full",
      position = "left",
      language_pad = 0,
      disable_background = { "diff" },
      width = "full",
      left_pad = 2,
      right_pad = 2,
      min_width = 0,
      border = "thin",
      above = "▄",
      below = "▀",
      highlight = "RenderMarkdownCode",
      highlight_inline = "RenderMarkdownCodeInline",
    },
    heading = {
      -- Keep # symbols for headings
      enabled = true,
      sign = false,
      position = "overlay",
      icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
      width = "full",
      backgrounds = {
        "RenderMarkdownH1Bg",
        "RenderMarkdownH2Bg",
        "RenderMarkdownH3Bg",
        "RenderMarkdownH4Bg",
        "RenderMarkdownH5Bg",
        "RenderMarkdownH6Bg",
      },
      foregrounds = {
        "RenderMarkdownH1",
        "RenderMarkdownH2", 
        "RenderMarkdownH3",
        "RenderMarkdownH4",
        "RenderMarkdownH5",
        "RenderMarkdownH6",
      },
    },
    dash = {
      -- Style horizontal rules
      enabled = true,
      icon = "─",
      width = "full",
      highlight = "RenderMarkdownDash",
    },
    bullet = {
      -- Style list bullets
      enabled = true,
      icons = { "●", "○", "◆", "◇" },
      left_pad = 0,
      right_pad = 0,
      highlight = "RenderMarkdownBullet",
    },
    checkbox = {
      -- Style checkboxes
      enabled = true,
      position = "overlay",
      unchecked = {
        icon = "󰄱 ",
        highlight = "RenderMarkdownUnchecked",
      },
      checked = {
        icon = "󰱒 ", 
        highlight = "RenderMarkdownChecked",
      },
      custom = {
        todo = { raw = "[-]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo" },
      },
    },
    pipe_table = {
      -- Style tables
      enabled = true,
      style = "full",
      cell = "padded",
      min_width = 0,
      border = {
        "┌", "┬", "┐",
        "├", "┼", "┤", 
        "└", "┴", "┘",
        "│", "─",
      },
      alignment_indicator = "━",
      head = "RenderMarkdownTableHead",
      row = "RenderMarkdownTableRow",
      filler = "RenderMarkdownTableFill",
    },
    -- Only render in markdown files
    file_types = { "markdown" },
    -- Don't render in certain contexts
    render_modes = { "n", "c", "t" },
    -- Anti-conceal setup
    anti_conceal = {
      enabled = true,
    },
  },
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" },
  ft = { "markdown" },
}