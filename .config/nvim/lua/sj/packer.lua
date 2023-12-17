vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
    use({
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        requires = {
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            { "neovim/nvim-lspconfig" },
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "L3MON4D3/LuaSnip" },
        },
    })
    use("tpope/vim-fugitive")
    use("mbbill/undotree")
    use("laytan/cloak.nvim")
    use("folke/zen-mode.nvim")
    use("folke/trouble.nvim")
    use("stevearc/conform.nvim")
    use 'mfussenegger/nvim-lint'
    use 'eandrju/cellular-automaton.nvim'
    use {
        "danymat/neogen",
        requires = "nvim-treesitter/nvim-treesitter",
    }
    use { "sjTheSahilJoseph/loveisanillusion.nvim" }
    use 'norcalli/nvim-colorizer.lua'
    use {
        'numToStr/Comment.nvim',
    }
    use 'folke/neodev.nvim'
end)
