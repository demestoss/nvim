require("demestoss.core.globals")

return {
  "catppuccin/nvim",
  enabled = Is_Enabled("catppuccin"),
  dependencies = {
    "freddiehaddad/feline.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "xiyaowong/transparent.nvim",
      config = function()
        require("transparent").setup({ -- Optional, you don't have to run setup.
          exclude_groups = {
            -- "NormalNC",
          },
          extra_groups = {
            "NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
            "NvimTreeNormal", -- NvimTree
          },
        })
      end,
    },
  },
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.flamingo },
          TabLineSel = { bg = colors.pink },
          CmpBorder = { fg = colors.surface2 },
          Pmenu = { bg = colors.none },
        }
      end,
    })

    require("catppuccin").setup({
      highlight_overrides = {
        mocha = function(mocha)
          return {
            CursorLineNr = { fg = mocha.flamingo },
            CursorLineNR = { fg = mocha.flamingo },
          }
        end,
      },
    })

    vim.cmd.colorscheme("catppuccin-mocha")

    local clrs = require("catppuccin.palettes").get_palette()
    local ctp_feline = require("catppuccin.groups.integrations.feline")

    ctp_feline.setup({
      assets = {
        mode_icon = "",
        left_separator = " ",
        right_separator = " ",
        dir = "󰉖",
        file = "󰈙",
        lsp = {
          server = "󰅡",
          error = "",
          warning = "",
          info = "",
          hint = "",
        },
        git = {
          branch = "",
          added = "",
          changed = "",
          removed = "",
        },
      },
      mode_colors = {
        ["n"] = { "NORMAL", clrs.lavender },
        ["no"] = { "N-PENDING", clrs.lavender },
        ["i"] = { "INSERT", clrs.green },
        ["ic"] = { "INSERT", clrs.green },
        ["t"] = { "TERMINAL", clrs.green },
        ["v"] = { "VISUAL", clrs.flamingo },
        ["V"] = { "V-LINE", clrs.flamingo },
        ["�"] = { "V-BLOCK", clrs.flamingo },
        ["R"] = { "REPLACE", clrs.maroon },
        ["Rv"] = { "V-REPLACE", clrs.maroon },
        ["s"] = { "SELECT", clrs.maroon },
        ["S"] = { "S-LINE", clrs.maroon },
        ["�"] = { "S-BLOCK", clrs.maroon },
        ["c"] = { "COMMAND", clrs.peach },
        ["cv"] = { "COMMAND", clrs.peach },
        ["ce"] = { "COMMAND", clrs.peach },
        ["r"] = { "PROMPT", clrs.teal },
        ["rm"] = { "MORE", clrs.teal },
        ["r?"] = { "CONFIRM", clrs.mauve },
        ["!"] = { "SHELL", clrs.green },
      },
    })

    require("feline").setup({
      components = ctp_feline.get(),
    })
  end,
}
