vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("tpope/vim-fugitive")
    use("mbbill/undotree")
    use { "~/Projects/loveisanillusion.vim" }
    use 'norcalli/nvim-colorizer.lua'
    use {
        'numToStr/Comment.nvim',
    }
	use 'nvim-treesitter/nvim-treesitter'
end)
