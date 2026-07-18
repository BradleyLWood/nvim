vim.pack.add({
    { src = 'https://github.com/folke/noice.nvim', name = 'noice' },
    { src = 'https://github.com/MunifTanjim/nui.nvim', name = 'nui' },
    { src = 'https://github.com/rcarriga/nvim-notify', name = 'notify' },
})

vim.notify = require('notify').setup({
    background_color = '#000000',
    render = 'compact',
    stages = 'slide',
})

vim.notify = require('noice').setup({
    messages = {
        enabled = true,
        view = 'mini',
        view_error = 'notify',
        view_warn = 'notify',
        view_history = 'messages',
        view_search = 'virtualtext',
    },
    notify = {
        enabled = true,
        view = 'notify',
    },
    hover = {
        enabled = false,
    },
    lsp = {
        hover = {
            enabled = false,
        },
        signature = {
            enabled = false,
        },
    },
    presets = {
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    },
})
