return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
    }
  },
  {
    "hrsh7th/nvim-cmp",
    config = function()
      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").lazy_load()
      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)   -- For `vsnip` users.
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require("cmp.config").set_onetime({ sources = {} })
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          -- { name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
          { name = 'buffer' },
        })
      })
      -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
      -- Set configuration for specific filetype.
      --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]] --

      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      --cmp.setup.cmdline({ '/', '?' }, {
      --  mapping = cmp.mapping.preset.cmdline(),
      --  sources = {
      --    { name = 'buffer' }
      --  }
      -- })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      --    cmp.setup.cmdline(':', {
      --     mapping = cmp.mapping.preset.cmdline(),
      --     sources = cmp.config.sources({
      --       { name = 'path' }
      --     }, {
      --       { name = 'cmdline' }
      --     }),
      --     matching = { disallow_symbol_nonprefix_matching = false }
      --   })

      -- Set up lspconfig.
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")
      lspconfig.neocmake.setup({
        capabilities = capabilities
      })
      lspconfig.clangd.setup({
        capabilities = capabilities,
        style = "_clang-format",
        on_attach = function()
          --vim.keymap.set("n", "<leader>32", )
        end,
        on_detach = function()

        end,
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.asm_lsp.setup({
        capabilities = capabilities
      })
      lspconfig.marksman.setup({
        capabilities = capabilities
      })
      lspconfig.julials.setup({
        capabilities = capabilities
      })
      lspconfig.glsl_analyzer.setup({
        capabilities = capabilities
      })
      lspconfig.opencl_ls.setup({
        capabilities = capabilities
      })
      lspconfig.bitbake_language_server.setup({
        capabilities = capabilities
      })
    end
  }
}
