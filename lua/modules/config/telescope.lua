return function()
  local telescope = safe_require("telescope")

  telescope.load_extension("fzy_native")

  telescope.load_extension("projects")

  if not telescope then
    return
  end

  local actions = require("telescope.actions")

  telescope.setup({
    defaults = {
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      sorting_strategy = "ascending",
      file_ignore_patterns = { "node_modules/.*", "%.env" },
      layout_config = {
        vertical = { width = 0.5, mirror = false },
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          results_width = 0.8,
        },
        width = 0.87,
        height = 0.80,
        preview_cutoff = 120,
      },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = { ["<C-c>"] = actions.close },
      },
    },
  })
end
