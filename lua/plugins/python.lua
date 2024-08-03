return {
  {
    -- Python indentation
    "Vimjas/vim-python-pep8-indent",
    ft = "python",
    lazy = true,
  },
  {
    -- Python folding
    "tmhedberg/simpylfold",
    ft = "python",
    lazy = true,
    config = function( --[[  ]])
      vim.g["SimpylFold_fold_level"] = 0
      vim.g.simpylfold_fold_docstrings = 1
      vim.g.simpylfold_fold_multiline_comments = 1
    end,
  },
  {
    "GCBallesteros/jupytext.nvim",
    config = true,
    lazy = false,
    opts = {
      custom_language_formatting = {
        python = {
          extension = "qmd",
          style = "quarto",
          force_ft = "quarto",
        },
        r = {
          extension = "qmd",
          style = "quarto",
          force_ft = "quarto",
        },
      },
    },
  },
  {
    "jmbuhr/otter.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },
  {
    "benlubas/molten-nvim",
    build = ":UpdateRemotePlugins",
    lazy = false,
    init = function()
      vim.g.molten_auto_open_output = false
      vim.g.molten_output_virt_lines = true
    end,
    cmd = {
      "MoltenInit",
    },
    keys = {
      { "<leader>ri", ":MoltenInit<CR>", desc = "Start Molten" },
      {
        "<leader>rm",
        ":MoltenEvaluateOperator<CR>",
        desc = "Evaluate operator",
      },
      { "<leader>ro", ":noautocmd MoltenEnterOutput<CR>", desc = "Show run output" },
      { "<leader>rl", ":MoltenEvaluateLine<CR>", desc = "Evaluate line" },
      { "<leader>rd", ":MoltenDelete<CR>", desc = "Delete highlighted cell" },
      { "<leader>rr", ":MoltenReevaluateCell<CR>", desc = "Reevaluate cell" },
      { "<leader>rj", ":MoltenNext<CR>", desc = "Go to next cell" },
      { "<leader>rk", ":MoltenPrev<CR>", desc = "Go to the previous cell" },
      {
        "<leader>r",
        ":<C-u>MoltenEvaluateVisual<CR>gv",
        mode = "v",
        desc = "Run selection",
      },
    },
  },
}
