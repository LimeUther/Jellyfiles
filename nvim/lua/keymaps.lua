local keymap = vim.keymap.set
local s = { silent = true }

vim.g.mapleader = " "

keymap("n", "<space>", "<Nop>")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<leader>w", "<cmd>w!<CR>", s)
keymap("n", "<leader>q", "<cmd>q!<CR>", s)
keymap("n", "<leader>te", "<cmd>tabnew<CR>", s)
keymap("n", "<leader>td", "<cmd>tabc<CR>", s)
keymap("n", "<leader>|", "<cmd>vsplit<CR>", s)
keymap("n", "<leader>-", "<cmd>split<CR>", s)
keymap("n", "<leader>fo", ":lua vim.lsp.buf.format()<CR>", s)
keymap("v", "<leader>p", '"_dP')
keymap("x", "y", [["+y]], s)
keymap("t", "<Esc>", "<C-\\><C-N>")
keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>')
keymap("n", "<leader>re", '<cmd>restart<cr>', {
  desc = "Restart Neovim (:restart)"
})

keymap("n", "<C-h>", ":wincmd h<CR>")
keymap("n", "<C-j>", ":wincmd j<CR>")
keymap("n", "<C-k>", ":wincmd k<CR>")
keymap("n", "<C-l>", ":wincmd l<CR>")

local opts = { noremap = true, silent = true }
keymap("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
