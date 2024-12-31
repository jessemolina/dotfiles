return {
	require("plugins.lang.go"), -- Go development plugin
	require("plugins.lang.mason-lspconfig"), -- Ensure defined LSP server installation
	require("plugins.lang.mason-null-ls"), -- Ensure defined formatters installation
	require("plugins.lang.mason"), -- Easily manage and install LSP servers
	require("plugins.lang.none-ls"), -- Inject LSP diagnostic, code actions, and more
	require("plugins.lang.nvim-cmp"), -- Autocompletion engine
	require("plugins.lang.nvim-lspconfig"), -- Configure LSP use with neovim
	require("plugins.lang.nvim-treesitter"), -- Enable enhanced syntax highlighting
	require("plugins.lang.rustaceanvim"), -- Rust development plugin 
}
