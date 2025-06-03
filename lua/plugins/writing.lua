local function find_bibliography()
  local current_file = vim.fn.expand("%:p")
  local current_dir = vim.fn.fnamemodify(current_file, ":h")

  -- Traverse upwards until root folder (containing .git) is found
  while not vim.fn.isdirectory(current_dir .. "/.git") do
    if vim.fn.filereadable(current_dir .. "/bibliography.bib") then
      return current_dir .. "/bibliography.bib"
    end

    -- Move one directory up
    current_dir = vim.fn.fnamemodify(current_dir, ":h")

    -- If we reach the root directory, break the loop
    if current_dir == "/" then
      break
    end
  end

  -- If bibliography.bib is found in the root folder, return its path
  if vim.fn.filereadable(current_dir .. "/bibliography.bib") then
    return current_dir .. "/bibliography.bib"
  end

  -- If bibliography.bib not found, search for any .bib file in the root folder
  local bib_files = vim.fn.glob(current_dir .. "/*.bib")
  if #bib_files > 0 then
    return bib_files[1]
  end

  -- If no .bib file is found, return nil
  return nil
end

return {
  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "quarto",
    opts = {
      codeRunner = {
        enabled = true,
        default_method = "molten",
      },
    },
    keys = {
      {
        "<leader>wp",
        "<cmd>QuartoPreview<cr>",
        desc = "Preview Document",
      },
      {
        "<leader>rc",
        "<cmd>QuartoSend<cr>",
        desc = "Run Quarto Cell",
      },
      {
        "<s-cr>",
        "<cmd>QuartoSend<cr>",
        desc = "Run Quarto Cell",
      },
    },
  },
  { -- Latex plugins
    "lervag/vimtex",
    lazy = true,
    ft = "tex",
    dependencies = {
      "folke/which-key.nvim",
    },
    config = function()
      -- Special vim formatting for latex files
      vim.g["vimtex_format_enabled"] = 1

      -- Viewer options: One may configure the viewer either by specifying a built-in
      -- viewer method:
      vim.g["vimtex_view_method"] = "zathura"

      -- Or with a generic interface:
      -- vim.g["vimtex_view_general_viewer"] = "okular"
      -- vim.g["vimtex_view_general_options"] = "--unique file:@pdf#src:@line@tex"

      -- Folding
      vim.g["vimtex_fold_enabled"] = 1

      vim.g["vimtex_fold_types"] = {
        sections = {
          parse_levels = 0,
          sections = {
            "%(add)?part",
            "%(chapter|addchap)",
            "%(section|addsec)",
            "subsection",
            "subsubsection",
            "paragraph",
          },
          parts = {
            "appendix",
            "frontmatter",
            "mainmatter",
            "backmatter",
          },
        },
      }

      vim.g.vimtex_imaps_enabled = 1

      vim.g.vimtex_quickfix_open_on_warning = 1

      vim.g.vimtex_quickfix_mode = 0

      vim.g.vimtex_quickfix_ignore_filters = {
        "Overfull",
        "Underfull",
      }

      vim.g.vimtex_imaps_leader = "´"

      vim.fn["vimtex#imaps#add_map"]({
        lhs = "test",
        rhs = "\tested",
        wrapper = "vimtex#imaps#wrap_trivial",
      })

      require("which-key").register({
        w = { name = "Writing", l = { name = "LaTeX" } },
      }, {
        mode = "n",
        buffer = nil,
        silent = true,
        noremap = true,
        nowait = true,
        prefix = "<leader>",
      })
    end,
    keys = {
      {
        "<leader>wla",
        "<Plug>(vimtex-context-menu)<cr>",
        desc = "Context Menu",
      },
      { "<leader>wlc", "<Plug>(vimtex-clean)<cr>", desc = "Clean" },
      {
        "<leader>wlC",
        "<Plug>(vimtex-clean-full)<cr>",
        desc = "Clean Full",
      },
      { "<leader>wle", "<Plug>(vimtex-errors)<cr>", desc = "Errors" },
      { "<leader>wlg", "<Plug>(vimtex-status)<cr>", desc = "Status" },
      {
        "<leader>wlG",
        "<Plug>(vimtex-status-all)<cr>",
        desc = "Status All",
      },
      { "<leader>wli", "<Plug>(vimtex-info)<cr>", desc = "Info" },
      {
        "<leader>wlI",
        "<Plug>(vimtex-info-full)<cr>",
        desc = "Info Full",
      },
      { "<leader>wlk", "<Plug>(vimtex-stop)<cr>", desc = "Stop" },
      {
        "<leader>wlK",
        "<Plug>(vimtex-stop-all)<cr>",
        desc = "Stop All",
      },
      {
        "<leader>wll",
        "<Plug>(vimtex-compile)<cr>",
        desc = "Compile",
      },
      {
        "<leader>wlL",
        "<Plug>(vimtex-compile-selected)<cr>",
        desc = "Compile Selected",
      },
      {
        "<leader>wlm",
        "<Plug>(vimtex-imaps-list)<cr>",
        desc = "List imaps",
      },
      {
        "<leader>wlo",
        "<Plug>(vimtex-compile-output)<cr>",
        desc = "Compile and Output",
      },
      { "<leader>wlq", "<Plug>(vimtex-log)<cr>", desc = "Log" },
      {
        "<leader>wls",
        "<Plug>(vimtex-toggle-main)<cr>",
        desc = "Toggle Main",
      },
      {
        "<leader>wlt",
        "<Plug>(vimtex-toc-open)<cr>",
        desc = "Open Table of Contents",
      },
      {
        "<leader>wlT",
        "<Plug>(vimtex-toc-toggle)<cr>",
        desc = "Toggle Table of Contents",
      },
      { "<leader>wlv", "<Plug>(vimtex-view)<cr>", desc = "View" },
      {
        "<leader>wlX",
        "<Plug>(vimtex-reload-state)<cr>",
        desc = "Reload State",
      },
      {
        "<leader>wlx",
        "<Plug>(vimtex-reload)<cr>",
        desc = "Reload",
      },
    },
  },
  {
    "jmbuhr/telescope-zotero.nvim",
    dependencies = {
      "kkharji/sqlite.lua",
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local telescope = require("telescope")
      telescope.load_extension("zotero")

      require("zotero").setup({
        pdf_opener = "zathura",
        ft = {
          tex = {
            insert_key_formatter = function(citekey)
              return citekey
            end,
            locate_bib = find_bibliography,
          },
        },
      })
    end,
    keys = {
      {
        "<leader>fc",
        "<cmd>Telescope zotero<cr>",
        desc = "Citations",
      },
    },
  },
  {
    "ficcdaf/academic.nvim",
    -- optional: only load for certain filetypes
    ft = { "markdown", "tex" },
    lazy = false,
  },
}
