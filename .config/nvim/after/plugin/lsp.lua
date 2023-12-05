local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		lsp_zero.default_setup,
	},
})

require("lspconfig").lua_ls.setup({})

require("lspconfig").pyright.setup({})

require("lspconfig").tsserver.setup({})
require("lspconfig").eslint.setup({})
require("lspconfig").html.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").emmet_ls.setup({
	filetypes = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
})
require("lspconfig").clangd.setup({})
require("lspconfig").emmet_language_server.setup({})
require("lspconfig").tailwindcss.setup({})
