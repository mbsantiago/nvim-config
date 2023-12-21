return {
  {
    -- File tree
    "kyazdani42/nvim-tree.lua",
    cmd = "NvimTreeToggle",
    lazy = true,
    opts = {
      hijack_cursor = true,
      diagnostics = {
        enable = true,
      },
      modified = {
        enable = true,
      },
      view = {
        cursorline = true,
      },
      renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        highlight_opened_files = "name",
        root_folder_label = false,
        indent_markers = {
          enable = true,
        },
      },
      live_filter = {
        prefix = " search: ",
        always_show_folders = false,
      },
    },
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explorer" },
    },
  },
}
