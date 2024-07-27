local o = vim.opt

o.tabstop = 2
o.shiftwidth = 2
o.wrap = true
o.sidescroll = 5

vim.cmd([[
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
]])
