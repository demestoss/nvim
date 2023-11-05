return {
  "github/copilot.vim",
  config = function()
    vim.g.copilot_filetypes = {
      rust = false,
    }
  end,
}
