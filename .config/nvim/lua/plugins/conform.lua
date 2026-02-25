return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			lua             = { "stylua" },
			json            = { "biome" },
			javascript      = { "biome" },
			javascriptreact = { "biome" },
			typescript      = { "biome" },
			typescriptreact = { "biome" },
			html            = { "superhtml" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback"
		},
	},
}
