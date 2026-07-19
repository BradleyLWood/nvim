vim.pack.add({
	{ src = 'https://github.com/stevearc/conform.nvim', name = 'conform' },
	{ src = 'https://github.com/mfussenegger/nvim-lint', name = 'lint' },
})

require('conform').setup({
	formatters_by_ft = {
		lua = { 'stylua' },
		javascript = { 'prettier' },
		typescriptreact = { 'prettier' },
		typescript = { 'prettier' },
		html = { 'prettier' },
		python = { 'black' },
		nix = { 'alejandra' },
		css = { 'prettier' },
		rust = { 'rustfmt' },
	},
  formatters = {
    ocamlformat = {
      prepend_args = {
        '--if-then-else',
        'vertical',
        '--break-cases',
        'fit-or-vertical',
        '--type-decl',
        'sparse',
      },
    },
  },
	format_on_save = false,
	undojoin = true,
})

local lint = require('lint')

-- Only show diagnostics close to the cursor
vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		prefix = function(diagnostic)
			local icons = {
				[vim.diagnostic.severity.ERROR] = ' ',
				[vim.diagnostic.severity.WARN] = '󰉀 ',
				[vim.diagnostic.severity.INFO] = ' ',
				[vim.diagnostic.severity.HINT] = '󰌵 ',
			}
			return icons[diagnostic.severity] or ''
		end,
	},
	signs = false,
	underline = true,
	update_in_insert = false,
})

-- Auto-run the linter only for the configured filetypes
vim.api.nvim_create_autocmd('BufWritePost', {
	callback = function()
		local ft = vim.bo.filetype
		if lint.linters_by_ft[ft] then
			lint.try_lint()
		end
	end,
})


local function map(mode, key, binding, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, key, binding, options)
end

map('n', '<leader>f',
  function() require('conform').format({ async = true, lsp_fallback = true }) end,
	{ desc = 'Format buffer'}
)

