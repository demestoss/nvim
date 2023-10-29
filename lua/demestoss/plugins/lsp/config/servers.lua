local servers = {
  eslint = {},
  cssls = {},
  tailwindcss = {},
  volar = {},
  pyright = {},
  html = { "html", "twig", "hbs" },
  svelte = {},
  gopls = {},
  yamlls = {},
  bashls = {},
  rust_analyzer = {
    ["rust-analyzer"] = {
      allFeatures = true,
      diagnostics = {
        experimental = true,
      },
    },
    diagnostics = {
      experimental = true,
    },
  },
  tsserver = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayVariableTypeHintsWhenTypeMatchesName = false,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
  },
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      hint = { enable = true },
    },
  },
}

local M = {}

M.setup = function()
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local lspconfig = require("lspconfig")

  local on_attach = require("demestoss.plugins.lsp.config.keymaps").on_attach
  local capabilities = cmp_nvim_lsp.default_capabilities()

  for server_name in pairs(servers) do
    lspconfig[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    })
  end
end

M.servers = servers

return M
