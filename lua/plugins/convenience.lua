vim.pack.add({
    { src = "https://github.com/vladdoster/remember.nvim", name = "remember" },
	{ src = "https://github.com/Aasim-A/scrollEOF.nvim", name = "scrolleof" },
})

require('remember').setup({})

require([scrollEOF').setup({
    parter = '*',
    insert_mode = false,
    floating = true,
    disabled_filetypes = { 'terminal' },
    disabled_modes = { 't', 'nt' },
})
