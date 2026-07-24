vim.pack.add({
    { src = 'https://github.com/nvim-mini/mini.nvim', name = 'mini' },
})

require('mini.statusline').setup()
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
