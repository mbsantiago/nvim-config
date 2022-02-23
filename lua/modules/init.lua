local function conf(name)
  return require(string.format("modules.config.%s", name))
end

local plugins = {
  { -- Colorschemes
    "folke/tokyonight.nvim",
    "olimorris/onedarkpro.nvim",
    "EdenEast/nightfox.nvim",
    "Mofiqul/vscode.nvim",
    "morhetz/gruvbox",
    "preservim/vim-colors-pencil",
    "rafamadriz/neon",
    "sainnhe/sonokai",
    "savq/melange",
    "shaunsingh/nord.nvim",
    "tjdevries/colorbuddy.nvim",
    { "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } },
  },
  {
    "themercorp/themer.lua",
    config = conf("themer"),
  },
  { -- Treesiter
    "nvim-treesitter/nvim-treesitter",
    config = conf("nvim-treesitter"),
    requires = {
      "nvim-treesitter/playground",
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "lewis6991/spellsitter.nvim",
    },
  },
  { -- Finder
    "nvim-telescope/telescope.nvim",
    config = conf("telescope"),
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-fzy-native.nvim",
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
      "nvim-lua/lsp-status.nvim",
      "tjdevries/lsp_extensions.nvim",
      "tjdevries/nlua.nvim",
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
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
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
  },
  { -- Orgmode for agenda and todos
    "nvim-orgmode/orgmode",
    config = conf("org-mode"),
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
    { "iamcco/markdown-preview.nvim", run = "cd app && yarn install" },
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
  { -- Get a minimap of the current buffer
    "wfxr/minimap.vim",
  },
  { -- Align tables
    "godlygeek/tabular",
  },
  { -- Start
    "goolord/alpha-nvim",
    config = conf("alpha-nvim"),
  },
  { -- Load custom configurations from local directories
    "klen/nvim-config-local",
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
  { -- Optimizations
    "dstein64/vim-startuptime",
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
  { -- Keymap menu
    "folke/which-key.nvim",
    config = conf("which-key"),
  },
  { -- Project Management
    "ahmedkhalf/project.nvim",
    config = conf("project"),
  },
  { -- Game to train vim motions
    "ThePrimeagen/vim-be-good",
  },
  { -- Testing
    "rcarriga/vim-ultest",
    requires = { "vim-test/vim-test" },
    run = ":UpdateRemotePlugins",
    config = conf("vim-test"),
  },
  { -- HTML
    "windwp/nvim-ts-autotag",
    config = conf("nvim-ts-autotag"),
  },
  {
    "mattn/emmet-vim",
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
