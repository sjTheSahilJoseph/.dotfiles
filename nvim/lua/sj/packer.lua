vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("mbbill/undotree")
    use 'norcalli/nvim-colorizer.lua'
	use("sjTheSahilJoseph/monochrome.nvim")

    use("nvim-treesitter/nvim-treesitter")
end)
