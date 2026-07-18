vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.statusline', name = 'mini.statusline' },
    --{ src = 'https://github.com/nvim-mini/mini.git', name = 'mini.git' },
    --{ src = 'https://github.com/nvim-mini/mini.diff', name = 'mini.diff' },
    { src = 'https://github.com/nvim-mini/mini.animate', name = 'mini.animate' },
    { src = 'https://github.com/nvim-mini/mini.pairs', name = 'mini.pairs' },
    { src = 'https://github.com/nvim-mini/mini.surround', name = 'mini.surround' },
    { src = 'https://github.com/nvim-mini/mini.ai', name = 'mini.ai' },
    { src = 'https://github.com/nvim-mini/mini.trailspace', name = 'mini.trailspace' },
    { src = 'https://github.com/nvim-mini/mini.icons', name = 'mini.icons' },
})

require('mini.pairs').setup()
require('mini.ai').setup()
require('mini.trailspace').setup()
require('mini.surround').setup()
require('mini.icons').setup()

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
