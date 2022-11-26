local capabilities = require('cmp_nvim_lsp').default_capabilities()

local mappings = {
  {mod = 'n', lhs = 'K', rhs = vim.lsp.buf.hover, opts = {buffer = 0}},
  {mod = 'n', lhs = 'gd', rhs = vim.lsp.buf.definition, opts = {buffer = 0}},
  {mod = 'n', lhs = 'gt', rhs = vim.lsp.buf.type_definition, opts = {buffer = 0}},
  {mod = 'n', lhs = 'gi', rhs = vim.lsp.buf.implementation, opts = {buffer = 0}},
  {mod = 'n', lhs = 'gr', rhs = '<cmd>Telescope lsp_references<cr>', opts = {buffer = 0}},
  {mod = 'n', lhs = '<leader>rn', rhs = vim.lsp.buf.rename, opts = {buffer = 0}},
  {mod = 'n', lhs = '<leader> ', rhs = vim.lsp.buf.code_action, opts = {buffer = 0}},
  {mod = 'n', lhs = '<leader>dj', rhs = vim.diagnostic.goto_next, opts = {buffer = 0}},
  {mod = 'n', lhs = '<leader>dk', rhs = vim.diagnostic.goto_prev, opts = {buffer = 0}},
  {mod = 'n', lhs = '<leader>dl', rhs = '<cmd>Telescope diagnostics<cr>', opts = {buffer = 0}},
}

-- Go
require'lspconfig'.gopls.setup{
    capabilities = capabilities,
    on_attach = function ()
        for _, v in pairs(mappings) do
            vim.keymap.set(v.mod, v.lhs, v.rhs, v.opts)
        end
    end,
}

-- Python
require'lspconfig'.pyright.setup{
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true
        },
      },
    },
    capabilities = capabilities,
    on_attach = function ()
        for _, v in pairs(mappings) do
            vim.keymap.set(v.mod, v.lhs, v.rhs, v.opts)
        end
    end,
}

-- Rust
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
        for _, v in pairs(mappings) do
            vim.keymap.set(v.mod, v.lhs, v.rhs, v.opts)
        end
    end,
}

-- LUA
require("neodev").setup({
})

require'lspconfig'.sumneko_lua.setup({
    on_attach = function ()
        for _, v in pairs(mappings) do
            vim.keymap.set(v.mod, v.lhs, v.rhs, v.opts)
        end
        vim.keymap.set('n', '<leader>t', '<Plug>PlenaryTestFile', {buffer = 0})
    end,
  settings = {
    Lua = {
      diagnostics = {
          globals = { "P", "describe", "it" },
      },
      completion = {
        --keywordSnippet = "Both",
        callSnippet = 'Replace',
      },
      workspace = {
        checkThirdParty = false
      }
    }
  }
})
