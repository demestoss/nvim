return {
  "zbirenbaum/copilot.lua",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    "zbirenbaum/copilot-cmp",
  },
  config = function()
    vim.g.copilot_filetypes = {
      rust = false,
    }

    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
    })

    require("copilot_cmp").setup()
  end,
}
