vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use("tpope/vim-fugitive")
    use("mbbill/undotree")
    use("laytan/cloak.nvim")
    use { "sjTheSahilJoseph/loveisanillusion.nvim" }
    use 'norcalli/nvim-colorizer.lua'
    use {
        'numToStr/Comment.nvim',
    }
    use "nvim-lua/plenary.nvim"
    use {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        requires = { { "nvim-lua/plenary.nvim" } }
    }
end)
