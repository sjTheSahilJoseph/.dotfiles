vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("x", "<leader>dP", '"_dP')
vim.keymap.set("n", "<leader>gs", ":Git<CR>")
vim.keymap.set("n", "<leader>nl", ":nohl<CR>")
vim.keymap.set("n", "<leader>bs", ":bnext<cr>")
vim.keymap.set("n", "<leader>bS", ":bprev<cr>")
vim.keymap.set("n", "<leader>bT", ":Telescope buffers<CR>")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-o>", "<C-w>o")
vim.keymap.set("n", "<leader>|", ":vsp<CR>")
vim.keymap.set("n", "<leader>-", ":sp<CR>")
vim.keymap.set("n", "<UP>", ":resize +2<cr>")
vim.keymap.set("n", "<DOWN>", ":resize -2<cr>")
vim.keymap.set("n", "<LEFT>", ":vertical resize +2<cr>")
vim.keymap.set("n", "<RIGHT>", ":vertical resize -2<cr>")

vim.keymap.set("n", "<A-s>", "<cmd>CloakToggle <CR>")


vim.keymap.set("n", "<leader>Gp", ":Git push<CR>")

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})

vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>")


