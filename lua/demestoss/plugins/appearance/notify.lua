require("demestoss.core.globals")

return {
  "rcarriga/nvim-notify",
  enable = Is_Enabled("nvim-notify"),
  opts = {
    timeout = 800,
    top_down = false,
  },
}
