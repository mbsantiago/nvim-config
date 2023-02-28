return {
  {
    -- Python indentation
    "Vimjas/vim-python-pep8-indent",
    ft = "python",
    lazy = true,
  },
  { -- Python folding
    "tmhedberg/simpylfold",
    ft = "python",
    lazy = true,
    config = function( --[[  ]])
      vim.g["SimpylFold_fold_level"] = 0
      vim.g.simpylfold_fold_docstrings = 1
      vim.g.simpylfold_fold_multiline_comments = 1
    end,
  },
}
