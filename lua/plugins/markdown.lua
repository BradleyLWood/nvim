vim.pack.add({
    { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim', name = 'markdown' },
    {
        src = 'https://github.com/obsidian-nvim/obsidian.nvim',
        version = vim.version.range('*'), -- use latest release, remove to use latest commit
    },
})

require('render-markdown').setup({
    completions = { lsp = { enabled = true } },
    max_file_size = 10.0,
    debounce = 200,
    checkbox = {
        enabled = false,
        bullet = false,
        --right_pad = 1,
        unchecked = { icon = '☐' },
        checked = { icon = '☑' },
    },
    bullet = {
        left_pad = 2,
        right_pad = 1,
    },
})

local obsidian = require('obsidian')
obsidian.setup({
    legacy_commands = false,

    workspaces = {
        {
            name = 'vault',
            path = '~/notes/vault',
        },
        {
            name = 'work',
            path = '~/notes/work',
        },
    },

    templates = {
        folder = 'Templates',
        date_format = '%Y-%m-%d-%a',
        time_format = '%H:%M',
        substitutions = {},
    },

    frontmatter = {
        func = function(note)
            local out = { id = note.id, aliases = note.aliases, tags = note.tags }

            if note.metadata and not vim.tbl_isempty(note.metadata) then
                for k, v in pairs(note.metadata) do
                    out[k] = v
                end
            end

            if not out.created then
                out.created = os.date('%Y-%m-%d %I:%M:%S %p')
            end

            out.modified = os.date('%Y-%m-%d %I:%M:%S %p')

            return out
        end,
    },
})
obsidian.ui = { enable = false }
--obsidian.event = {
--    'BufReadPre ' .. vim.fn.expand('~') .. '/notes/*/*.md',
--    'BufNewFile ' .. vim.fn.expand('~') .. '/notes/*/*.md',
--}
