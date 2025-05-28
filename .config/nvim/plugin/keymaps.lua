local set = vim.keymap.set

set({ "n", "v", "x" }, "J", "<C-d>")
set({ "n", "v", "x" }, "K", "<C-u>")
set({ "n", "v", "x" }, "L", "$")
set({ "n", "v", "x" }, "H", "_")

set("n", "<M-j>", "<c-w><c-j>")
set("n", "<M-k>", "<c-w><c-k>")
set("n", "<M-l>", "<c-w><c-l>")
set("n", "<M-h>", "<c-w><c-h>")

set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

set("n", "<leader>h", ":nohl<CR>")
set({ "n", "v", "x" }, "m", "%")

vim.diagnostic.config({
	virtual_text = {
		spacing = 2,
	},
	update_in_insert = true,
})

set("n", "<leader>l", function()
	local config = vim.diagnostic.config()
	if config.virtual_text then
		vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
	else
		vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
	end
end, { desc = "Toggle lsp_lines" })
