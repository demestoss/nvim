require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "isort", "black" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "prettierd", "prettier" } },
    typescriptreact = { { "prettierd", "prettier" } },
    yaml = { "yamlfix", "yamlfmt" },
    tsx = { { "prettierd", "prettier" } },
    ["*"] = { "trim_whitespace" },
  },
  format_on_save = {
    timeout_ms = 50,
    lsp_fallback = true,
  },
  format_after_save = {
    lsp_fallback = true,
  },
  log_level = vim.log.levels.ERROR,
  notify_on_error = true,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- :ConformInfo
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
