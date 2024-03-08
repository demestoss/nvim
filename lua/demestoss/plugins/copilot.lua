return {
  "zbirenbaum/copilot.lua",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    "zbirenbaum/copilot-cmp",
  },
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        rust = false,
        sh = function()
          if string.find(vim.api.nvim_buf_get_name(0), "work") then
            return false
          end
          return true
        end,
      },
    })

    require("copilot_cmp").setup()
  end,
}
