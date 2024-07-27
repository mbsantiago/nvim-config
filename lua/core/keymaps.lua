-- Window movement
vim.api.nvim_set_keymap(
  "n",
  "<C-J>",
  "<C-W><C-J>",
  { noremap = true, silent = true, desc = "Move window down" }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-K>",
  "<C-W><C-K>",
  { noremap = true, silent = true, desc = "Move window up" }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-L>",
  "<C-W><C-L>",
  { noremap = true, silent = true, desc = "Move window right" }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-H>",
  "<C-W><C-H>",
  { noremap = true, silent = true, desc = "Move window left" }
)

-- Window resize
vim.api.nvim_set_keymap(
  "n",
  "<C-Up>",
  ":resize -2<CR>",
  { noremap = true, silent = true, desc = "Resize window up" }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-Down>",
  ":resize +2<CR>",
  { noremap = true, silent = true, desc = "Resize window down" }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-Left>",
  ":vertical resize -2<CR>",
  { noremap = true, silent = true, desc = "Resize window left" }
)
vim.api.nvim_set_keymap(
  "n",
  "<C-Right>",
  ":vertical resize +2<CR>",
  { noremap = true, silent = true, desc = "Resize window right" }
)

vim.api.nvim_set_keymap(
  "v",
  "p",
  '"_dP',
  { noremap = true, silent = true, desc = "Paste from clipboard" }
)

-- Spelling
vim.api.nvim_set_keymap(
  "n",
  "<leader>we",
  ":set spell<CR>",
  { noremap = true, silent = true, desc = "Enable spell check" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>wd",
  ":set nospell<CR>",
  { noremap = true, silent = true, desc = "Disable spell check" }
)

vim.api.nvim_set_keymap(
  "t",
  "<Esc>",
  "<C-\\><C-n>",
  { noremap = true, silent = true, desc = "Interrupt command in terminal" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>wh",
  ":nohlsearch<CR>",
  { noremap = true, silent = true, desc = "No highlight" }
)

-- Make sure wqa does not trigger dumb term error
vim.cmd([[
command Z wa | qa
cabbrev wqa Z
]])
