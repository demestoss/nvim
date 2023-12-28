require("demestoss.core.globals")

return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  enabled = Is_Enabled("dressing"),
  config = function()
    require("dressing").setup({
      input = {
        mappings = {
          n = {
            ["<Esc>"] = "Close",
            ["<CR>"] = "Confirm",
          },
          i = {
            ["<C-c>"] = "Close",
            ["<CR>"] = "Confirm",
            ["<Up>"] = "HistoryPrev",
            ["<Down>"] = "HistoryNext",
          },
        },
      },
    })
  end,
}
