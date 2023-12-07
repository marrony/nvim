vim.g.mapleader = " "

-- exit to file explorer
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- resize window
vim.keymap.set("n", "<C-Left>", "<C-w><")
vim.keymap.set("n", "<C-Right>", "<C-w>>")

-- move selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- copy to clipboard
vim.keymap.set("v", "<C-c>", '"+y')
