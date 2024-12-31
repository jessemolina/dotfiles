return {
  "kristijanhusak/vim-dadbod-ui", -- Database management interface
  dependencies = {
    {
      "tpope/vim-dadbod",
      lazy = true,
    },
    {
      "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "mysql", "plsql", "pgsql" },
      lazy = true,
    },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_table_helpers = {
      postgresql = {
        List = 'select * from "{table}" order by id asc',
      },
    }
    vim.g.db_ui_auto_execute_table_helpers = 1
  end,
}
