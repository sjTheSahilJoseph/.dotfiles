-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
require("neodev").setup({
  -- add any options here, or leave empty to use the default settings
  library = { plugins = { "nvim-dap-ui" }, types = true },
})

local lsp_zero = require('lsp-zero')


lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

local lspconfig = require('lspconfig')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls", "pyright", "rust_analyzer", "clangd"
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
    }),
})

lspconfig.lua_ls.setup({
    filetypes = { "lua" }
})
lspconfig.pyright.setup({
    filetypes = { "python" }
})
lspconfig.rust_analyzer.setup({
    filetypes = { "rust" }
})
lspconfig.tsserver.setup({
    filetypes = { "javascript", "typescript" }
})
lspconfig.clangd.setup({
    filetypes = { "c", "cpp" }
})
lspconfig.emmet_language_server.setup({
    filetypes = {"html", "css", "jsx", "tsx", "javascript", "typescript", "javascriptreact", "typescriptreact"}
})
lspconfig.cssls.setup({
    filetypes = {"html", "css", "jsx", "tsx", "javascript", "typescript", "javascriptreact", "typescriptreact"}
})
lspconfig.tailwindcss.setup({
    filetypes = {"html", "css", "jsx", "tsx", "javascript", "typescript", "javascriptreact", "typescriptreact"}
})
