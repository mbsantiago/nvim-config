return function()
  -- Thesaurus configurations
  vim.g.tq_enabled_backends = {
    "openoffice_en",
    "mthesaur_txt",
    "datamuse_com",
  }

  vim.g.tq_openoffice_en_file = "/usr/share/myspell/dicts/th_en_US_new"

  vim.g.tq_mthesaur_file = "/home/santiago/.vim/thesaurus/mthesaur.txt"

  vim.g.tq_map_keys = 0
end
