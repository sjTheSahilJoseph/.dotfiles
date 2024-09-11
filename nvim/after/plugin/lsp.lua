local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    "clangd",
  },
  handlers = {
    lsp_zero.default_setup,

    ts_ls = function()
      require('lspconfig').ts_ls.setup({
      })
    end,

   pyright = function()
      require('lspconfig').pyright.setup({
      })
    end,

    clangd = function()
		require('lspconfig').clangd.setup({
		  })
		end,
  },
})
