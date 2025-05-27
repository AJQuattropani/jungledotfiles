return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      source = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.asmfmt,
        null_ls.builtins.formatting.cmake_format,
        null_ls.builtins.formatting.clang_format,

--        null_ls.builtins.diagnostics.cmakelang,
--        null_ls.builtins.diagnostics.cmakelint,
--        null_ls.builtins.diagnostics.cpplint,
--        null_ls.builtins.diagnostics.oelint_adv,
        null_ls.builtins.diagnostics.mypy,




      }
    })
    vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, {})
  end
}
