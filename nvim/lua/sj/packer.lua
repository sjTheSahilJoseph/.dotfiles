vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("mbbill/undotree")
    use { "~/projects/loveisanillusion.vim" }
    use 'norcalli/nvim-colorizer.lua'
end)
