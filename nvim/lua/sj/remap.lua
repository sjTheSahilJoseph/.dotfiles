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

vim.keymap.set("n", "<leader>fmr", "<cmd>CellularAutomaton make_it_rain<CR>")
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton game_of_life<CR>")

vim.keymap.set("n", "<leader>Gp", ":Git push<CR>")

vim.keymap.set("n", "<F3>", function()
    require('conform').format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 5000,
    })
end, { desc = "Format file" })

vim.keymap.set("n", "<leader>ln", function()
    require("lint").try_lint()
end, { desc = "Lint the File" })

vim.keymap.set("n", "<leader>ng", ":lua require('neogen').generate()<CR>")

vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, {})
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, {})
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, {})
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, {})

vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end)
vim.keymap.set("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end)
vim.keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end)
vim.keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end)
vim.keymap.set("n", "gR", function()
	require("trouble").toggle("lsp_references")
end)

vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>")

vim.keymap.set("n", "<A-z>", "<cmd>ZenMode <CR>")

