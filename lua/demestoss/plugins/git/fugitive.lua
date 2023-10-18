return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gl", vim.cmd.Git)
  end,
}
