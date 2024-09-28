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
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
