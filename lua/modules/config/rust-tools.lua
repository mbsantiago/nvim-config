return function()
  local rt = safe_require("rust-tools")

  if not rt then
    return
  end

  rt.setup({
    server = {
      on_attach = function(_, bufnr)
        -- Hover actions
        vim.keymap.set(
          "n",
          "<Leader>ra",
          rt.hover_actions.hover_actions,
          { buffer = bufnr }
        )
        -- Code action groups
        vim.keymap.set(
          "n",
          "<Leader>rg",
          rt.code_action_group.code_action_group,
          { buffer = bufnr }
        )
      end,
    },
  })
end
