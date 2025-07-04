return {
  "klen/nvim-config-local",
  config = function()
    require("config-local").setup({
      config_files = { ".clangd.lua", ".nvim.lua", ".nvimrc" },
      hashfile = vim.fn.stdpath("data") .. "/config-local",
      autocommands_create = true,
      commands_create = true,
      silent = false,
      lookup_parents = false
    })
  end,
}
