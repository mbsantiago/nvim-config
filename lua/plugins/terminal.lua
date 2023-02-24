return {
  { -- Terminal Support / Multiple terminal
    "akinsho/toggleterm.nvim",
    lazy = true,
    config = function()
      local toggleterm = require("toggleterm")

      toggleterm.setup({
        -- size = 20,
        open_mapping = [[<c-\>]],
        -- hide_numbers = true,
        -- shade_filetypes = {},
        -- shade_terminals = true,
        -- shading_factor = 2,
        -- start_in_insert = true,
        -- insert_mappings = true,
        -- persist_size = true,
        -- direction = "float",
        -- close_on_exit = true,
        -- shell = vim.o.shell,
        -- float_opts = {
        --   border = "curved",
        --   winblend = 0,
        --   highlights = {
        --     border = "Normal",
        --     background = "Normal",
        --   },
        -- },
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

      -- TODO: Move lazygit to git configs
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
      _G._LAZYGIT_TOGGLE = function()
        lazygit:toggle()
      end

      local python = Terminal:new({ cmd = "python", hidden = true })
      _G._PYTHON_TOGGLE = function()
        python:toggle()
      end

      local taskwarrior = Terminal:new({
        cmd = "taskwarrior-tui",
        hidden = true,
      })
      _G._TASK_TOGGLE = function()
        taskwarrior:toggle()
      end
    end,
    cmd = "ToggleTerm",
    keys = {
      {
        "<c-\\>",
        "<cmd>ToggleTerm<cr>",
        desc = "Terminal Toggle",
      },
      {
        "<leader>Tt",
        "<cmd>lua _TASK_TOGGLE()<cr>",
        desc = "Terminal Tasks",
      },
      {
        "<leader>Tm",
        "<cmd>lua _HTOP_TOGGLE()<cr>",
        desc = "Terminal Monitor",
      },
      {
        "<leader>Tp",
        "<cmd>lua _PYTHON_TOGGLE()<cr>",
        desc = "Terminal Python",
      },
      {
        "<leader>Tf",
        "<cmd>ToggleTerm direction=float<cr>",
        desc = "Terminal Float",
      },
      {
        "<leader>Th",
        "<cmd>ToggleTerm size=10 direction=horizontal<cr>",
        desc = "Terminal Horizontal",
      },
      {
        "<leader>Tv",
        "<cmd>ToggleTerm size=80 direction=vertical<cr>",
        desc = "Terminal Vertical",
      },
      {
        "<leader>gg",
        "<cmd>lua _LAZYGIT_TOGGLE()<CR>",
        desc = "Terminal Lazygit",
      },
    },
  },
}
