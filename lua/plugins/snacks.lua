vim.pack.add({
    { src = 'https://github.com/folke/snacks.nvim', name = 'snacks' },
})

require('snacks').setup({
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = true },
    picker = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000,
      width = { min = 40, max = 0.4 },
      height = { min = 1, max = 0.6 },
      margin = { top = 0, right = 1, bottom = 0 },
      padding = true,
      sort = { "level", "added" },
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
})

local set = vim.keymap.set

-- Pickers
set('n', '<leader>sf', function() Snacks.picker.files() end, { desc = 'Files' })
set('n', '<leader>sg', function() Snacks.picker.grep() end, { desc = 'Grep' })
set('n', '<leader>sh', function() Snacks.picker.help() end, { desc = 'Help' })
set('n', '<leader>sk', function() Snacks.picker.keymaps() end, { desc = 'Keymaps' })
set('n', '<leader>sb', function() Snacks.picker.buffers() end, { desc = 'Buffers' })
set('n', '<leader>sB', function() Snacks.picker.lines() end, { desc = 'Buffers Lines' })
set('n', '<leader>/',  function() Snacks.picker.search_history() end, { desc = 'Search History' })
set('n', '<leader>:',  function() Snacks.picker.command_history() end, { desc = 'Command History' })
set('n', '<leader>sc', function() Snacks.picker.commands() end, { desc = 'Commands' })
set('n', '<leader>n',  function() Snacks.picker.notifications() end, { desc = 'Notification History' })
set('n', '<leader>sr', function() Snacks.picker.recent() end, { desc = 'Recent' })
set('n', '<leader>sw', function() Snacks.picker.grep_word() end, { desc = 'Visual selection search' })


set('n', '<leader>s"', function() Snacks.picker.registers() end, { desc = 'Registers' })
set('n', '<leader>sj', function() Snacks.picker.jumps() end, { desc = 'Jumps' })
set('n', '<leader>sk', function() Snacks.picker.keymaps() end, { desc = 'Keymaps' })
set('n', '<leader>sl', function() Snacks.picker.loclist() end, { desc = 'Location List' })
set('n', '<leader>sm', function() Snacks.picker.marks() end, { desc = 'Marks' })
set('n', '<leader>sM', function() Snacks.picker.man() end, { desc = 'Man Pages' })
set('n', '<leader>sp', function() Snacks.picker.lazy() end, { desc = 'Search for Plugin Spec' })
set('n', '<leader>sq', function() Snacks.picker.qflist() end, { desc = 'Quickfix List' })
set('n', '<leader>sR', function() Snacks.picker.resume() end, { desc = 'Resume' })
set('n', '<leader>su', function() Snacks.picker.undo() end, { desc = 'Undo History' })


set('n', '<leader>sd', function() Snacks.picker.diagnostics_buffer() end, { desc = 'Buffer Diagnostics' })
set('n', '<leader>sD', function() Snacks.picker.diagnostics() end, { desc = 'Diagnostics' })
set('n', '<leader>ss', function() Snacks.picker.lsp_symbols() end, { desc = 'LSP Symbols' })
set('n', '<leader>sS', function() Snacks.picker.lsp_workspace_symbols() end, { desc = 'LSP Workspace Symbols' })
set('n', 'gd',         function() Snacks.picker.lsp_definitions() end, { desc = 'Goto Definition' })
set('n', 'gD',         function() Snacks.picker.lsp_declarations() end, { desc = 'Goto Declaration' })
set('n', 'gr',         function() Snacks.picker.lsp_references() end, { nowait = true, desc = 'References' })
set('n', 'gI',         function() Snacks.picker.lsp_implementations() end, { desc = 'Goto Implementation' })
set('n', 'gt',         function() Snacks.picker.lsp_type_definitions() end, { desc = 'Goto Type Definition' })


set('n', '<leader>gb', function() Snacks.picker.git_branches() end, { desc = 'Git Branches' })
set('n', '<leader>gl', function() Snacks.picker.git_log() end, { desc = 'Git Log' })
set('n', '<leader>gL', function() Snacks.picker.git_log_line() end, { desc = 'Git Log Line' })
set('n', '<leader>gs', function() Snacks.picker.git_status() end, { desc = 'Git Status' })
set('n', '<leader>gS', function() Snacks.picker.git_stash() end, { desc = 'Git Stash' })
set('n', '<leader>gd', function() Snacks.picker.git_diff() end, { desc = 'Git Diff (Hunks)' })
set('n', '<leader>gf', function() Snacks.picker.git_log_file() end, { desc = 'Git Log File' })


set('n', '<leader>si', function() Snacks.picker.icons() end, { desc = 'Icons' })

set('n', '<leader>z',  function() Snacks.zen() end, { desc = 'Toggle Zen Mode' })
set('n', '<leader>Z',  function() Snacks.zen.zoom() end, { desc = 'Toggle Zoom' })

set('n', '<leader>.',  function() Snacks.scratch() end, { desc = 'Scratch Buffer' })
