return {
  "windwp/nvim-ts-autotag",
  event = "VeryLazy",
  config = function()
    require("nvim-ts-autotag").setup({
      enable = true,
      enable_rename = true,
      enable_close_on_slash = false,
    })
  end,
}
