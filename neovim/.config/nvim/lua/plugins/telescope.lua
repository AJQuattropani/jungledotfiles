return {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim"},
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<C-p>', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      --vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
      require("telescope").setup({
        theme = "everforest"
      })
    end
}
