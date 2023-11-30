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

vim.api.nvim_set_keymap("n", "<leader>ut", ":UndotreeToggle<CR>", { noremap = true, silent = false })

vim.api.nvim_set_keymap("n", "J", "mzJ`z", { noremap = true, silent = false })

vim.api.nvim_set_keymap("n", "<C-d>", "<C-d>zz", { noremap = true, silent = false })

vim.api.nvim_set_keymap("n", "<C-u>", "<C-u>zz", { noremap = true, silent = false })

vim.api.nvim_set_keymap("x", "<leader>pd", '"_dP', { noremap = true, silent = false })

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga hover_doc <CR>")
vim.keymap.set("n", "<A-t>", "<cmd>Lspsaga term_toggle <CR>")
