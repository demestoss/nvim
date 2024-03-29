return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",
  },
  config = function()
    local lsp_cfg = require("demestoss.config.lsp.servers")

    require("neodev").setup()
    lsp_cfg.setup()


    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    -- local signs = { Error = ">>", Warn = ">>", Hint = "H", Info = "I" }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type

      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.diagnostic.config({
      severity_sort = true,
      -- update_in_insert = true,
    })
  end,
}
