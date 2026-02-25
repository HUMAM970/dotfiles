return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				default_file_explorer = true,
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				columns = { "icon" },
				keymaps = {
					["<C-h>"] = false,
					["<C-l>"] = false,
					["<C-k>"] = false,
					["<C-j>"] = false,
					["<M-v>"] = { "actions.select", opts = { vertical = true } },
					["<M-h>"] = { "actions.select", opts = { horizontal = true } },
				},
				view_options = {
					show_hidden = true,
				},

				float = {
					padding = 1,
				},
			})

			vim.keymap.set("n", "<leader>e",
				function()
					require("oil").toggle_float(nil, { preview = { vertical = true } }, nil)
				end
			)
		end,
	},
}
