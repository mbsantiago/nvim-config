local map = function(mode, key, cmd, opts)
  vim.api.nvim_set_keymap(mode, key, cmd, opts or { noremap = true, silent = true })
end

-- Window movement
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")
map("n", "<C-H>", "<C-W><C-H>")

-- Window resize
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Snippets
vim.api.nvim_set_keymap("i", "<C-J>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<C-J>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<C-E>", "<Plug>luasnip-next-choice", {})
vim.api.nvim_set_keymap("s", "<C-E>", "<Plug>luasnip-next-choice", {})

-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("v", "p", '"_dP')
-- Visual Block --

-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv")
map("x", "K", ":move '<-2<CR>gv-gv")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")

local wk = safe_require("which-key")

if wk then
  return
end

-- Search
map("n", "<leader>ch", ":noh<CR>")

-- Spelling
map("n", "<leader>sp", ":set spell<CR>")
map("n", "<leader>nsp", ":set nospell<CR>")

-- Sidebars
map("n", "<leader>nt", ":NvimTreeToggle<CR>")
map("n", "<leader>tb", ":TagbarToggle<CR>")
map("n", "<leader>u", ":UndotreeToggle<CR>")

-- Terminal
map("n", "<leader>t", ":terminal<CR>")
map("t", "<Esc>", "<C-\\><C-n>")

-- Special files
map("n", "<leader>vrc", ":vsp $MYVIMRC<CR>")

--                          Telescope
-- Telescope Builtin Sources
map("n", "<C-p>", "<cmd>Telescope find_files<CR>")
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>")
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>")
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>")
map("n", "<leader>fr", "<cmd>Telescope registers<CR>")
map("n", "<leader>fm", "<cmd>Telescope marks<CR>")
map("n", "<leader>f/", "<cmd>Telescope current_buffer_fuzzy_find<CR>")

map("n", "<leader>ft", "<cmd>Telescope tags<CR>")
map("n", "<leader>fT", "<cmd>Telescope current_buffer_tags<CR>")

map("n", "<leader>flg", "<cmd>Telescope live_grep<CR>")

map("n", "<leader>fgf", "<cmd>Telescope git_files<CR>")
map("n", "<leader>fgc", "<cmd>Telescope git_commits<CR>")
map("n", "<leader>fgs", "<cmd>Telescope git_status<CR>")
map("n", "<leader>fgb", "<cmd>Telescope git_branches<CR>")

map("n", "<leader>fql", "<cmd>Telescope quickfix<CR>")
map("n", "<leader>fll", "<cmd>Telescope loclist<CR>")

map("n", "<leader>flr", "<cmd>Telescope lsp_references<CR>")
map("n", "<leader>fls", "<cmd>Telescope lsp_document_symbols<CR>")
map("n", "<leader>flw", "<cmd>Telescope lsp_workspace_symbols<CR>")

map("n", "<leader>fcs", "<cmd>Telescope colorscheme<CR>")
map("n", "<leader>fch", "<cmd>Telescope command_history<CR>")
map("n", "<leader>fss", "<cmd>Telescope spell_suggest<CR>")
map("n", "<leader>fsh", "<cmd>Telescope search_history<CR>")

-- Telescope find dotfiles
map(
  "n",
  "<leader>fd",
  "<cmd>lua require'telescope.builtin'.find_files{ search_dirs = { configs = '~/.config/nvim' } }<cr>"
)

-- LSP
map("n", "<leader>vd", ":lua vim.lsp.buf.definition()<CR>")
map("n", "<leader>vr", ":Lspsaga rename<CR>")
map("n", "<leader>vh", ":Lspsaga hover_doc<CR>")
map("n", "<leader>vj", ":Lspsaga lsp_finder<CR>")
map("n", "<leader>vs", ":Lspsaga signature_help<CR>")
map("n", "<leader>va", ":Lspsaga code_action<CR>")
map("n", "<leader>vp", ":Lspsaga preview_definition<CR>")
map("n", "<leader>vf", ":lua vim.lsp.buf.formatting()<CR>")
map("n", "<leader>vi", ":lua vim.lsp.buf.implementation()<CR>")
map("n", "<leader>vl", ":Lspsaga show_line_diagnostics<CR>")
map("n", "<leader>vc", ":Lspsaga show_cursor_diagnostics<CR>")
map("n", "<leader>vn", ":Lspsaga diagnostic_jump_next<CR>")
map("n", "<leader>vN", ":Lspsaga diagnostic_jump_prev<CR>")
map("n", "<leader>vk", ":lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR>")
map("n", "<A-d>", ":Lspsaga open_floaterm<CR>")
map("t", "<A-d>", "<C-\\><C-n>:Lspsaga close_floaterm<CR>")

-- Trouble
map("n", "<leader>xx", ":TroubleToggle<CR>")
map("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>")
map("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>")
map("n", "<leader>xq", ":TroubleToggle quickfix<CR>")
map("n", "<leader>xl", ":TroubleToggle loclist<CR>")
map("n", "<leader>xr", ":TroubleToggle lsp_references<CR>")

-- Hop
map("n", "<leader><leader>w", ":HopWord<CR>")
map("n", "<leader><leader>p", ":HopPattern<CR>")
map("n", "<leader><leader>l", ":HopLine<CR>")
map("n", "<leader><leader>L", ":HopLineStart<CR>")
map("n", "<leader><leader>c", ":HopChar1<CR>")
map("n", "<leader><leader>C", ":HopChar2<CR>")

-- Git
map("n", "<leader>gg", ":Git<CR>")
map("n", "<leader>gp", ":Git push<CR>")
map("n", "<leader>gd", ":Git diff<CR>")

-- Sniprun
map("n", "<leader>sr", "<Plug>SnipRun", { silent = true })
map("x", "<leader>sr", "<Plug>SnipRun", { silent = true })
map("n", "<leader>so", "<Plug>SnipRunOperator", { silent = true })
map("n", "<leader>sk", ":SnipReset<CR>")
map("n", "<leader>sc", ":SnipClose<CR>")
map("n", "<A-r>", "<Plug>SnipRunOperator", { silent = true })

-- Magma
map("n", "<leader>r", "nvim_exec('MagmaEvaluateOperator', v:true)", { silent = true, expr = true })
map("n", "<leader>rr", ":MagmaEvaluateLine<CR>", { silent = true })
map("x", "<leader>r", ":<C-u>MagmaEvaluateVisual<CR>", { silent = true })
map("n", "<leader>rc", ":MagmaReevaluateCell<CR>", { silent = true })
map("n", "<leader>rd", ":MagmaDelete<CR>", { silent = true })
map("n", "<leader>ro", ":MagmaShowOutput<CR>", { silent = true })

-- Bufferline
map("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>")
map("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>")
map("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>")
map("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>")
map("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>")
map("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>")
map("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>")
map("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>")
map("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>")
map("n", "<leader>gb", ":BufferLinePick<CR>")
map("n", "<A-,>", ":BufferLineCycleNext<CR>")
map("n", "<A-.>", ":BufferLineCyclePrev<CR>")
map("n", "<A->>", ":BufferLineMoveNext<CR>")
map("n", "<A-<>", ":BufferLineMovePrev<CR>")
map("n", "<leader>be", ":BufferLineSortByExtension<CR>")
map("n", "<leader>bd", ":BufferLineSortByDirectory<CR>")
