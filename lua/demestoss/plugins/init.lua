return {
  "nvim-lua/plenary.nvim", -- lua functions that many plugins use
  "inkarkat/vim-ReplaceWithRegister", -- replace with register contents using motion (gr + motion)
  {
    "tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
    event = "BufReadPre",
  },
  {
    "ThePrimeagen/vim-be-good",
    event = "VeryLazy",
  },
  "mbbill/undotree",
  {
    "kdheepak/lazygit.nvim",
    event = "VeryLazy",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}
