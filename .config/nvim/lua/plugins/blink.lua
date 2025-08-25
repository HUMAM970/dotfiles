return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "1.*",

	opts = {
		keymap = {
			preset = "default",
		},
		completion = {
			-- ghost_text = { enabled = true },
			menu = {
				auto_show = false,
			},
		},
		appearance = {
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
	},
	opts_extend = { "sources.default" },
}
