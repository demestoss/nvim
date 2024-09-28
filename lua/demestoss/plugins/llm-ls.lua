return {
  "huggingface/llm.nvim",
  enabled = false,
  opts = {
    backend = "ollama",
    model = "codellama:7b",
    accept_keymap = "<Tab>",
    dismiss_keymap = "<S-Tab>",
    url = "http://localhost:11434/api/generate",
    request_body = {
      options = {
        temperature = 0.2,
        top_p = 0.95,
      },
    },
    enable_suggestions_on_startup = true,
    enable_suggestions_on_files = "*",
    lsp = {
      bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls",
    },
  },
}
