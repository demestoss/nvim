return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    -- Additional lua configuration, makes nvim stuff amazing!
    "folke/neodev.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "williamboman/mason.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")
    local lsp_cfg = require("demestoss.config.lsp.servers")

    require("neodev").setup()
    lsp_cfg.setup()

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(lsp_cfg.servers),
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "prettier",
        "prettierd",
        "eslint_d",
        "yamlfix",
        "yamlfmt",
        "yamllint",
        "stylua",
        "codelldb",
        "beautysh",
        "ansible-lint",
      },
    })

    -- local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    local signs = { Error = ">>", Warn = ">>", Hint = "H", Info = "I" }
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
