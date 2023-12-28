require("demestoss.core.globals")

return {
  "folke/tokyonight.nvim",
  lazy = false,
  enabled = Is_Enabled("tokyonight"),
  priority = 1000,
  opts = {},
  config = function()
    require("tokyonight").setup({
      style = "night",
    })

    vim.cmd([[colorscheme tokyonight]])
  end,
}
