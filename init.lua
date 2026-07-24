vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Plugins

require("plugins.init")
require("config.binds")

vim.cmd('packadd nvim.undotree')
vim.keymap.set('n', '<leader>u', require('undotree').open)


-- Colors

vim.opt.termguicolors = true
vim.cmd.colorscheme("catppuccin-mocha")
vim.api.nvim_set_hl(0, "LineNr", { fg = "#6c7086" })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#cba6f7", bold = true })

-- Options

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.wo.linebreak = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.inccommand = 'split'
vim.opt.hlsearch = false
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '120'
vim.opt.showmatch = true
vim.opt.cmdheight = 1
vim.opt.completeopt = 'menuone,noinsert,noselect'
vim.opt.showmode = false
vim.opt.conceallevel = 2
vim.opt.concealcursor = ''
vim.opt.synmaxcol = 300
vim.opt.fillchars = { eob = " " }

vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 50
vim.opt.autoread = true
vim.opt.autowrite = false

vim.opt.hidden = true
vim.opt.errorbells = false
vim.opt.backspace = 'indent,eol,start'
vim.opt.iskeyword:append('-')
vim.opt.path:append('**')
vim.opt.selection = 'inclusive'

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevel = 99

vim.opt.splitbelow = true
vim.opt.splitright = true
vim.o.winborder = 'rounded'

vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.diffopt:append('linematch:60')
vim.opt.redrawtime = 10000
vim.opt.maxmempattern = 20000

vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', extends = "⟩", precedes = "⟨" }

vim.opt.termguicolors = true
vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })

-- Allow selection of empty space in line block mode
vim.opt.virtualedit = 'block'

-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})
