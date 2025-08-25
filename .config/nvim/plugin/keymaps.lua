vim.keymap.set({ "n", "v", "x" }, "<C-j>", "<C-d>")
vim.keymap.set({ "n", "v", "x" }, "<C-k>", "<C-u>")
vim.keymap.set({ "n", "v", "x" }, "<C-l>", "$")
vim.keymap.set({ "n", "v", "x" }, "<C-h>", "_")

vim.keymap.set("n", "J", "<Nop>")
vim.keymap.set("n", "K", "<Nop>")
vim.keymap.set("n", "L", "<Nop>")
vim.keymap.set("n", "H", "<Nop>")

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

-- vim.keymap.set("n", ":", ":<C-f>zta")
-- vim.api.nvim_create_autocmd("CmdwinEnter", {
-- 	callback = function()
-- 		vim.keymap.set("n", "<Esc>", "oclose<CR>", { buffer = true, silent = true })
-- 	end,
-- })

vim.keymap.set("n", "<leader>l", function()
	local config = vim.diagnostic.config()
	if config.virtual_text then
		vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
	else
		vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
	end
end, { desc = "Toggle lsp_lines" })
