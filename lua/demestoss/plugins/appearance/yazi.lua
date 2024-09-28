---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  lazy = false,
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>x",
      function()
        require("yazi").yazi()
      end,
      desc = "Open the file manager",
    },
    {
      -- Open in the current working directory
      "<leader>cw",
      function()
        require("yazi").yazi(nil, vim.fn.getcwd())
      end,
      desc = "Open the file manager in nvim's working directory",
    },
  },
  ---@type YaziConfig
  opts = {
    open_for_directories = true,
  },
  config = function()
    require("yazi").setup()
  end,
}
