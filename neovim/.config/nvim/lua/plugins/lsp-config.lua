return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        --ensure_installed = { "lua_ls", "neocmake", "clangd", "julials", "marksman", "glsl_analyzer", "asm_lsp"}
        auto_install = true
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.neocmake.setup({})
      lspconfig.bitbake_language_server.setup({})
      lspconfig.clangd.setup({})
      lspconfig.julials.setup({})
      lspconfig.marksman.setup({})
      lspconfig.glsl_analyzer.setup({})
      lspconfig.asm_lsp.setup({})
      lspconfig.opencl_ls.setup({})
    end
  }
}
