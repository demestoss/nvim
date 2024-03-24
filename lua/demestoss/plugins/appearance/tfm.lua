require("demestoss.core.globals")

return {
  "rolv-apneseth/tfm.nvim",
  lazy = false,
  enabled = Is_Enabled("tfm.nvim"),
  opts = {
    replace_netrw = true,
    file_manager = "yazi",
    keybindings = {
      ["<ESC>"] = "q",
    },
    ui = {
      border = "none",
    },
  },
  keys = {
    {
      "<leader>x",
      function()
        require("tfm").open()
      end,
      desc = "TFM",
    },
  },
}
