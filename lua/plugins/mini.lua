vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.nvim', name = 'mini' },
})

require('mini.pairs').setup()
require('mini.ai').setup()
require('mini.trailspace').setup()
require('mini.surround').setup()
require('mini.icons').setup()

require('mini.statusline').setup({
    content = {
        active = function()
            --local statusline = require('mini.statusline')

            local mode, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
            local git = MiniStatusline.section_git({ trunc_width = 40 })
            local diff = MiniStatusline.section_diff({ trunc_width = 75 })
            local diagnostics = MiniStatusline.section_diagnostics({ trunc_width = 75 })
            local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
            local filename = MiniStatusline.section_filename({ trunc_width = 140 })
            local fileinfo = MiniStatusline.section_fileinfo({ trunc_width = 120 })
            local location = MiniStatusline.section_location({ trunc_width = 75 })
            local search = MiniStatusline.section_searchcount({ trunc_width = 75 })

            return MiniStatusline.combine_groups({
                { hl = mode_hl, strings = { mode }},
                { hl = 'MiniStatusLineDevifo', strings = { git, diff, diagnostics, lsp }},
                '%<',
                { hl = 'MiniStatusLineFilename', strings = { filename }},
                '%=',
                { hl = 'MiniStatuslineFileinfo', strings = { fileinfo }},
                { hl = mode_hl, strings = { search, location }},
            })
        end,
    },
})

MiniStatusline.section_fileinfo = function(args)
    local filetype = vim.bo.filetype
    if filetype == '' then return '' end

    local icon = ''
    if _G.MiniIcons ~= nil then
        icon = MiniIcons.get('filetype', filetype) .. ' '
    elseif pcall(require, 'nvim-web-devicons') then
        icon = require('nvim-web_devicons').get_icon(vim.fn.expand('%:t'), nil, { default = true }) .. ' '
    end

    if MiniStatusline.is_truncated(args.trunc_width) then
        return filetype
    end

    local size = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
    local size_str = (size < 0) and '' or string.format('%.2fKiB', size / 1024)

    return string.format('%s%s %s', icon, filetype, size_str)
end

local animate = require('mini.animate')
animate.setup({
    cursor = {
        enable = false,
    },
    scroll = {
        timing = animate.gen_timing.linear({ duration = 100, unit = 'total' }),
        subscroll = animate.gen_subscroll.equal({ max_output_steps = 60 }),
    },
})
