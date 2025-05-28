return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"stevearc/conform.nvim",
			"saghen/blink.cmp",
		},
		config = function()
			require("custom.mason")
			require("custom.mason-lspconfig")
			require("custom.lsp-keymaps")
			require("custom.conform")
		end,
	},
}
