require("lspsaga").setup({

	symbol_in_winbar = {
		enable = false,
	},
	code_action = {
		enable = false,
	},
	jump_num_shortcut = {
		enable = false,
		show_code_action = false,
	},
	finder = {
		enable = false,
	},
	lightbulb = {
		enable = false,
	},
})

vim.keymap.set("n", "<A-d>", "<cmd>Lspsaga hover_doc <CR>")
vim.keymap.set("n", "<A-t>", "<cmd>Lspsaga term_toggle <CR>")
