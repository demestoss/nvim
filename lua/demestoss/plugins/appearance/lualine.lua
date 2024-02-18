return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    'AndreM222/copilot-lualine',
  },
  config = function()
    require("lualine").setup({
      options = {
        theme = "tokyonight",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "diff", "diagnostics" },
        lualine_c = { { "branch", icons_enabled = false, icon = nil } },
        lualine_x = { { "filetype", icon_only = true }, { "filename", path = 1 }, "copilot" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
    })
  end,
}
