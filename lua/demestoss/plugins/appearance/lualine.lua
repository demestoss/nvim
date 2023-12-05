require("demestoss.core.globals")

return {
  "nvim-lualine/lualine.nvim",
  enabled = Is_Enabled("lualine.nvim"),
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local kanagawa = require("demestoss.config.lualine.kanagawa")

    require("lualine").setup({
      options = {
        theme = Is_Enabled("kanagawa.nvim") and kanagawa or "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = { { "branch", icons_enabled = false, icon = nil } },
        lualine_x = { { "filetype", icon_only = true }, { "filename", path = 1 } },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
