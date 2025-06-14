local o = vim.opt

vim.cmd("set shell=/bin/bash")
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")
vim.cmd("syntax enable")

o.encoding = "utf-8"

-- Local/per project configuration
o.exrc = true
o.secure = true

-- Appearance
o.cmdheight = 1
o.colorcolumn = "80"
o.cursorline = true
o.number = true
o.relativenumber = true
o.ruler = false
o.showmode = false
o.signcolumn = "yes"
o.termguicolors = true
o.wrap = false
o.showmatch = true
o.guicursor = ""

-- Folding
o.foldcolumn = "1"
o.foldlevel = 99
o.foldlevelstart = 99
o.foldenable = true
o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

-- Backups
o.backup = false
o.writebackup = false
o.swapfile = false
o.autoread = true -- Automatically read a file when it has been changed from outside vim
o.undofile = true

-- Completion
o.complete = ""
o.completeopt = "menu,menuone,preview,noselect"
o.pumblend = 10 -- Popup menu transparency
o.pumheight = 8 -- Popup menu height

-- General
o.clipboard = "unnamedplus"
o.hidden = true
o.joinspaces = false
o.mouse = "a"
o.mousemoveevent = true
o.scrolloff = 8
o.sidescrolloff = 8
o.splitbelow = true
o.splitright = true
o.timeoutlen = 300
o.updatetime = 100
o.virtualedit = "block"
o.iskeyword = o.iskeyword + "-"
o.errorbells = false
o.fileformat = "unix"

o.confirm = false

-- -- Listchars
vim.opt.list = true

-- Performance
o.lazyredraw = false

-- Search
o.inccommand = "nosplit" -- show substitutions incrementally
o.ignorecase = true
o.smartcase = true
o.wildignore = { ".git/*", "node_modules/*" }
o.wildignorecase = true
o.incsearch = true
o.hlsearch = true

-- Indent
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = 4
o.expandtab = true

o.smartindent = true
-- o.autoindent = true
o.cindent = true
o.breakindent = true

o.linebreak = true
o.showbreak = string.rep(" ", 3)

-- Shortmess
o.shortmess = o.shortmess
  + {
    A = true, -- don't give the "ATTENTION" message when an existing swap file is found.
    I = true, -- don't give the intro message when starting Vim |:intro|.
    W = true, -- don't give "written" or "[w]" when writing a file
    c = true, -- don't give |ins-completion-menu| messages
    m = true, -- use "[+]" instead of "[Modified]"
  }

-- Format options
o.formatoptions = o.formatoptions
  + {
    q = true,
    c = true,
    o = false, -- O and o, don't continue comments
    r = true, -- Pressing Enter will continue comments
    t = true,
    n = true,
  }

-- o.shada = "'1000,<50,s10,h,n$XDG_STATE_HOME/vim/viminfo"

-- Mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Remove builtin plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Python
vim.g.python3_host_prog = "$XDG_DATA_HOME/nvim/venv/bin/python"

-- Translation
vim.g.translator_target_lang = "en"
vim.g.translator_source_lang = "es"

-- Diagnostic signs
vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    texthl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticError",
      [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticHint",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticError",
      [vim.diagnostic.severity.WARN] = "DiagnosticWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticInfo",
      [vim.diagnostic.severity.HINT] = "DiagnosticHint",
    },
  },
})

-- Ruby
vim.g.ruby_host_prog = "rvm system do neovim-ruby-host"

-- Perl
vim.g.perl_host_prog = "/usr/bin/perl"
