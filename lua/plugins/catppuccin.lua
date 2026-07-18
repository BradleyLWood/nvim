vim.pack.add({
    { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
    { src = 'https://github.com/tadaa/vimade', name = 'vimade' },
})

require('catppuccin').setup({
    transparent_background = true,
    float = {
        transparent = true,
        solid = false,
    },
    show_end_of_buffer = true,
})

require('vimade').setup({
    recipe = { 'minimalis', { animate = true } },
    fadelevel = 0.6,
})
