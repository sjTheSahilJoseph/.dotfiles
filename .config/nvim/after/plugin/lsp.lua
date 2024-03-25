require("neodev").setup({

})

local lsp_zero = require('lsp-zero')


lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({ buffer = bufnr })
end)

local lspconfig = require('lspconfig')

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "lua_ls", "pyright", "rust_analyzer", "clangd",
        "emmet_language_server", "tsserver", "cssls", "tailwindcss", "intelephense"
    },
    handlers = {
        lsp_zero.default_setup,
    },
})

local cmp = require('cmp')

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-B>'] = cmp.mapping.scroll_docs(4),
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
    filetypes = { "html", "css", "javascript", "typescript" }
})
lspconfig.cssls.setup({
    filetypes = {"css", "html", "javascript", "typescript" }
})
lspconfig.tailwindcss.setup({
    filetypes = { "html", "javascript", "typescript" }
})
require'lspconfig'.intelephense.setup{
    filetypes = {"php"}
}
