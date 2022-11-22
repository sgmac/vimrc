-- REFd vim.api.nvim_set_keymap requires 4 arguments
-- `n` normal `i` insert `v` visual

-- shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = {}

vim.g.mapleader = ","
vim.cmd "imap jk <ESC>"

-- easy window 
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- disabling keys
keymap("n", "<up>", "<nop>", opts)
keymap("n", "<down>", "<nop>", opts)
keymap("n", "<left>", "<nop>", opts)
keymap("n", "<right>", "<nop>", opts)

-- leader keymaps
keymap("n", "<leader>p", "<esc>:bp<CR>", opts)  
keymap("n", "<leader>p", "<esc>:bn<CR>", opts)
keymap("n", "<leader>q", "<esc>:bd<CR>", opts)
keymap("n", "<leader>c", "<esc>:tabnew<CR>", opts)

-- closing faster
keymap("n", "<leader>e", ":quit<CR>", {noremap = true, silent = true})
