vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.shiftwidth = 2
vim.o.tabstop = 2

vim.o.showbreak = "+++ "
vim.o.listchars = "trail:."
vim.o.errorbells = false
vim.o.visualbell = false

-- Mouse
vim.o.mouse = ""

vim.o.hlsearch = false
vim.o.showcmd = false

vim.wo.number = true
vim.wo.relativenumber = true
vim.o.cursorline = true

vim.o.guicursor = ""

-- vim.o.mouse = ""
vim.o.clipboard = "unnamedplus"
vim.o.scrolloff = 18
vim.o.showmode = false
vim.o.langmenu = "en_US.UTF-8"

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.breakindent = true
vim.o.undofile = true

vim.o.incsearch = true

-- vim.o.colorcolumn = "80"

vim.o.ignorecase = true
vim.o.smartcase = true
vim.cmd([[
set signcolumn=yes
" autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
]])

-- Decrease update time
vim.o.updatetime = 50
vim.o.timeoutlen = 300

vim.opt.completeopt = { "menuone", "noselect", "noinsert" }
vim.opt.shortmess = vim.opt.shortmess + { c = true }

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

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

vim.opt.termguicolors = true

vim.cmd([[
set background=light
let g:dracula_colorterm = 0
colorscheme alucard
]])
