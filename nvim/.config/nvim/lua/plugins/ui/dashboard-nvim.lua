return {
  "nvimdev/dashboard-nvim", -- Startup dashboard
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {
          "                                   ",
          "  ██████╗  ██████╗      ██╗ ██████╗ ███████╗ ",
          "  ╚════██╗██╔═══██╗     ██║██╔═══██╗██╔════╝ ",
          "   █████╔╝██║   ██║     ██║██║   ██║███████╗ ",
          "   ╚═══██╗██║   ██║██   ██║██║   ██║╚════██║ ",
          "  ██████╔╝╚██████╔╝╚█████╔╝╚██████╔╝███████║ ",
          "  ╚═════╝  ╚═════╝  ╚════╝  ╚═════╝ ╚══════╝ ",
          "                                   ",
        },
        center = {
          { desc = "Configs", key = "c", action = "lua vim.cmd('cd ~/lab/github/jessemolina/dotfiles'); require('telescope.builtin').find_files()" },
          { desc = "Files", key = "f", action = "Telescope find_files" },
          { desc = "Lab", key = "l", action = "lua require('telescope.builtin').find_files({cwd='~/lab/github/jessemolina', find_command={'find', '.', '-maxdepth', '1', '-type', 'd', '!', '-path', '.', '-printf', '%P\\n'}, attach_mappings=function(_, map) map('i', '<CR>', function(prompt_bufnr) local selection = require('telescope.actions.state').get_selected_entry() require('telescope.actions').close(prompt_bufnr) local dir = '~/lab/github/jessemolina/' .. selection.value vim.cmd('cd ' .. dir) require('telescope.builtin').find_files() end) return true end})" },
          { desc = "Notes", key = "n", action = "ObsidianToday" },
          { desc = "Recent", key = "r", action = "Telescope oldfiles" },
          { desc = "Update", key = "u", action = "Lazy update" },
          { desc = "Work", key = "w", action = "lua require('telescope.builtin').find_files({cwd='~/lab/github/mentaurolabs', find_command={'find', '.', '-maxdepth', '1', '-type', 'd', '!', '-path', '.', '-printf', '%P\\n'}, attach_mappings=function(_, map) map('i', '<CR>', function(prompt_bufnr) local selection = require('telescope.actions.state').get_selected_entry() require('telescope.actions').close(prompt_bufnr) local dir = '~/lab/github/mentaurolabs/' .. selection.value vim.cmd('cd ' .. dir) require('telescope.builtin').find_files() end) return true end})" },
        },
        footer = function()
          local quotes = {
            "gaze into the iris",
            "experience tranquility", 
            "true self is without form",
            "peace be upon you",
            "adversity is an opportunity for change",
            "overconfidence is a flawed strategy",
            "walk in harmony",
            "pain is an excellent teacher"
          }
          return { quotes[math.random(#quotes)] }
        end,
        vertical_center = true
      },
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
