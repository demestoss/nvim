vim.opt.termguicolors = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.mouse = "a"
vim.o.clipboard = "unnamedplus"
vim.o.scrolloff = 16
vim.o.showmode = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.breakindent = true
vim.o.undofile = true

vim.o.incsearch = true
vim.o.updatetime = 50

-- vim.o.colorcolumn = "80"

vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.completeopt = "menuone,noselect"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})
