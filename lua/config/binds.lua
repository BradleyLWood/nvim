local function map(mode, key, binding, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, key, binding, options)
end

-- Don't move cursor when appending line below
map('n', 'J', 'mzJ`z')
-- Keep cursor centered for half page jump
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
-- Keep cursor centered for searching
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Move selected lines up and down with <Shift>jk
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")

map('n', '<C-n><C-n>', ':set nonumber!<CR>' )
map('n', '<C-m><C-m>', ':set relativenumber!<CR>')

-- Only add jumps greater than 5 to jump list
-- Also handle wrapped lines better
map('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "gj"', { expr = true })
map('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "gk"', { expr = true })

-- Q - "Worst place in the universe." ~ThePrimeagen
map('n', 'Q', '<nop>')

-- Execute tmux-sessionizer
map('n', '<M-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
map('n', '<leader>le', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Location list
map('n', '<leader>ll', ':lopen<cr>', { desc = 'Open LocList' })
map('n', '<leader>ld', ':lclose<cr>', { desc = 'Close LocList' })
map('n', '<leader>ln', ':lnext<cr>', { desc = 'Next LocList item' })
map('n', '<leader>lp', ':lprev<cr>', { desc = 'Prev LocList item' })

-- Quickfix list
map('n', '<leader>ql', ':copen<cr>', { desc = 'Open QFL' })
map('n', '<leader>qd', ':cclose<cr>', { desc = 'Close QFL' })
map('n', '<leader>qn', ':cnext<cr>', { desc = 'Next QFL item' })
map('n', '<leader>qp', ':cprev<cr>', { desc = 'Prev QFL item' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
map('n', '<left>', '<cmd>echo "Use h to move!"<CR>')
map('n', '<right>', '<cmd>echo "Use l to move!"<CR>')
map('n', '<up>', '<cmd>echo "Use k to move!"<CR>')
map('n', '<down>', '<cmd>echo "Use j to move!"<CR>')

-- Windows
-- Easier to use <leader>w then <C-w>
map('n', '<leader>wq', '<C-w>q', { desc = 'Close window' })
map('n', '<leader>wd', '<C-w>q', { desc = 'Close window' })
map('n', '<leader>wo', '<C-w>o', { desc = 'Close other windows' })
map('n', '<leader>wn', '<C-w>n', { desc = 'New window' })

map('n', '<leader>ww', '<C-w>p', { desc = 'Switch to previous window' })

map('n', '<leader>ws', ':split<CR><C-w>w', { desc = 'Split' })
map('n', '<leader>wvs', ':vsplit<CR><C-w>w', { desc = 'Vertifcal split' })

map('n', '<leader>wh', '<C-w>h', { desc = 'Switch to left window' })
map('n', '<leader>wj', '<C-w>j', { desc = 'Switch to down window' })
map('n', '<leader>wk', '<C-w>k', { desc = 'Switch to up window' })
map('n', '<leader>wl', '<C-w>l', { desc = 'Switch to right window' })

-- Buffers
map('n', '<leader>bj', ':bnext<CR>', { desc = 'Next' })
map('n', '<leader>bk', ':bprevious<CR>', { desc = 'Previous' })
map('n', '<leader>bl', ':buffers<CR>', { desc = 'List buffer' })
map('n', '<leader>bd', ':bdelete<CR>', { desc = 'Close' })
map('n', '<leader>bq', ':bdelete<CR>', { desc = 'Close' })

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

