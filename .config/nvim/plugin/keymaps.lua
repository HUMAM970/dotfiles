vim.keymap.set({ "n", "v", "x" }, "J", "<C-d>")
vim.keymap.set({ "n", "v", "x" }, "K", "<C-u>")
vim.keymap.set({ "n", "v", "x" }, "L", "$")
vim.keymap.set({ "n", "v", "x" }, "H", "_")

vim.keymap.set("n", "<M-j>", "<c-w><c-j>")
vim.keymap.set("n", "<M-k>", "<c-w><c-k>")
vim.keymap.set("n", "<M-l>", "<c-w><c-l>")
vim.keymap.set("n", "<M-h>", "<c-w><c-h>")

vim.keymap.set("n", "<M-,>", "<c-w>5<")
vim.keymap.set("n", "<M-.>", "<c-w>5>")
vim.keymap.set("n", "<M-t>", "<C-W>+")
vim.keymap.set("n", "<M-s>", "<C-W>-")

vim.keymap.set("n", "<leader>h", ":nohl<CR>")
vim.keymap.set({ "n", "v", "x" }, "m", "%")

vim.keymap.set("n", "<leader>l", function()
	local config = vim.diagnostic.config()
	if config.virtual_text then
		vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
	else
		vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
	end
end, { desc = "Toggle lsp_lines" })
