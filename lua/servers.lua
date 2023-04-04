return {
  lua_ls = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      completion = {
        callSnippet = "Replace",
      },
    },
  },
  tsserver = {},
  yamlls = {
    yamlls = {
      yaml = {
        format = {
          enable = true,
        },
      },
    },
  },
  pyright = {
    single_file_support = true,
  },
  texlab = {
    texlab = {
      chktex = {
        onEdit = true,
      },
    },
  },
  astro = {},
  clangd = {},
  html = {},
  jsonls = {},
  taplo = {},
  tailwindcss = {},
}
