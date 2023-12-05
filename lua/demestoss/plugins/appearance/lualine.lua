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
        theme = kanagawa,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    })
  end,
}
