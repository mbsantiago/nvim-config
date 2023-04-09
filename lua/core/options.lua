local o = vim.opt

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
o.background = ""

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
o.completeopt = "menu,menuone,preview,noselect"
o.pumblend = 10 -- Popup menu transparency
o.pumheight = 8 -- Popup menu height

-- General
o.clipboard = "unnamedplus"
o.hidden = true
o.joinspaces = false
o.mouse = "a"
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

-- -- Listchars
vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")

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
      c = false,
      o = false, -- O and o, don't continue comments
      r = true, -- Pressing Enter will continue comments
    }

-- Mapleader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Remove builtin plugins
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_zipPlugin = 0
-- vim.g.loaded_zip = 0

-- Python
vim.g.python3_host_prog =
"/home/santiago/Software/vendor/miniconda3/envs/nvim/bin/python"

-- Translation
vim.g.translator_target_lang = "en"
vim.g.translator_source_lang = "es"
