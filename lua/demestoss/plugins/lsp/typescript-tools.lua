return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  config = function()
    local opts = {}

    opts.desc = "TS [F]ix [A]ll Errors"
    vim.keymap.set("n", "<leader>fa", ":TSToolsFixAll<CR>", opts)

    opts.desc = "TS [F]ix Missing [I]mports"
    vim.keymap.set("n", "<leader>fi", ":TSToolsAddMissingImports<CR>", opts)
  end,
}
