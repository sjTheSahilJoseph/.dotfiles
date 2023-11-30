vim.g.mapleader = " "

vim.api.nvim_set_keymap("n", "<leader>pv", ":Ex<CR>", { noremap = true, silent = false })

vim.api.nvim_set_keymap("v", "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = false })
vim.api.nvim_set_keymap("v", "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = false })

vim.api.nvim_set_keymap("n", "<leader>y", '"+y', { noremap = true, silent = false })
vim.api.nvim_set_keymap("v", "<leader>y", '"+y', { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<leader>Y", '"+Y', { noremap = true, silent = false })

vim.api.nvim_set_keymap(
	"n",
	"<leader>s",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ noremap = true, silent = false }
)

vim.keymap.set("n", "<leader>ut", vim.cmd.UndotreeToggle)
