local M = {}

M.on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true }

  opts.buffer = bufnr

  opts.desc = "[G]oto LSP [R]eferences"
  vim.keymap.set("n", "<leader>gr", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

  opts.desc = "[G]oto LSP [R]eferences"
  vim.keymap.set("n", "gr", function()
    require("trouble").toggle("lsp_references")
  end, opts)
  -- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts) -- show definition, references

  opts.desc = "Go to declaration"
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

  opts.desc = "[G]oto LSP [D]efinition"
  vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

  opts.desc = "[G]oto LSP [I]mplementation"
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

  opts.desc = "[G]oto LSP [T]ype Definitions"
  vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

  opts.desc = "See available [C]ode [A]ctions"
  vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

  opts.desc = "Smart rename"
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

  opts.desc = "Hover documentation"
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

  opts.desc = "Go to previous diagnostic"
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

  opts.desc = "Go to next diagnostic"
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

  opts.desc = "Show line diagnostics"
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

  opts.desc = "Show buffer diagnostics"
  vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

  opts.desc = "Signature Documentation"
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

  opts.desc = "[D]ocument [S]ymbols"
  vim.keymap.set("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, opts)

  opts.desc = "[W]orkspace [S]ymbols"
  vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)
end

return M
