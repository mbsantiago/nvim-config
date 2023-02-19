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

-- Move text up and down
vim.api.nvim_set_keymap(
  "n",
  "<A-j>",
  "<Esc>:m .+1<CR>==gi",
  { noremap = true, silent = true, desc = "Move line down" }
)
vim.api.nvim_set_keymap(
  "n",
  "<A-k>",
  "<Esc>:m .-2<CR>==gi",
  { noremap = true, silent = true, desc = "Move line up" }
)
vim.api.nvim_set_keymap(
  "v",
  "<A-j>",
  ":m .+1<CR>==",
  { noremap = true, silent = true, desc = "Move line down" }
)
vim.api.nvim_set_keymap(
  "v",
  "<A-k>",
  ":m .-2<CR>==",
  { noremap = true, silent = true, desc = "Move line up" }
)
vim.api.nvim_set_keymap(
  "v",
  "p",
  '"_dP',
  { noremap = true, silent = true, desc = "Paste from clipboard" }
)
-- Visual Block --

-- Move text up and down
vim.api.nvim_set_keymap(
  "x",
  "J",
  ":move '>+1<CR>gv-gv",
  { noremap = true, silent = true, desc = "Move line down" }
)
vim.api.nvim_set_keymap(
  "x",
  "K",
  ":move '<-2<CR>gv-gv",
  { noremap = true, silent = true, desc = "Move line up" }
)
vim.api.nvim_set_keymap(
  "x",
  "<A-j>",
  ":move '>+1<CR>gv-gv",
  { noremap = true, silent = true, desc = "Move line down" }
)
vim.api.nvim_set_keymap(
  "x",
  "<A-k>",
  ":move '<-2<CR>gv-gv",
  { noremap = true, silent = true, desc = "Move line up" }
)

-- Search
vim.api.nvim_set_keymap(
  "n",
  "<leader>ch",
  ":noh<CR>",
  { noremap = true, silent = true, desc = "Clear search highlight" }
)

-- Spelling
vim.api.nvim_set_keymap(
  "n",
  "<leader>sp",
  ":set spell<CR>",
  { noremap = true, silent = true, desc = "Enable spell check" }
)

vim.api.nvim_set_keymap(
  "n",
  "<leader>nsp",
  ":set nospell<CR>",
  { noremap = true, silent = true, desc = "Disable spell check" }
)

vim.api.nvim_set_keymap(
  "t",
  "<Esc>",
  "<C-\\><C-n>",
  { noremap = true, silent = true, desc = "Interrupt command in terminal" }
)

-- Special files
vim.api.nvim_set_keymap(
  "n",
  "<leader>vrc",
  ":vsp $MYVIMRC<CR>",
  { noremap = true, silent = true, desc = "Go to vimrc" }
)
