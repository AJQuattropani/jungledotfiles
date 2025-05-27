return {
  {
    "neanias/everforest-nvim",
    version = false,
    lazy = false,
    priority = 1000, -- make sure to load this before all the other start plugins
    -- Optional; default configuration will be used if setup isn't called.
    config = function()
      local foresttheme = require("everforest")
      foresttheme.setup({
        -- Your config here
        background = "light",
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
      foresttheme.load()
    end,
  },
}
