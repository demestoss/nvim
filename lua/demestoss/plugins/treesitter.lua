return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  build = ":TSUpdate",
  opts = {
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer" },
        goto_next_end = { ["]F"] = "@function.outer" },
        goto_previous_start = { ["[f"] = "@function.outer" },
        goto_previous_end = { ["[F"] = "@function.outer" },
      },
    },
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = {
        "go",
        "lua",
        "python",
        "rust",
        "tsx",
        "javascript",
        "typescript",
        "vimdoc",
        "vim",
        "yaml",
        "dockerfile",
        "markdown",
        "markdown_inline",
        "regex",
        "bash",
        "html",
        "css",
        "json",
        "gitignore",
        "svelte",
        "vue",
        "kdl",
      },

      -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
      auto_install = true,
      autotag = {
        enable = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },

      ignore_install = { "javascript" },

      sync_install = false,

      modules = {},

      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<M-space>",
        },
      },
    })

    require("ts_context_commentstring").setup({
      enable_autocmd = false,
      languages = {
        typescript = "// %s",
      },
    })
  end,
}
