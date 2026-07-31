vim.pack.add({
    { src = 'https://github.com/folke/snacks.nvim', name = 'snacks' },
    { src = 'https://github.com/nvim-lua/plenary.nvim', name = 'plenary' },
    { src = 'https://github.com/ThePrimeagen/harpoon', name = 'harpoon', version = 'harpoon' },
})

local function map(mode, key, binding, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, key, binding, options)
end

local harpoon = require('harpoon')
harpoon:setup()

map('n', '<leader>a', function()
    harpoon:list():add()
end, { desc = 'Add file to Harpoon' })

map('n', '<C-h>', function()
    harpoon:list():select(1)
end, { desc = 'Harpoon select 1' })

map('n', '<C-j>', function()
    harpoon:list():select(2)
end, { desc = 'Harpoon select 2' })

map('n', '<C-k>', function()
    harpoon:list():select(3)
end, { desc = 'Harpoon select 3' })

map('n', '<C-l>', function()
    harpoon:list():select(4)
end, { desc = 'Harpoon select 4' })

local harpoon_picker = {
    title = 'Harpoon',

    finder = function()
        local list = harpoon:list()
        local items = {}

        for i, item in ipairs(list.items) do
            if item and item.value and item.value:match('%S') then
                table.insert(items, {
                    idx = i,
                    text = item.value,
                    file = item.value,
                    pos = item.context and { item.context.row, item.context.col } or nil,
                    harpoon_item = item,
                })
            end
        end
        return items
    end,

    format = 'text',
    preview = 'file',
    confirm = 'jump',
    sort = { fields = { 'idx' } },

    actions = {
        harpoon_delete = function(picker)
            local list = harpoon:list()
            local selected = picker:selected({ fallback = true })

            table.sort(selected, function(a, b)
                return a.idx > b.idx
            end)

            for _, item in ipairs(selected) do
                table.remove(list.items, item.idx)
                list._length = math.max(0, (list._length or #list.items) - 1)
            end

            harpoon:sync()

            -- Refresh list
            picker:find()
            if picker:count() == 0 then
                picker:close()
            else
                picker.list:view(math.min(picker.list.cursor, picker:count()))
            end
        end,

        -- Move item up
        harpoon_move_up = function(picker, item)
            local list = harpoon:list()
            if not item or item.idx <= 1 then
                return
            end
            local i = item.idx
            list.items[i], list.items[i - 1] = list.items[i - 1], list.items[i]
            --picker:find()
            picker.list:view(i - 1)
        end,

        -- Move item down
        harpoon_move_down = function(picker, item)
            local list = harpoon:list()
            if not item or item.idx >= #list.items then
                return
            end
            local i = item.idx
            list.items[i], list.items[i + 1] = list.items[i + 1], list.items[i]
            --picker:find()
            picker.list:view(i + 1)
        end,
    },

    win = {
        input = {
            keys = {
                ['dd'] = { 'harpoon_remove', mode = { 'n' } },
                ['J'] = { 'harpoon_move_down', mode = { 'n' } },
                ['K'] = { 'harpoon_move_up', mode = { 'n' } },
            },
        },
        list = {
            keys = {
                ['dd'] = { 'harpoon_remove', mode = { 'n' } },
                ['J'] = { 'harpoon_move_down', mode = { 'n' } },
                ['K'] = { 'harpoon_move_up', mode = { 'n' } },
            },
        },
    },
}

require('snacks').setup({
    bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = true },
    indent = { enabled = true },
    picker = {
        enabled = true,
        sort = {
            fields = { 'score:desc', '#text', 'idx' },
        },
        --debug = {
        --    scores = true,
        --},
        sources = {
            harpoon = harpoon_picker,
        }
    },
    notifier = {
        enabled = true,
        timeout = 3000,
        width = { min = 40, max = 0.4 },
        height = { min = 1, max = 0.6 },
        margin = { top = 0, right = 1, bottom = 0 },
        padding = true,
        sort = { 'level', 'added' },
    },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
})

-- Pickers
map('n', '<leader>hl', function()
    Snacks.picker.pick('harpoon')
end, { desc = 'Harpoon' })

map('n', '<leader>sf', function()
    Snacks.picker.files()
end, { desc = 'Files' })
map('n', '<leader>sg', function()
    Snacks.picker.grep()
end, { desc = 'Grep' })
map('n', '<leader>sh', function()
    Snacks.picker.help()
end, { desc = 'Help' })
map('n', '<leader>sk', function()
    Snacks.picker.keymaps()
end, { desc = 'Keymaps' })
map('n', '<leader>sb', function()
    Snacks.picker.buffers()
end, { desc = 'Buffers' })
map('n', '<leader>sB', function()
    Snacks.picker.lines()
end, { desc = 'Buffers Lines' })
map('n', '<leader>/', function()
    Snacks.picker.search_history()
end, { desc = 'Search History' })
map('n', '<leader>:', function()
    Snacks.picker.command_history()
end, { desc = 'Command History' })
map('n', '<leader>sc', function()
    Snacks.picker.commands()
end, { desc = 'Commands' })
map('n', '<leader>n', function()
    Snacks.picker.notifications()
end, { desc = 'Notification History' })
map('n', '<leader>sr', function()
    Snacks.picker.recent()
end, { desc = 'Recent' })
map('n', '<leader>sw', function()
    Snacks.picker.grep_word()
end, { desc = 'Visual selection search' })
map('n', '<leader>se', function()
    Snacks.picker.explorer()
end, { desc = 'Explorer' })

map('n', "<leader>s'", function()
    Snacks.picker.registers()
end, { desc = 'Registers' })
map('n', '<leader>sj', function()
    Snacks.picker.jumps()
end, { desc = 'Jumps' })
map('n', '<leader>sk', function()
    Snacks.picker.keymaps()
end, { desc = 'Keymaps' })
map('n', '<leader>sl', function()
    Snacks.picker.loclist()
end, { desc = 'Location List' })
map('n', '<leader>sm', function()
    Snacks.picker.marks()
end, { desc = 'Marks' })
map('n', '<leader>sM', function()
    Snacks.picker.man()
end, { desc = 'Man Pages' })
map('n', '<leader>sp', function()
    Snacks.picker.lazy()
end, { desc = 'Search for Plugin Spec' })
map('n', '<leader>sq', function()
    Snacks.picker.qflist()
end, { desc = 'Quickfix List' })
map('n', '<leader>sR', function()
    Snacks.picker.resume()
end, { desc = 'Resume' })
map('n', '<leader>su', function()
    Snacks.picker.undo()
end, { desc = 'Undo History' })

map('n', '<leader>sd', function()
    Snacks.picker.diagnostics_buffer()
end, { desc = 'Buffer Diagnostics' })
map('n', '<leader>sD', function()
    Snacks.picker.diagnostics()
end, { desc = 'Diagnostics' })
map('n', '<leader>ss', function()
    Snacks.picker.lsp_symbols()
end, { desc = 'LSP Symbols' })
map('n', '<leader>sS', function()
    Snacks.picker.lsp_workspace_symbols()
end, { desc = 'LSP Workspace Symbols' })
map('n', 'gd', function()
    Snacks.picker.lsp_definitions()
end, { desc = 'Goto Definition' })
map('n', 'gD', function()
    Snacks.picker.lsp_declarations()
end, { desc = 'Goto Declaration' })
map('n', 'gr', function()
    Snacks.picker.lsp_references()
end, { nowait = true, desc = 'References' })
map('n', 'gI', function()
    Snacks.picker.lsp_implementations()
end, { desc = 'Goto Implementation' })
map('n', 'gt', function()
    Snacks.picker.lsp_type_definitions()
end, { desc = 'Goto Type Definition' })

map('n', '<leader>gb', function()
    Snacks.picker.git_branches()
end, { desc = 'Git Branches' })
map('n', '<leader>gl', function()
    Snacks.picker.git_log()
end, { desc = 'Git Log' })
map('n', '<leader>gL', function()
    Snacks.picker.git_log_line()
end, { desc = 'Git Log Line' })
map('n', '<leader>gs', function()
    Snacks.picker.git_status()
end, { desc = 'Git Status' })
map('n', '<leader>gS', function()
    Snacks.picker.git_stash()
end, { desc = 'Git Stash' })
map('n', '<leader>gd', function()
    Snacks.picker.git_diff()
end, { desc = 'Git Diff (Hunks)' })
map('n', '<leader>gf', function()
    Snacks.picker.git_log_file()
end, { desc = 'Git Log File' })

map('n', '<leader>si', function()
    Snacks.picker.icons()
end, { desc = 'Icons' })

map('n', '<leader>z', function()
    Snacks.zen()
end, { desc = 'Toggle Zen Mode' })
map('n', '<leader>Z', function()
    Snacks.zen.zoom()
end, { desc = 'Toggle Zoom' })

map('n', '<leader>.', function()
    Snacks.scratch()
end, { desc = 'Scratch Buffer' })

