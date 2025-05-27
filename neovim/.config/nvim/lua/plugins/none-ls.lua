return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.asmfmt,
        null_ls.builtins.formatting.cmake_format,
        --null_ls.builtins.formatting.latexindent,
        null_ls.builtins.formatting.clang_format,

        null_ls.builtins.diagnostics.cmake_lint,
        require("none-ls.diagnostics.cpplint"),
        null_ls.builtins.diagnostics.mypy,
      }
    })
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end
}
