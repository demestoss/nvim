require("demestoss.core.globals")

return {
  "mrcjkb/rustaceanvim",
  enabled = Is_Enabled("rust-tools"),
  version = "^3", -- Recommended
  ft = { "rust" },
  config = function()
    vim.g.rustaceanvim = {
      -- Plugin configuration
      tools = {},
      -- LSP configuration
      server = {
        on_attach = function(client, bufnr)
          -- you can also put keymaps in here
        end,
        settings = {
          -- rust-analyzer language server configuration
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
            },
          },
        },
      },
      -- DAP configuration
      dap = {},
    }

    local bufnr = vim.api.nvim_get_current_buf()

    vim.keymap.set("n", "<leader>ca", function()
      vim.cmd.RustLsp("codeAction")
    end, { silent = true, buffer = bufnr })

    vim.keymap.set("n", "<leader>ha", function()
      vim.cmd.RustLsp({ "hover", "actions" })
    end, { silent = true, buffer = bufnr })
  end,
}
