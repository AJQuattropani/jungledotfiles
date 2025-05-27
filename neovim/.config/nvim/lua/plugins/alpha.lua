return {
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local ascii = require("ascii")
      dashboard.section.header.val = ascii.art.text.slogons.arch_btw_doom
      --dashboard.section.header.val = ascii.art.planets.planets.saturn_plus
      --dashboard.section.header.val = ascii.art.animals.lions.prowly
      --dashboard.section.header.val = ascii.art.animals.pandas.oreo

      alpha.setup(dashboard.opts)
    end,
  },
  {
    "MaximilianLloyd/ascii.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
  }
}
