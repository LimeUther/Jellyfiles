local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

keymap("n", "<space>", "<Nop>")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<leader>w", "<cmd>w!<CR>", opts)
keymap("n", "<leader>q", "<cmd>q!<CR>", opts)
keymap("n", "<leader>te", "<cmd>tabnew<CR>", opts)
keymap("n", "<leader>td", "<cmd>tabc<CR>", opts)
keymap("n", "<leader>|", "<cmd>vsplit<CR>", opts)
keymap("n", "<leader>-", "<cmd>split<CR>", opts)
keymap("v", "<leader>p", '"_dP')
keymap("n", "<leader>fo", ":lua vim.lsp.buf.format()<CR>", opts)
keymap("x", "y", [["+y]], opts)
keymap("t", "<Esc>", "<C-\\><C-N>")
keymap("n", "<leader>re", '<cmd>restart<cr>')

keymap("n", "<C-h>", ":wincmd h<CR>")
keymap("n", "<C-j>", ":wincmd j<CR>")
keymap("n", "<C-k>", ":wincmd k<CR>")
keymap("n", "<C-l>", ":wincmd l<CR>")

keymap("n", "grd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

keymap("n", "<leader>th", function()
  vim.wo.cursorline = not vim.wo.cursorline
end)

vim.keymap.set("n", "<leader>cd", function()
  local current_dir = vim.fn.expand("%:p:h")
  local cmd = "git -C " .. vim.fn.escape(current_dir, " ") .. " rev-parse --show-toplevel"
  local root = vim.fn.systemlist(cmd)[1]

  -- if no git repository directory could be found
  if not (vim.v.shell_error == 0 and root and root ~= "") then
    root = vim.fn.expand("%:p:h")
  end

  vim.fn.chdir(root)
  vim.notify("Changed directory to: " .. root, vim.log.levels.INFO)
end)
