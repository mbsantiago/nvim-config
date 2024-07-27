local o = vim.opt

o.wrap = true
o.linebreak = true
o.conceallevel = 2
o.sidescroll = 5
o.formatoptions = o.formatoptions + { t = true, l = true }

vim.api.nvim_set_keymap("n", "k", "gk", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "j", "gj", { noremap = true, silent = true })
