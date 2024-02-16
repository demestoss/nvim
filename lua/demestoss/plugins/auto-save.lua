return {
  "okuuva/auto-save.nvim",
  cmd = "ASToggle", -- optional for lazy loading on command
  event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
  opts = {
    execution_message = {
      enabled = false,
    },
    noautocmd = false, -- do not execute autocmds when saving
    debounce_delay = 135, -- will save after 135ms
  },
}
