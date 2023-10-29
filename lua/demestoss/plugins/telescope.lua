return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
    "nvim-tree/nvim-web-devicons",
    "ThePrimeagen/git-worktree.nvim",
  },
  config = function()
    local actions = require("telescope.actions")

    require("telescope").setup({
      defaults = {
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
      },
    })

    -- Enable telescope fzf native, if installed
    pcall(require("telescope").load_extension, "fzf")
    require("telescope").load_extension("git_worktree")

    -- See `:help telescope.builtin`
    vim.keymap.set("n", "<leader>?", require("telescope.builtin").oldfiles, { desc = "[?] Find recently opened files" })
    vim.keymap.set("n", "<leader><space>", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
    vim.keymap.set("n", "<leader>/", function()
      -- You can pass additional configuration to telescope to change theme, layout, etc.
      require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        previewer = false,
      }))
    end, { desc = "[/] Fuzzily search in current buffer" })

    vim.keymap.set("n", "<C-p>", require("telescope.builtin").git_files, { desc = "Search [G]it [F]iles" })
    vim.keymap.set("n", "<C-o>", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })

    vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", ";t", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", ";d", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", ";;", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
    vim.keymap.set(
      "n",
      "<leader>wl",
      require("telescope").extensions.git_worktree.git_worktrees,
      { desc = "[G]it [W]orktrees" }
    )

    vim.keymap.set(
      "n",
      "<leader>wa",
      require("telescope").extensions.git_worktree.create_git_worktree,
      { desc = "[G]it [C]reate [W]orktree" }
    )

    local Worktree = require("git-worktree")

    Worktree.on_tree_change(function(op, metadata)
      if op == Worktree.Operations.Switch then
        print("Switched from " .. metadata.prev_path .. " to " .. metadata.path)
      end

      if op == Worktree.Operations.Create then
        print("Creted worktree" .. metadata.path .. " on branch " .. metadata.branch)
      end

      if op == Worktree.Operations.Delete then
        print("Deleted worktree " .. metadata.path)
      end
    end)
  end,
}
