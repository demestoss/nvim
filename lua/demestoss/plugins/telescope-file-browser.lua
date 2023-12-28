require("demestoss.core.globals")

return {
  "nvim-telescope/telescope-file-browser.nvim",
  enabled = Is_Enabled("telescope-file-browser"),
  dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").load_extension("file_browser")
  end,
}
