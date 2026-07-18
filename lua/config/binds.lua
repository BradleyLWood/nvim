-- Don't move cursor when appending line below
vim.keymap.set('n', 'J', 'mzJ`z')
-- Keep cursor centered for half page jump
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- Keep cursor centered for searching
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Move selected lines up and down with <Shift>jk
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', '<C-n><C-n>', ':set number!<CR>', {})
vim.keymap.set('n', '<C-m><C-m>', ':set relativenumber!<CR>', {})

-- Only add jumps greater than 5 to jump list
-- Also handle wrapped lines better
vim.keymap.set('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "gj"', { noremap = true, silent = true, expr = true })
vim.keymap.set('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "gk"', { noremap = true, silent = true, expr = true })

-- Q - "Worst place in the universe." ~ThePrimeagen
vim.keymap.set('n', 'Q', '<nop>')

-- Execute tmux-sessionizer
vim.keymap.set('n', '<M-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

vim.keymap.set("n", "<leader>u", require("undotree").open)

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>le', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Location list
vim.keymap.set('n', '<leader>ll', ':lopen<cr>', { noremap = true, silent = true, desc = 'Open LocList' })
vim.keymap.set('n', '<leader>ld', ':lclose<cr>', { noremap = true, silent = true, desc = 'Close LocList' })
vim.keymap.set('n', '<leader>ln', ':lnext<cr>', { noremap = true, silent = true, desc = 'Next LocList item' })
vim.keymap.set('n', '<leader>lp', ':lprev<cr>', { noremap = true, silent = true, desc = 'Prev LocList item' })

-- Quickfix list
vim.keymap.set('n', '<leader>ql', ':copen<cr>', { noremap = true, silent = true, desc = 'Open QFL' })
vim.keymap.set('n', '<leader>qd', ':cclose<cr>', { noremap = true, silent = true, desc = 'Close QFL' })
vim.keymap.set('n', '<leader>qn', ':cnext<cr>', { noremap = true, silent = true, desc = 'Next QFL item' })
vim.keymap.set('n', '<leader>qp', ':cprev<cr>', { noremap = true, silent = true, desc = 'Prev QFL item' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!"<CR>')

-- Conflict with harpoon
--vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
--vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
--vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
--vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Windows
-- Easier to use <leader>w then <C-w>
vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'Close window' })
vim.keymap.set('n', '<leader>wd', '<C-w>q', { desc = 'Close window' })
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Close other windows' })
vim.keymap.set('n', '<leader>wn', '<C-w>n', { desc = 'New window' })

vim.keymap.set('n', '<leader>ww', '<C-w>p', { desc = 'Switch to previous window' })

vim.keymap.set('n', '<leader>ws', ':split<CR><C-w>w', { desc = 'Split' })
vim.keymap.set('n', '<leader>wvs', ':vsplit<CR><C-w>w', { desc = 'Vertifcal split' })

vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'Switch to left window' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'Switch to down window' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'Switch to up window' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'Switch to right window' })

-- Buffers
vim.keymap.set('n', '<leader>bj', ':bnext<CR>', { desc = 'Next' })
vim.keymap.set('n', '<leader>bk', ':bprevious<CR>', { desc = 'Previous' })
vim.keymap.set('n', '<leader>bl', ':buffers<CR>', { desc = 'List buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { desc = 'Close' })
vim.keymap.set('n', '<leader>bq', ':bdelete<CR>', { desc = 'Close' })

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

