local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettierd,
		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.fixjson,
		null_ls.builtins.formatting.black.with { extra_args = { "--fast" } },
		null_ls.builtins.formatting.stylua,
	},
})
