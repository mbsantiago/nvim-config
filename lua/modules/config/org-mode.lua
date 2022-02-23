return function()
  local orgmode = safe_require("orgmode")

  if not orgmode then
    return
  end

  orgmode.setup_ts_grammar()

  orgmode.setup({
    org_agenda_files = "~/org/*",
    org_default_notes_file = "~/org/notes.org",
  })
end
