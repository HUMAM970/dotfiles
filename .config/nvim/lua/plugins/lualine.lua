return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				globalstatus = true,
				section_separators = { right = "", left = "" },
				component_separators = { right = "", left = "" },
				theme = "auto",
			},
			sections = {
				lualine_a = { "mode" },
				-- lualine_b = { "filename", "diff" },
				-- lualine_c = { "diagnostics" },
			},
		})
	end,
}
