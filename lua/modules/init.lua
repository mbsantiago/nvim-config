local function conf(name)
  return require(string.format("modules.config.%s", name))
end

local plugins = {
  {
    "themercorp/themer.lua",
    config = conf("themer"),
  },
  { -- HTML
    "windwp/nvim-ts-autotag",
    config = conf("nvim-ts-autotag"),
  },
  { -- Treesiter
    "nvim-treesitter/nvim-treesitter",
    config = conf("nvim-treesitter"),
    requires = {
      "nvim-treesitter/playground",
      "p00f/nvim-ts-rainbow",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "David-Kunz/treesitter-unit",
      "lewis6991/spellsitter.nvim",
    },
  },
  { -- fzf wrapper
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  },
  { -- Fuzzy finder tools
    "tzachar/fuzzy.nvim",
    requires = { "nvim-telescope/telescope-fzf-native.nvim" },
  },
  { -- Finder
    "nvim-telescope/telescope.nvim",
    config = conf("telescope"),
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "stevearc/dressing.nvim",
    },
  },
  { -- Icons
    "kyazdani42/nvim-web-devicons",
    config = conf("nvim-web-devicons"),
  },
  { -- Lsp
    "neovim/nvim-lspconfig",
    config = conf("lsp"),
    requires = {
      "tjdevries/lsp_extensions.nvim",
      "folke/trouble.nvim",
      "ray-x/lsp_signature.nvim",
      "tami5/lspsaga.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "jose-elias-alvarez/null-ls.nvim",
      "williamboman/nvim-lsp-installer",
      "onsails/lspkind-nvim",
    },
  },
  { -- Autocompletion plugin
    "hrsh7th/nvim-cmp",
    config = conf("nvim-cmp"),
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "tzachar/cmp-fuzzy-buffer",
      "tzachar/cmp-fuzzy-path",
    },
  },
  { -- Snippets
    "L3MON4D3/LuaSnip",
    config = conf("luasnip"),
    requires = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  { -- Bufferline / tabs
    "akinsho/bufferline.nvim",
    config = conf("nvim-bufferline"),
  },
  { -- LSP status in status bar
    "arkav/lualine-lsp-progress",
  },
  { -- Status line
    "nvim-lualine/lualine.nvim",
    config = conf("lualine"),
  },
  { -- File tree
    "kyazdani42/nvim-tree.lua",
    config = conf("nvim-tree"),
  },
  { -- Comments
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  { -- Make folds prettier
    "anuvyklack/pretty-fold.nvim",
    config = conf("pretty-fold"),
    requires = {
      "anuvyklack/nvim-keymap-amend",
    },
  },
  { -- Notes
    "renerocksai/telekasten.nvim",
    config = conf("notes"),
    requires = {
      "renerocksai/calendar-vim",
    },
  },
  { -- Markdown
    "mzlogin/vim-markdown-toc",
    "vim-pandoc/vim-pandoc-syntax",
    "vim-pandoc/vim-pandoc",
    "davidgranstrom/nvim-markdown-preview",
    config = conf("markdown"),
  },
  { -- Tag Bar
    "majutsushi/tagbar",
    requires = {
      "ludovicchabant/vim-gutentags",
    },
  },
  { -- Terminal Support / Multiple terminal
    "akinsho/toggleterm.nvim",
    config = conf("toggleterm"),
  },
  { -- Git integration
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = conf("gitsigns"),
  },
  { -- Latex plugins
    "lervag/vimtex",
    config = conf("vimtex"),
  },
  { -- Python indentation
    "Vimjas/vim-python-pep8-indent",
  },
  { -- Python folding
    "tmhedberg/simpylfold",
    config = conf("simpylfold"),
  },
  { -- Writing utilities
    "ron89/thesaurus_query.vim", -- Thesaurus
    "voldikss/vim-translator", -- Translator
    config = conf("writing"),
  },
  { -- Tim pope plugins
    "tpope/vim-surround",
    "tpope/vim-unimpaired",
    "tpope/vim-dispatch",
  },
  { -- See the Undo Tree
    "mbbill/undotree",
  },
  { -- Start
    "goolord/alpha-nvim",
    config = conf("alpha-nvim"),
  },
  { -- Autopairs
    "windwp/nvim-autopairs",
    config = conf("nvim-autopairs"),
  },
  { -- Cursor line
    "Hrle97/nvim-cursorline",
    branch = "feature/disable-conditionally",
    config = conf("nvim-cursorline"),
  },
  { -- Colorizer
    "norcalli/nvim-colorizer.lua",
    config = conf("nvim-colorizer"),
  },
  { -- Motion plugin
    "phaazon/hop.nvim",
    config = function()
      require("hop").setup()
    end,
  },
  { -- Indentation guide lines
    "lukas-reineke/indent-blankline.nvim",
    config = conf("indent-blankline"),
  },
  { -- Multiple cursors
    "mg979/vim-visual-multi",
  },
  { -- Zen Mode
    "folke/zen-mode.nvim",
    "folke/twilight.nvim",
    config = conf("zen-mode"),
  },
  { -- Run snippets of code
    "michaelb/sniprun",
    run = "bash ./install.sh",
    config = conf("sniprun"),
  },
  { -- Run python code in remote IPython kernel
    "dccsillag/magma-nvim",
    run = ":UpdateRemotePlugins",
    config = conf("magma-nvim"),
  },
  { -- Notifications
    "rcarriga/nvim-notify",
    config = conf("nvim-notify"),
  },
  { -- R support
    "jalvesaq/Nvim-R",
    branch = "stable",
    config = conf("nvim-r"),
  },
  { -- Keymap finder
    "mrjones2014/legendary.nvim",
  },
  { -- Keymap menu
    "folke/which-key.nvim",
    config = conf("which-key"),
  },
  { -- Project Management
    "ahmedkhalf/project.nvim",
    config = conf("project"),
  },
  { -- Testing
    "rcarriga/vim-ultest",
    requires = { "vim-test/vim-test" },
    run = ":UpdateRemotePlugins",
    config = conf("vim-test"),
  },
  { -- Debugging
    "mfussenegger/nvim-dap",
    requires = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
      "mfussenegger/nvim-dap-python",
    },
    config = conf("nvim-dap"),
  },
  {
    "mattn/emmet-vim",
  },
  { -- Symbols bar
    "simrat39/symbols-outline.nvim",
  },
}

local M = {}

function M:setup()
  local install_path = vim.fn.stdpath("data")
    .. "/site/pack/packer/start/packer.nvim"
  local compile_path = vim.fn.stdpath("data")
    .. "/site/plugin/packer_compiled.lua"
  local package_root = vim.fn.stdpath("data") .. "/site/pack"

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd("packadd packer.nvim")
  end

  local ok, packer = pcall(require, "packer")

  if not ok then
    return
  end

  packer.init({
    compile_path = compile_path,
    package_root = package_root,
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "rounded" })
      end,
    },
  })

  return packer.startup(function(use)
    use("wbthomason/packer.nvim")
    for _, plugin in ipairs(plugins) do
      use(plugin)
    end
  end)
end

return M
