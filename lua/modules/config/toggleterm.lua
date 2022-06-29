return function()
  local toggleterm = safe_require("toggleterm")

  if not toggleterm then
    return
  end

  toggleterm.setup({
    size = 20,
    open_mapping = [[<c-\>]],
    hide_numbers = true,
    shade_filetypes = {},
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    insert_mappings = true,
    persist_size = true,
    direction = "float",
    close_on_exit = true,
    shell = vim.o.shell,
    float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
        border = "Normal",
        background = "Normal",
      },
    },
  })

  _G.set_terminal_keymaps = function()
    local opts = { noremap = true }
    vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
  end

  vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

  local Terminal = require("toggleterm.terminal").Terminal

  local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
  _G._LAZYGIT_TOGGLE = function()
    lazygit:toggle()
  end

  local node = Terminal:new({ cmd = "node", hidden = true })
  _G._NODE_TOGGLE = function()
    node:toggle()
  end

  local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
  _G._NCDU_TOGGLE = function()
    ncdu:toggle()
  end

  local htop = Terminal:new({ cmd = "ytop", hidden = true })
  _G._HTOP_TOGGLE = function()
    htop:toggle()
  end

  local python = Terminal:new({ cmd = "python", hidden = true })
  _G._PYTHON_TOGGLE = function()
    python:toggle()
  end

  local taskwarrior = Terminal:new({ cmd = "taskwarrior-tui", hidden = true })
  _G._TASK_TOGGLE = function()
    taskwarrior:toggle()
  end
end
