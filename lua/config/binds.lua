local function map(mode, key, binding, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, key, binding, options)
end

map('n', 'J',     'mzJ`z',   { desc = 'Append line below without moving cursor' })
map('n', '<C-d>', '<C-d>zz', { desc = 'Half page down, keep cursor centered' })
map('n', '<C-u>', '<C-u>zz', { desc = 'Half page up, keep cursor centered' })
map('n', 'n',     'nzzzv',   { desc = 'Next search result, keep cursor centered' })
map('n', 'N',     'Nzzzv',   { desc = 'Previous search result, keep cursor centered' })

map('v', 'J', ":m '>+1<cr>gv=gv", { desc = 'Move selection down' })
map('v', 'K', ":m '<-2<cr>gv=gv", { desc = 'Move selection up' })

map('x',          '<leader>p', '"_dP', { desc = 'Paste without yanking' })
map({ 'n', 'v' }, '<leader>x', '"_d',  { desc = 'Delete without yanking' })

map('n', '<C-n><C-n>', ':set nonumber!<cr>',       { desc = 'Toggle line numbers' })
map('n', '<C-m><C-m>', ':set relativenumber!<cr>', { desc = 'Toggle relative line numbers' })

-- Only add jumps greater than 5 to jump list
-- Also handle wrapped lines better
map('n', 'j', '(v:count > 5 ? "m\'" . v:count : "") . "gj"', { expr = true, desc = 'Jump forward, improved' })
map('n', 'k', '(v:count > 5 ? "m\'" . v:count : "") . "gk"', { expr = true, desc = 'Jump backward, improved' })

-- Q - "Worst place in the universe." ~ThePrimeagen
-- Disable Ex mode. Can still get there with gQ
map('n', 'Q', '<nop>')

map('n', '<M-f>', '<cmd>silent !tmux neww tmux-sessionizer<cr>', { desc = 'Run tmux-sessionizer' })

-- Diagnostic keymaps
map('n', '[d',         vim.diagnostic.goto_prev,  { desc = 'Go to previous Diagnostic message' })
map('n', ']d',         vim.diagnostic.goto_next,  { desc = 'Go to next Diagnostic message' })
map('n', '<leader>e',  vim.diagnostic.open_float, { desc = 'Show diagnostic Error messages' })
map('n', '<leader>le', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix list' })

-- Location list
map('n', '<leader>ll', '<cmd>lopen<cr>',  { desc = 'Open LocList' })
map('n', '<leader>ld', '<cmd>lclose<cr>', { desc = 'Close LocList' })
map('n', '<leader>ln', '<cmd>lnext<cr>',  { desc = 'Next LocList item' })
map('n', '<leader>lp', '<cmd>lprev<cr>',  { desc = 'Prev LocList item' })

-- Quickfix list
map('n', '<leader>ql', '<cmd>copen<cr>',  { desc = 'Open QFL' })
map('n', '<leader>qd', '<cmd>cclose<cr>', { desc = 'Close QFL' })
map('n', '<leader>qn', '<cmd>cnext<cr>',  { desc = 'Next QFL item' })
map('n', '<leader>qp', '<cmd>cprev<cr>',  { desc = 'Prev QFL item' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
map('n', '<left>',  '<cmd>echo "Use h to move!"<cr>')
map('n', '<right>', '<cmd>echo "Use l to move!"<cr>')
map('n', '<up>',    '<cmd>echo "Use k to move!"<cr>')
map('n', '<down>',  '<cmd>echo "Use j to move!"<cr>')

-- Windows
-- Easier to use <leader>w then <C-w>
map('n', '<leader>wq', '<C-w>q', { desc = 'Close window' })
map('n', '<leader>wd', '<C-w>q', { desc = 'Close window' })
map('n', '<leader>wo', '<C-w>o', { desc = 'Close other windows' })
map('n', '<leader>wn', '<C-w>n', { desc = 'New window' })

map('n', '<leader>ww', '<C-w>p', { desc = 'Switch to previous window' })

map('n', '<leader>ws',  '<cmd>split<cr><C-w>w',  { desc = 'Horizontal split' })
map('n', '<leader>wvs', '<cmd>vsplit<cr><C-w>w', { desc = 'Vertifcal split' })

map('n', '<leader>wh', '<C-w>h', { desc = 'Switch to left window' })
map('n', '<leader>wj', '<C-w>j', { desc = 'Switch to down window' })
map('n', '<leader>wk', '<C-w>k', { desc = 'Switch to up window' })
map('n', '<leader>wl', '<C-w>l', { desc = 'Switch to right window' })

map('n', '<C-Down>',  '<cmd>resize -5<cr>',          { desc = 'Resize window decrease height' })
map('n', '<C-Up>',    '<cmd>resize +5<cr>',          { desc = 'Resize window increase height' })
map('n', '<C-Left>',  '<cmd>vertical resize -5<cr>', { desc = 'Resize window decrease width' })
map('n', '<C-Right>', '<cmd>vertical resize +5<cr>', { desc = 'Resize window increase width' })

map('n', '<leader>bj', '<cmd>bnext<cr>',     { desc = 'Next buffer' })
map('n', '<leader>bk', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
map('n', '<leader>bl', '<cmd>buffers<cr>',   { desc = 'List buffers' })
map('n', '<leader>bq', '<cmd>bdelete<cr>',   { desc = 'Close buffer' })
map('n', '<leader>bd', '<cmd>bdelete<cr>',   { desc = 'Close buffer' })

-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

