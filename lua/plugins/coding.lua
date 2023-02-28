return {
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" },
    },
    config = true,
    lazy = true,
    keys = {
      {
        "<leader>cre",
        "<CMD>lua require('refactoring').refactor('Extract Function')<CR>",
        mode = "v",
        desc = "Extract function",
      },
      {
        "<leader>crf",
        "<CMD>lua require('refactoring').refactor('Extract Function To File')<CR>",
        mode = "v",
        desc = "Extract function to file",
      },
      {
        "<leader>crv",
        "<CMD>lua require('refactoring').refactor('Extract Variable')<CR>",
        mode = "v",
        desc = "Extract variable",
      },
      {
        "<leader>cri",
        "<CMD>lua require('refactoring').refactor('Inline Variable')<CR>",
        mode = "v",
        desc = "Inline variable",
      },
      {
        "<leader>crb",
        "<CMD>lua require('refactoring').refactor('Extract Block')<CR>",
        desc = "Extract block",
      },
      {
        "<leader>crbf",
        "<CMD>lua require('refactoring').refactor('Extract Block To File')<CR>",
        desc = "Extract block to file",
      },
      {
        "<leader>cri",
        "<CMD>lua require('refactoring').refactor('Inline Variable')<CR>",
        desc = "Inline variable",
      },
    },
  },
}
