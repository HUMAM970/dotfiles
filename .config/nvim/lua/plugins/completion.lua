return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",

	version = "1.*",

	opts = {
		keymap = {
			preset = "default",
			-- cmdline = {
			-- 	preset = "none",
			-- 	["<C-K>"] = { "accept", "fallback" },
			-- 	["<C-p>"] = { "select_prev", "fallback" },
			-- 	["<C-n>"] = { "select_next", "fallback" },
			-- },
		},
		appearance = {
			-- use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
