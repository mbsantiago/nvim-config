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
      "RRethy/nvim-treesitter-textsubjects",
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
  {
    'folke/neodev.nvim',
    config = function()
      require('neodev').setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
    end
  },
  { -- Lsp
    "neovim/nvim-lspconfig",
    config = conf("lsp"),
    requires = {
      "williamboman/mason.nvim",
      "tjdevries/lsp_extensions.nvim",
      "folke/trouble.nvim",
      "tami5/lspsaga.nvim",
      "jose-elias-alvarez/nvim-lsp-ts-utils",
      "jose-elias-alvarez/null-ls.nvim",
      "onsails/lspkind-nvim",
      "j-hui/fidget.nvim",
      "williamboman/mason-lspconfig.nvim",
      "jayp0521/mason-null-ls.nvim",
    },
  },
  { -- Autocompletion plugin
    "hrsh7th/nvim-cmp",
    config = conf("nvim-cmp"),
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "tzachar/cmp-fuzzy-buffer",
      "tzachar/cmp-fuzzy-path",
      "github/copilot.vim",
      {
        "tzachar/cmp-tabnine",
        run = "./install.sh",
        requires = "hrsh7th/nvim-cmp",
      },
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
  { -- Run snippets of code
    "michaelb/sniprun",
    config = conf("sniprun"),
    run = "bash ./install.sh",
  },
  { -- Comments
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },
  {
    "anuvyklack/fold-preview.nvim",
    requires = "anuvyklack/keymap-amend.nvim",
    config = function()
      require("fold-preview").setup()
    end,
  },
  { -- Make folds prettier
    "anuvyklack/pretty-fold.nvim",
    config = conf("pretty-fold"),
    requires = {
      "anuvyklack/nvim-keymap-amend",
    },
  },
  { -- Markdown
    "mzlogin/vim-markdown-toc",
    "vim-pandoc/vim-pandoc-syntax",
    "vim-pandoc/vim-pandoc",
    "davidgranstrom/nvim-markdown-preview",
    config = conf("markdown"),
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
  { -- Rust
    "simrat39/rust-tools.nvim",
    config = conf("rust-tools"),
  },
  { -- Testing
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/neotest-python",
      "haydenmeade/neotest-jest",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
    },
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
  {
    "simrat39/symbols-outline.nvim",
    config = function()
      require("symbols-outline").setup({
        auto_close = true,
        auto_preview = true,
        autofold_depth = 1,
        lsp_blacklist = { "pylsp" },
      })
    end,
  },
  {
    -- DBML syntax
    "jidn/vim-dbml",
  }
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
