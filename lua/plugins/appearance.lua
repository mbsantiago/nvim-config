---@diagnostic disable: unused-local
local foldVirtualTextHandler = function(
  virtText,
  lnum,
  endLnum,
  width,
  truncate
)
  local newVirtText = {}
  local suffix = ("  %d "):format(endLnum - lnum)
  local sufWidth = vim.fn.strdisplaywidth(suffix)
  local targetWidth = width - sufWidth
  local curWidth = 0
  for _, chunk in ipairs(virtText) do
    local chunkText = chunk[1]
    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
    if targetWidth > curWidth + chunkWidth then
      table.insert(newVirtText, chunk)
    else
      chunkText = truncate(chunkText, targetWidth - curWidth)
      local hlGroup = chunk[2]
      table.insert(newVirtText, { chunkText, hlGroup })
      chunkWidth = vim.fn.strdisplaywidth(chunkText)
      -- str width returned from truncate() may less than 2nd argument,
      -- need padding
      if curWidth + chunkWidth < targetWidth then
        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
      end
      break
    end
    curWidth = curWidth + chunkWidth
  end
  table.insert(newVirtText, { suffix, "MoreMsg" })
  return newVirtText
end

return {
  {
    -- Make Neovim Transparent
    "xiyaowong/transparent.nvim",
    lazy = false,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      -- Set the colorscheme
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    -- Colorizer
    "norcalli/nvim-colorizer.lua",
    config = true,
  },
  {
    -- Cursor line
    "yamatsum/nvim-cursorline",
    config = true,
  },
  {
    -- Indentation guide lines
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_current_context = true,
      use_treesitter = true,
      char = "│",
      filetype_exclude = {
        "help",
        "alpha",
        "dashboard",
        "neo-tree",
        "Trouble",
        "lazy",
      },
      show_trailing_blankline_indent = false,
    },
  },
  {
    "folke/twilight.nvim",
    config = true,
    lazy = true,
    cmd = "Twilight",
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
  },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = {
      "kevinhwang91/promise-async",
      {
        "luukvbaal/statuscol.nvim",
        config = function()
          local builtin = require("statuscol.builtin")
          require("statuscol").setup({
            relculright = true,
            segments = {
              { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
              { text = { "%s" }, click = "v:lua.ScSa" },
              { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
            },
          })
        end,
      },
    },
    config = function()
      require("ufo").setup({
        fold_virt_text_handler = foldVirtualTextHandler,
        provider_selector = function(bufnr, filetype, buftype)
          return { "treesitter", "indent" }
        end,
      })
      vim.api.nvim_set_hl(0, "FoldColumn", { link = "SignColumn" })
    end,
    event = "VeryLazy",
    keys = {
      {
        "zR",
        "<CMD>lua require('ufo').openAllFolds()<CR>",
        desc = "Open all folds",
      },
      {
        "zM",
        "<CMD>lua require('ufo').closeAllFolds()<CR>",
        desc = "Close all folds",
      },
      {
        "K",
        function()
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          if not winid then
            vim.lsp.buf.hover()
          end
        end,
        desc = "Close all folds",
      },
    },
  },
}