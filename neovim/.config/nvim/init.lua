vim.cmd("set shiftwidth=2")
vim.cmd("set softtabstop=2")
vim.cmd("set expandtab")

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

vim.g.mapleader = " "

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  -- Optional; default configuration will be used if setup isn't called.
  config = function() 
    require("everforest").setup({
      -- Your config here
      background="light",
      transparent_background_level = 2,
      italics = true,
      disable_italic_comments = false,
      sign_column_background = "none",
      ui_contrast = "high",
      dim_inactive_windows = false,
      diagnostic_text_highlist = false,
      diagnostic_virtual_text = "coloured",
      diagnostic_line_highlight = false,
      spell_foreground = false,
      show_eob = false,
      float_style = "bright",
      inlay_hints_background = "dimmed",
      --@param highlight_groups Highlights
      --@param palette Palette
      on_highlights = function(h1, palette)  
      end,

      --@param palette Palette
      colours_override = function(palette) 
      end,
    })
  end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = { "nvim-lua/plenary.nvim"},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {
    -- fill any relevant options here
  },
  },
}
local opts = {}
require("lazy").setup(plugins, opts)

require("everforest").load()
require("telescope").setup({
  defaults = {
    theme = "everforest"
  },
})

local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
--vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
vim.keymap.set('n', '<C-n>', ':Neotree filesystem toggle left<CR>', {})

vim.diagnostic.enable(false)

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {"lua", "c", "vim", "cpp", "cmake", "asm"},
  sync_install = false,
  highlight = {enable = true},
  indent = {enable = true},
})
