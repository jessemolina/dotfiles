-- Plugins
local plugins = {
  { import = 'plugins.editor' },
  { import = 'plugins.lang' },
  { import = 'plugins.tools' },
  { import = 'plugins.ui' },
}

-- Options
local opts = {}

-- Setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins, opts)
