local function set(mode, key, binding, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, key, binding, options)
end

-- Don't move cursor when appending line below
set('n', 'J', 'mzJ`z')
-- Keep cursor centered for half page jump
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')
-- Keep cursor centered for searching
set('n', 'n', 'nzzzv')
set('n', 'N', 'Nzzzv')

-- Move selected lines up and down with <Shift>jk
set('v', 'J', ":m '>+1<CR>gv=gv")
set('v', 'K', ":m '<-2<CR>gv=gv")

set('n', '<C-n><C-n>', ':set nonumber!<CR>' )
set('n', '<C-m><C-m>', ':set relativenumber!<CR>')

-- Only add jumps greater than 5 to jump list
-- Also handle wrapped lines better
set('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "gj"', { expr = true })
set('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "gk"', { expr = true })

-- Q - "Worst place in the universe." ~ThePrimeagen
set('n', 'Q', '<nop>')

-- Execute tmux-sessionizer
set('n', '<M-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
set('n', '<leader>le', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Location list
set('n', '<leader>ll', ':lopen<cr>', { desc = 'Open LocList' })
set('n', '<leader>ld', ':lclose<cr>', { desc = 'Close LocList' })
set('n', '<leader>ln', ':lnext<cr>', { desc = 'Next LocList item' })
set('n', '<leader>lp', ':lprev<cr>', { desc = 'Prev LocList item' })

-- Quickfix list
set('n', '<leader>ql', ':copen<cr>', { desc = 'Open QFL' })
set('n', '<leader>qd', ':cclose<cr>', { desc = 'Close QFL' })
set('n', '<leader>qn', ':cnext<cr>', { desc = 'Next QFL item' })
set('n', '<leader>qp', ':cprev<cr>', { desc = 'Prev QFL item' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
set('n', '<left>', '<cmd>echo "Use h to move!"<CR>')
set('n', '<right>', '<cmd>echo "Use l to move!"<CR>')
set('n', '<up>', '<cmd>echo "Use k to move!"<CR>')
set('n', '<down>', '<cmd>echo "Use j to move!"<CR>')

-- Windows
-- Easier to use <leader>w then <C-w>
set('n', '<leader>wq', '<C-w>q', { desc = 'Close window' })
set('n', '<leader>wd', '<C-w>q', { desc = 'Close window' })
set('n', '<leader>wo', '<C-w>o', { desc = 'Close other windows' })
set('n', '<leader>wn', '<C-w>n', { desc = 'New window' })

set('n', '<leader>ww', '<C-w>p', { desc = 'Switch to previous window' })

set('n', '<leader>ws', ':split<CR><C-w>w', { desc = 'Split' })
set('n', '<leader>wvs', ':vsplit<CR><C-w>w', { desc = 'Vertifcal split' })

set('n', '<leader>wh', '<C-w>h', { desc = 'Switch to left window' })
set('n', '<leader>wj', '<C-w>j', { desc = 'Switch to down window' })
set('n', '<leader>wk', '<C-w>k', { desc = 'Switch to up window' })
set('n', '<leader>wl', '<C-w>l', { desc = 'Switch to right window' })

-- Buffers
set('n', '<leader>bj', ':bnext<CR>', { desc = 'Next' })
set('n', '<leader>bk', ':bprevious<CR>', { desc = 'Previous' })
set('n', '<leader>bl', ':buffers<CR>', { desc = 'List buffer' })
set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Close' })
set('n', '<leader>bq', ':bdelete<CR>', { desc = 'Close' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking text
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

