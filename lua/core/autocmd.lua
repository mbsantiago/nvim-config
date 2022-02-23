vim.cmd([[
    augroup ftplugin
      au!
      au BufWinEnter * set formatoptions-=cro
      au FileType man setl laststatus=0 noruler
      au FileType markdown setl wrap linebreak conceallevel=2
      au FileType vim,html,css,json,javascript,javascriptreact,typescript,typescriptreact,lua,sh,zsh setl sw=2
      au TermOpen term://* setl nornu nonu nocul so=0 scl=no
    augroup END

    augroup highlight_yank
      au!
      au TextYankPost * silent! lua vim.highlight.on_yank { timeout = 150 }
    augroup END

    augroup packer_user_config
      autocmd!
      autocmd BufWritePost init.lua source <afile> | PackerCompile
    augroup end
]])
