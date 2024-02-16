return {
  "VidocqH/lsp-lens.nvim",
  config = function()
    require("lsp-lens").setup({
      enable = true,
      include_declaration = false, -- Reference include declaration
      sections = { -- Enable / Disable specific request, formatter example looks 'Format Requests'
        definition = false,
        references = function(count)
          return "refs: " .. count
        end,
        implements = function(count)
          return "imps: " .. count
        end,
      },
    })
  end,
}
