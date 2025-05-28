require("telescope").setup({
	defaults = {
		file_ignore_patterns = { "%.png$", "%.jpg$", "%.jpeg$", "%.gif$", "%.svg$", "%.bmp$", "%.webp$" },
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
	pickers = {
		find_files = {
			find_command = { "fd", "--type", "f", "--exclude", "node_modules", "--exclude", "build" },
		},
	},
})

require("telescope").load_extension("ui-select")
require("telescope").load_extension("fzf")

local builtin = require("telescope.builtin")
local set = vim.keymap.set

set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
set("n", "<leader>lg", builtin.live_grep, { desc = "Telescope live grep" })
set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
set("n", "<leader>ht", builtin.help_tags, { desc = "Telescope help tags" })
set("n", "<leader><leader>", builtin.oldfiles, {})
set("n", "<leader>gf", builtin.git_files)
set("n", "<leader>gs", builtin.grep_string)
set("n", "<leader>/", function()
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })
