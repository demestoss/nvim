-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.cmd([[nnoremap <leader>e :Neotree toggle reveal<CR>]])
vim.cmd([[nnoremap <leader>x :Neotree toggle current reveal<CR>]])
vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)

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

vim.keymap.set("n", "<C-t>", ":silent !tmux neww tt<CR>", { silent = true })

--[[ vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz") ]]
