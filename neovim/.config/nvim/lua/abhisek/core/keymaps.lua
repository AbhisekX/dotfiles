vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
vim.keymap.set("n", "<C-Up>", "<C-w>k")
vim.keymap.set("n", "<C-Down>", "<C-w>j")
vim.keymap.set("n", "<C-Left>", "<C-w>h")
vim.keymap.set("n", "<C-Right>", "<C-w>l")

-- Resize with arrows
vim.keymap.set("n", "<C-S-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-S-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-S-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-S-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")

-- Scroll screen up and down
vim.keymap.set("n", "<C-k>", "<C-y>")
vim.keymap.set("n", "<C-j>", "<C-e>")

-- Miscellaneous
vim.keymap.set("n", "x", '"_x') -- Don't copy deleted character into register
vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>") -- Clear search highlight

-- VISUAL --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move text up and down
vim.keymap.set("v", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("v", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("v", "p", '"_dP')
