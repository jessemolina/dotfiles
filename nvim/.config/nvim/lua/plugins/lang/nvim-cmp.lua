local languages = require("config.languages")

return {
  "hrsh7th/nvim-cmp", -- Autocompletion engine
  event = "InsertEnter",
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-calc" },
    { "hrsh7th/cmp-emoji" },
    { "ray-x/cmp-treesitter" },
    { "L3MON4D3/LuaSnip" },
    { "saadparwaiz1/cmp_luasnip" },
    { "kdheepak/cmp-latex-symbols" },
    { "jmbuhr/cmp-pandoc-references" },
    { "rafamadriz/friendly-snippets" },
    { "onsails/lspkind-nvim" },
  },
  config = function()
    -- See `:help cmp`
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      completion = { completeopt = "menu,menuone,noinsert" },

      mapping = cmp.mapping.preset.insert({
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),

        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-p>"] = cmp.mapping.scroll_docs(4),

        ["<C-y>"] = cmp.mapping.confirm({ select = true }),

        ["<C-Space>"] = cmp.mapping.complete({}),

        ["<C-l>"] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { "i", "s" }),
        ["<C-h>"] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { "i", "s" }),
      }),
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "path" },
        { name = "vim-dadbod-completion" },
        { name = "buffer", keyword_length = 5, max_item_count = 3 },
        { name = "spell" },
        { name = "treesitter", keyword_length = 5, max_item_count = 3 },
        { name = "calc" },
        { name = "latex_symbols" },
        { name = "emoji" },
      },
    })
  end,
}
