require("demestoss.core.globals")

local servers = {
  eslint = {},
  cssls = {},
  html = { filetypes = { "html", "twig", "hbs" } },
  yamlls = {},
  bashls = {},
  ansiblels = {
    filetypes = { "yaml.ansible" },
    ansible = {
      ansible = {
        path = "ansible",
        useFullyQualifiedCollectionNames = true,
      },
      ansibleLint = {
        enabled = true,
        path = "ansible-lint",
      },
      executionEnvironment = {
        enabled = false,
      },
      python = {
        interpreterPath = "python",
      },
      completion = {
        provideRedirectModules = true,
        provideModuleOptionAliases = true,
      },
    },
  },
  rust_analyzer = {
    -- isDisabledCapability = Is_Enabled("rust-tools"),
    checkOnSave = {
      command = "clippy",
    },
    diagnostics = {
      experimental = {
        enable = true,
      },
    },
  },
  tsserver = {},
  biome = {},
  tailwindcss = {},
  -- unocss = {},
  gopls = {},
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

  local on_attach = require("demestoss.config.lsp.keymaps").on_attach
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
