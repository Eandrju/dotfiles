-- Setup nvim-cmp.
local cmp = require'cmp'
local capabilities = require('cmp_nvim_lsp').default_capabilities()


vim.opt.completeopt={"menu", "menuone", "noselect"}

cmp.setup({
snippet = {
  -- REQUIRED - you must specify a snippet engine
  expand = function(args)
    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
  end,
},
window = {
  -- completion = cmp.config.window.bordered(),
  -- documentation = cmp.config.window.bordered(),
},
mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
}),
sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'vsnip' }, -- For vsnip users.
  { name = 'luasnip' }, -- For luasnip users.
}, {
  { name = 'buffer' },
})
})

-- Go
require'lspconfig'.gopls.setup{
    capabilities = capabilities,
    on_attach = function ()
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
        -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer=0})
        vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', {buffer=0})
        vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', {buffer=0})
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set('n', '<leader> ', vim.lsp.buf.code_action, {buffer=0})
    end,
}

-- Python
require'lspconfig'.pyright.setup{
    capabilities = capabilities,
    on_attach = function ()
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', {buffer=0})
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set('n', '<leader> ', vim.lsp.buf.code_action, {buffer=0})
    end,
}

-- Rust
-- '.rust_analyzer.setup({
--     on_attach=on_attach,
--     settings = {
--         ["rust-analyzer"] = {
--             imports = {
--                 granularity = {
--                     group = "module",
--                 },
--                 prefix = "self",
--             },
--             cargo = {
--                 buildScripts = {
--                     enable = true,
--                 },
--             },
--             procMacro = {
--                 enable = true
--             },
--         }
--     }
-- })
require'lspconfig'.rust_analyzer.setup{
    settings = {
        ["rust-analyzer"] = {
            imports = {
                granularity = {
                    group = "module",
                },
                prefix = "self",
            },
            cargo = {
                buildScripts = {
                    enable = true,
                },
            },
            procMacro = {
                enable = true
            },
        }
    },
    capabilities = capabilities,
    on_attach = function ()
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {buffer=0})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0})
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer=0})
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {buffer=0})
        vim.keymap.set('n', '<leader>dj', vim.diagnostic.goto_next, {buffer=0})
        vim.keymap.set('n', '<leader>dk', vim.diagnostic.goto_prev, {buffer=0})
        vim.keymap.set('n', '<leader>dl', '<cmd>Telescope diagnostics<cr>', {buffer=0})
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {buffer=0})
        vim.keymap.set('n', '<leader> ', vim.lsp.buf.code_action, {buffer=0})
    end,
}
