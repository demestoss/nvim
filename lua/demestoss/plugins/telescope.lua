return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
        borderchars = {
          prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
          results = { " " },
          preview = { " " },
        },
        mappings = {
          i = {
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
          },
          n = {
            ["q"] = actions.close,
          },
        },
        layout_config = {
          height = 0.90,
          width = 0.95,
          preview_cutoff = 0,
          horizontal = { preview_width = 0.60 },
          vertical = { width = 0.55, height = 0.9, preview_cutoff = 0 },
          prompt_position = "top",
        },
        path_display = { "smart" },
        prompt_position = "top",
        prompt_prefix = " ",
        selection_caret = " ",
        sorting_strategy = "ascending",
        vimgrep_arguments = {
          "rg",
          -- "--color=never",
          "--no-heading",
          "--hidden",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--trim",
        },
        pickers = {
          buffers = {
            prompt_prefix = "󰸩 ",
          },
          commands = {
            prompt_prefix = " ",
            layout_config = {
              height = 0.63,
              width = 0.78,
            },
          },
          command_history = {
            prompt_prefix = " ",
            layout_config = {
              height = 0.63,
              width = 0.58,
            },
          },
          git_files = {
            prompt_prefix = "󰊢 ",
            show_untracked = true,
          },
          find_files = {
            prompt_prefix = " ",
            find_command = { "fd", "-H" },
          },
          live_grep = {
            prompt_prefix = "󰱽 ",
          },
          grep_string = {
            prompt_prefix = "󰱽 ",
          },
        },
      },
      extensions = {
        frecency = {
          show_scores = true,
        },
      },
    })

    pcall(require("telescope").load_extension, "frecency")
    pcall(require("telescope").load_extension, "fzf")

    vim.keymap.set("n", "<C-e>", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
    vim.keymap.set(
      "n",
      "<leader>fh",
      require("telescope.builtin").oldfiles,
      { desc = "[?] Find recently opened files" }
    )
    vim.keymap.set("n", "<leader><space>", function()
      require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true, sort_lastused = true })
    end, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>/", function()
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })

    vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
    vim.keymap.set("n", "<C-f>", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })

    vim.keymap.set("n", "<leader>fr", "<Cmd>Telescope frecency previewer=false<CR>")

    vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>fd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>rr", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
  end,
}
