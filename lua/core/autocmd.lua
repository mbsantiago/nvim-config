vim.cmd([[
    augroup ftplugin
      au!
      au BufWinEnter * set formatoptions-=cro
      au TermOpen term://* setl nornu nonu nocul so=0 scl=no
    augroup END

    augroup highlight_yank
      au!
      au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 150 }
    augroup END
]])
