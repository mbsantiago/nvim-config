local latexAccents = {
  { "à", "\\\\`a" },
  { "è", "\\\\`e" },
  { "ì", "\\\\`i" },
  { "ò", "\\\\`o" },
  { "ù", "\\\\`u" },
  { "ỳ", "\\\\`y" },
  { "À", "\\\\`A" },
  { "È", "\\\\`E" },
  { "Ì", "\\\\`I" },
  { "Ò", "\\\\`O" },
  { "Ù", "\\\\`u" },
  { "Ỳ", "\\\\`Y" },
  { "á", "\\\\'a" },
  { "é", "\\\\'e" },
  { "í", "\\\\'i" },
  { "ó", "\\\\'o" },
  { "ú", "\\\\'u" },
  { "ý", "\\\\'y" },
  { "Á", "\\\\'A" },
  { "É", "\\\\'E" },
  { "Í", "\\\\'I" },
  { "Ó", "\\\\'O" },
  { "Ú", "\\\\'u" },
  { "Ý", "\\\\'Y" },
  { "â", "\\\\^a" },
  { "ê", "\\\\^e" },
  { "î", "\\\\^i" },
  { "ô", "\\\\^o" },
  { "û", "\\\\^u" },
  { "ŷ", "\\\\^y" },
  { "Â", "\\\\^A" },
  { "Ê", "\\\\^E" },
  { "Î", "\\\\^I" },
  { "Ô", "\\\\^O" },
  { "Û", "\\\\^u" },
  { "Ŷ", "\\\\^Y" },
  { "ä", '\\\\"a' },
  { "ë", '\\\\"e' },
  { "ï", '\\\\"i' },
  { "ö", '\\\\"o' },
  { "ü", '\\\\"u' },
  { "ÿ", '\\\\"y' },
  { "Ä", '\\\\"A' },
  { "Ë", '\\\\"E' },
  { "Ï", '\\\\"I' },
  { "Ö", '\\\\"O' },
  { "Ü", '\\\\"u' },
  { "Ÿ", '\\\\"Y' },
  { "ç", "\\\\c{c}" },
  { "Ç", "\\\\c{C}" },
  { "œ", "{\\\\oe}" },
  { "Œ", "{\\\\OE}" },
  { "æ", "{\\\\ae}" },
  { "Æ", "{\\\\AE}" },
  { "å", "{\\\\aa}" },
  { "Å", "{\\\\AA}" },
  { "ø", "{\\\\o}" },
  { "Ø", "{\\\\O}" },
  { "ß", "{\\\\ss}" },
  { "¡", "{!`}" },
  { "¿", "{?`}" },
  { "©", "\\\\copyright" },
  { "ı", "{\\\\i}" },
}

function LatexAccents()
  local p, t, s

  for index, value in ipairs(latexAccents) do
    p = value[1]
    t = value[2]
    s = string.format(":%%s/%s/%s/eg", p, t)
    vim.cmd(s)
  end
end

return function()
  vim.cmd([[
    augroup vimtex_mac
      autocmd!
      autocmd FileType tex syntax enable
    augroup END
  ]])

  -- Special vim formatting for latex files
  vim.g["vimtex_format_enabled"] = 1

  -- Viewer options: One may configure the viewer either by specifying a built-in
  -- viewer method:
  -- let g:vimtex_view_method = 'zathura'

  -- Or with a generic interface:
  vim.g["vimtex_view_general_viewer"] = "okular"

  vim.g["vimtex_view_general_options"] = "--unique file:@pdf#src:@line@tex"

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

  vim.g.vimtex_imaps_leader = "´"

  vim.fn["vimtex#imaps#add_map"]({
    lhs = "test",
    rhs = "\tested",
    wrapper = "vimtex#imaps#wrap_trivial",
  })

  -- VimTeX uses latexmk as the default compiler backend. If you use it, which is
  -- strongly recommended, you probably don't need to configure anything. If you
  -- want another compiler backend, you can change it as follows. The list of
  -- supported backends and further explanation is provided in the documentation,
  -- see --:help vimtex-compiler--.
  -- let g:vimtex_compiler_method = 'latexrun'
end
