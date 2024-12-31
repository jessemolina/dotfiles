local languages = {
  go = {
    lsp = "gopls",
    formatter = "gofumpt",
    snippets = true
  },

  lua = {
    lsp = "lua-language-server",
    formatter = "stylua",
  },

  java = {
    lsp = "jdtls",
  },

  rust = {
    lsp = "rust_analyzer",
    snippets = true
  },

  -- python = {
  --   lsp = "pyright",
  --   snipets = true
  -- },

  -- json = {
  --   lsp = "jsonls"
  -- },

  -- yaml = {
  --   lsp = "yamlls"
  -- },

  markdown = {
    lsp = "marksman"
  },

  markdown_inline = {
    treesitter = true
  },

  -- ansible = {
  --   lsp = "ansiblels",
  --   treesitter = false
  -- },

  terraform = {
    lsp = "terraformls"
  },

}

return languages
