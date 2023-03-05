local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Remap space as leader key
vim.g.mapleader = " "
keymap("", "<Space>", "<Nop>", opts)
vim.g.maplocalleader = " "

-- Modes
-- :  => normal, visual, select
-- :n => normal
-- :v => visual, select
-- :x => visual block
-- :i => insert
-- :c => command-line
-- :t => term_mode
keymap("i", "jk", "<ESC>", opts)
keymap("n", "<leader>nh", ":nohl<CR>", opts)
keymap("n", "<Leader>c", "ciw", opts)
keymap("n", "<Leader>x", "viwx", opts)
keymap("n", "<Leader>d", "viwd", opts)
-- keymap("n", "<Leader>p", "diwhp", { silent = true })
-- keymap("n", "<Leader>P", "viwx<ESC>hP", { silent = true })
keymap("n", "<Leader>p", 'viw"kP', opts)
keymap("n", "<Leader>P", 'viwP', opts)

keymap("n", "<Leader>o", "o<ESC>", opts)
keymap("n", "<Leader>O", "O<ESC>", opts)
keymap("n", "<Leader><CR>", "o<CR><ESC>", opts)
keymap("n", "<Leader>y", "ysiw", { silent = ture })
keymap("n", "<C-a>", "gg<S-v>G", opts)

keymap("n", "'", ",", opts)
keymap("", "(", "10k", opts)
keymap("", ")", "10j", opts)
keymap("n", "<S-h>", "h", opts)
keymap("n", "<S-l>", "l", opts)
keymap("v", "<S-k>", "k", opts)
keymap("v", "<S-j>", "j", opts)

-- not use register
keymap("n", "x" , '"_x', opts)
keymap("", "y", '"ky', opts)
keymap("n", "yy", '"kyy', opts)
keymap("", "Y", "y", opts)
keymap("", "p", '"kp', opts)
keymap("", "P", "p", opts)

-- Visual
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move Line
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

if is_mac then
  keymap("n", "˚", "<Esc>:m .-2<CR>", opts)
  keymap("n", "∆", "<Esc>:m .+1<CR>", opts)
  keymap("v", "∆", ":m .+1<CR>==", opts)
  keymap("v", "˚", ":m .-2<CR>==", opts)
  keymap("x", "∆", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "˚", ":move '<-2<CR>gv-gv", opts)
end

if is_win then
  keymap("n", "<A-j>", "<Esc>:m .+1<CR>", opts)
  keymap("n", "<A-k>", "<Esc>:m .-2<CR>", opts)
  keymap("v", "<A-j>", ":m .+1<CR>==", opts)
  keymap("v", "<A-k>", ":m .-2<CR>==", opts)
  keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
end

-- Move Buffer
keymap("n", "<Leader>]", ":bnext<CR>", opts)
keymap("n", "<Leader>[", ":bprevious<CR>", opts)

-- Navigation
keymap("n", "<Leader>qa", ":xa<CR>", opts)
keymap("n", "<Leader>w", ":bd<CR>", opts)

-- * Split
keymap("n", "<Leader>\\", "<C-w>v<C-w>w", opts)
keymap("n", "<Leader>-", "<C-w>s<C-w>w", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-=>", "<C-w>>", opts)
keymap("n", "<C-9>", "<C-w><", opts)
keymap("n", "<C-_>", "<C-w>-", opts)
keymap("n", "<C-0>", "<C-w>+", opts)
keymap("n", "<Leader>=", ":MaximizerToggle<CR>", opts)
-- * Tab
keymap("n", "<Leader>t", ":tabnew<CR>", opts)
keymap("n", "<S-TAB>", ":tabp<CR>", opts)
keymap("n", "<TAB>", ":tabn<CR>", opts)

-- nvim-tree
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- telescope
keymap("n", "<Leader>ff", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<Leader>f/", "<cmd>Telescope live_grep<CR>", opts)
keymap("n", "<Leader>fb", "<cmd>Telescope buffers<CR>", opts)
keymap("n", "<Leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Auto Pairs
-- keymap("n", "mn", "<M-n>", {});
-- keymap("n", "mp", "<M-b>", {});
