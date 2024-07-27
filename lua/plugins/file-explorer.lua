local git_ignored = setmetatable({}, {
  __index = function(self, key)
    local proc = vim.system({
      "git",
      "ls-files",
      "--ignored",
      "--exclude-standard",
      "--others",
      "--directory",
    }, {
      cwd = key,
      text = true,
    })
    local result = proc:wait()
    local ret = {}
    if result.code == 0 then
      for line in
        vim.gsplit(result.stdout, "\n", { plain = true, trimempty = true })
      do
        -- Remove trailing slash
        line = line:gsub("/$", "")
        table.insert(ret, line)
      end
    end

    rawset(self, key, ret)
    return ret
  end,
})

return {
  {
    "stevearc/oil.nvim",
    config = function()
      require("oil").setup({
        default_file_explorer = true,
        keymaps = {
          ["<C-h>"] = false,
          ["<C-l>"] = false,
        },
        view_options = {
          is_hidden_file = function(name, _)
            -- dotfiles are always considered hidden
            if vim.startswith(name, ".") then
              return true
            end
            local dir = require("oil").get_current_dir()
            -- if no local directory (e.g. for ssh connections), always show
            if not dir then
              return false
            end
            -- Check if file is gitignored
            return vim.list_contains(git_ignored[dir], name)
          end,
        },
      })
    end,
    lazy = false,
    commit = "18272aba9d00a3176a5443d50dbb4464acc167bd",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      {
        "-",
        "<CMD>Oil<CR>",
        desc = "Open parent directory",
      },
    },
  },
}
