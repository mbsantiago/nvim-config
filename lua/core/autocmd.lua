vim.api.nvim_create_autocmd("BufWinEnter", {
  desc = "Set formatoptions",
  group = vim.api.nvim_create_augroup("ftplugin", { clear = true }),
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Set terminal options",
  group = vim.api.nvim_create_augroup("ftplugin", { clear = true }),
  pattern = "term://*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.cursorline = false
    vim.opt_local.scrolloff = 0
    vim.opt_local.scrollbind = false
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("vertical-help", { clear = true }),
  pattern = { "man", "help" },
  callback = function()
    vim.cmd("wincmd L")
  end,
})

vim.api.nvim_create_autocmd({
  "BufNewFile",
  "BufRead",
}, {
  pattern = "*.typ",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_buf_set_option(buf, "filetype", "typst")
  end,
})
