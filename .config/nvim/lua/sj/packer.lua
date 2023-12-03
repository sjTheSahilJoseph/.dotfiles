-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({ "rose-pine/neovim", as = "rose-pine" })

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "L3MON4D3/LuaSnip" },
		},
	})

	use("tpope/vim-fugitive")

	use({
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup()
		end,
	})

	use("mfussenegger/nvim-lint")

	use("folke/neodev.nvim")

	use({ "norcalli/nvim-colorizer.lua" })

	use("mbbill/undotree")
	use("laytan/cloak.nvim")

	use("folke/zen-mode.nvim")
	use("folke/trouble.nvim")
end)
