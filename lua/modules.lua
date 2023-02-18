local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Load lazy nvim if it's not already installed
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- Add lazy nvim to the runtime path
vim.opt.rtp:prepend(lazypath)

-- Initialize lazy nvim and load plugins
require("lazy").setup("plugins")
