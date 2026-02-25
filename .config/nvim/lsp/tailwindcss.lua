return {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		"html",
		"javascript", "javascriptreact",
		"typescript", "typescriptreact"
	},
	root_markers = { "tailwind.config.js", "tailwind.config.ts", "package.json", ".git" },
	settings = {
		tailwindCSS = {
			classFunctions = { "cva", "cx" },
		},
	}
}
