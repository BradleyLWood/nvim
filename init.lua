vim.g.mapleader = " "
vim.g.maplocalleader = ","

--vim.opt.scrolloff = 10

local scrolloff = math.floor(vim.o.lines / 2) - 4
vim.opt.scrolloff = scrolloff

vim.opt.conceallevel = 1

require("plugins.init")
require("config.binds")

vim.cmd.colorscheme("catppuccin-mocha")

vim.opt.cursorline = true
vim.wo.number = true
vim.wo.relativenumber = true
vim.api.nvim_set_hl(0, "LineNr", { fg = "#6c7086" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cba6f7", bold = true })

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.o.winborder = "rounded"

vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false

vim.opt.showmode = false

vim.opt.cmdheight = 1

vim.opt.wrap = false
vim.wo.wrap = false
vim.wo.linebreak = true

vim.opt.autoindent = true
vim.opt.breakindent = true

vim.opt.updatetime = 100
vim.opt.timeoutlen = 300

vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', extends = "⟩", precedes = "⟨" }

vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

-- Allow selection of empty space in line block mode
vim.opt.virtualedit = 'block'

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.cmd('packadd nvim.undotree')
vim.keymap.set('n', '<leader>u', require('undotree').open)

