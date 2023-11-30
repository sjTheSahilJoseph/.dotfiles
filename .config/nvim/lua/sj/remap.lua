vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

vim.keymap.set(
	"n",
	"<leader>s",
	":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
	{ noremap = true, silent = false }
)

vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")

vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("x", "<leader>pd", '"_dP')

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})

vim.keymap.set("n", "<leader>gs", vim.cmd.Git)

vim.keymap.set("n", "<A-s>", "<cmd>CloakToggle <CR>")

vim.keymap.set("n", "<A-z>", "<cmd>ZenMode <CR>")
