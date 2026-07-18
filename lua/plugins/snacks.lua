vim.pack.add({
    { src = 'https://github.com/folke/snacks.nvim', name = 'snacks' },
})

require('snacks').setup({
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = true },
    picker = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000, -- Time in ms before notification fades out
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      margin = { top = 0, right = 1, bottom = 0 }, -- Margins from editor edges
      padding = true, -- Adds padding to window
      sort = { "level", "added" }, -- Sort notifications by level and time added
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
})

local set = vim.keymap.set

-- set("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })

-- Pickers
set('n', '<leader>pf', function() Snacks.picker.files() end, { desc = 'Files' })
set('n', '<leader>pg', function() Snacks.picker.grep() end, { desc = 'Grep' })
set('n', '<leader>ph', function() Snacks.picker.help() end, { desc = 'Help' })
set('n', '<leader>pk', function() Snacks.picker.keymaps() end, { desc = 'Keymaps' })
set('n', '<leader>pb', function() Snacks.picker.buffers() end, { desc = 'Buffers' })
set('n', '<leader>pB', function() Snacks.picker.lines() end, { desc = 'Buffers Lines' })
set('n', '<leader>s/', function() Snacks.picker.search_history() end, { desc = 'Search History' })
set('n', '<leader>:', function() Snacks.picker.command_history() end, { desc = 'Command History' })
set('n', '<leader>n', function() Snacks.picker.notifications() end, { desc = 'Notification History' })
set('n', '<leader>pr', function() Snacks.picker.recent() end, { desc = 'Recent' })
set('n', '<leader>pw', function() Snacks.picker.grep_word() end, { desc = 'Visual selection search' })
set('n', '<leader>pw', function() Snacks.picker.grep_word() end, { desc = 'Visual selection search' })
