-- leader changes
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.nofsync = true

if vim.loop.os_uname().sysname == "Linux" then
  vim.opt.shellslash = true
else
  vim.opt.shell = "powershell"
end

vim.opt.relativenumber = true
vim.opt.nu = true
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.o.clipboard = 'unnamedplus'

-- enable break inden:
vim.o.breakindent = true
vim.opt.wrap = true

-- Save undo history
vim.opt.tabstop = 2
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Indents
vim.opt.smartindent = true

--Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

--scroll
vim.opt.scrolloff = 10

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 50
-- vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true
vim.opt.isfname:append("@-@")
--vim.o.colorcolumn = "80"

vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
vim.wo.foldlevel = 20
vim.wo.conceallevel = 2
