vim.pack.add({
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter', name = 'treesitter' },
    { src = 'https://github.com/nvim-treesitter/nvim-treesitter-context', name = 'treesitter-context' },
})

require('treesitter-context').setup()

require('nvim-treesitter').setup({
	highlight = { enable = true },
	indent = { enable = true },
})

require('nvim-treesitter').install({
	'bash',
	'html',
	'svelte',
	'latex',
	'javascript',
	'json',
	'lua',
	'markdown',
	'markdown_inline',
	'query',
	'regex',
	'tsx',
	'typescript',
	'python',
	'vim',
	'yaml',
})
