return {
  "stevearc/conform.nvim",
  lazy = true,
  event = "VeryLazy",
  config = function()
    local util = require("conform.util")
    require("conform").setup({
      formatters = {
        prettier = {
          cwd = util.root_file({
            -- https://prettier.io/docs/en/configuration.html
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json",
            ".prettierrc.js",
            ".prettierrc.cjs",
            ".prettierrc.toml",
            "prettier.config.js",
            "prettier.config.cjs",
          }),
          require_cwd = true,
        },
        prettierd = {
          cwd = util.root_file({
            -- https://prettier.io/docs/en/configuration.html
            ".prettierrc",
            ".prettierrc.json",
            ".prettierrc.yml",
            ".prettierrc.yaml",
            ".prettierrc.json5",
            ".prettierrc.js",
            ".prettierrc.cjs",
            ".prettierrc.toml",
            "prettier.config.js",
            "prettier.config.cjs",
          }),
          require_cwd = true,
        },
      },
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "isort", "black" },
        javascript = { { "prettierd", "prettier" } },
        javascriptreact = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        vue = { { "prettierd", "prettier" } },
        svelte = { { "prettierd", "prettier" } },
        typescriptreact = { { "prettier", "prettierd" } },
        css = { "prettier" },
        html = { "prettier" },
        json = { "prettier" },
        markdown = { "prettier" },
        yaml = { "yamlfix", "yamlfmt" },
        tsx = { { "prettierd", "prettier" } },
        sh = { "beautysh" },
        rust = { "rustfmt" },
        ["*"] = { "codespell" },
        ["_"] = { "codespell" },
      },
      format_on_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { lsp_fallback = true }
      end,
      format_after_save = function(bufnr)
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end
        return { lsp_fallback = true }
      end,
      log_level = vim.log.levels.ERROR,
      notify_on_error = true,
    })

    -- Disable format on save
    vim.g.disable_autoformat = true

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      require("conform").format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })

    local opts = {}

    opts.desc = "Conform [F]ormat [B]uffer"
    vim.keymap.set("n", "<leader>fb", ":Format<CR>", opts)

    -- :ConformInfo
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,
}
