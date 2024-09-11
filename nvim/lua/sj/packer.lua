vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")
    use("mbbill/undotree")
    use 'norcalli/nvim-colorizer.lua'

    use("rose-pine/neovim")

end)
