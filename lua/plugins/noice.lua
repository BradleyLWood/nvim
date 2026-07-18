vim.pack.add({
    { src = 'https://github.com/folke/noice.nvim', name = 'noice' },
    { src = 'https://github.com/MunifTanjim/nui.nvim', name = 'nui' },
    --{ src = 'https://github.com/rcarriga/nvim-notify', name = 'notify' },
})

require('noice').setup({
        view = 'mini',
        view_error = 'notify',
        view_warn = 'notify',
        view_history = 'messages',
        view_search = 'virtualtext',
    messages = {
        enabled = false,
    },
    notify = {
        enabled = false,
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
