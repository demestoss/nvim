-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set("n", "<leader>e", ":Neotree toggle reveal<CR>", { silent = true })
vim.keymap.set("n", "<leader>x", ":Neotree toggle current reveal<CR>", { silent = true })

vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

vim.keymap.set("v", "<leader>p", '"_dP')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", 'gg"+yG')

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>-", ":nohls<CR>")

vim.keymap.set("n", "<leader><CR>", ":so ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "<leader>X", ":!chmod +x %<CR>")

vim.api.nvim_create_user_command("Cppath", function()
  local path = vim.fn.expand("%")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to the clipboard!')
end, {})

vim.keymap.set("n", "<leader>cp", ":Cppath<CR>", { desc = "[C]opy File [P]ath" })

vim.keymap.set("n", "<leader>o", ":silent !tmux neww tt<CR>", { silent = true })

vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<CR>", { silent = true })
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<CR>", { silent = true })
-- vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lprev<CR>zz")
