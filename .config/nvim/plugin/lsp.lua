vim.lsp.enable({
	"rust-analyzer",
	"clangd",
	"gopls",
	"luals",
})

vim.diagnostic.config({
	virtual_text = {
		spacing = 2,
	},
	update_in_insert = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lspgroup", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		local function set_lsp_keymap(mode, lhs, rhs, opts)
			opts = opts or {}
			opts.buffer = args.buf
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		if client:supports_method("textDocument/implementation") then
			set_lsp_keymap("n", "gim", vim.lsp.buf.implementation)
		end

		if client:supports_method("textDocument/codeAction") then
			set_lsp_keymap({ "n", "v" }, "gca", vim.lsp.buf.code_action)
		end

		if client:supports_method("textDocument/declaration") then
			set_lsp_keymap("n", "gD", vim.lsp.buf.declaration)
		end

		if client:supports_method("textDocument/definition") then
			set_lsp_keymap("n", "gd", vim.lsp.buf.definition)
		end

		if client:supports_method("textDocument/typeDefinition") then
			set_lsp_keymap("n", "gtd", vim.lsp.buf.type_definition)
		end

		if client:supports_method("textDocument/hover") then
			set_lsp_keymap("n", "gk", vim.lsp.buf.hover)
		end

		-- if client:supports_method('textDocument/completion') then
		-- 	vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		-- end

		if client.name ~= "luals" then
			if
				not client:supports_method("textDocument/willSaveWaitUntil")
				and client:supports_method("textDocument/formatting")
			then
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = vim.api.nvim_create_augroup("lspgroup", { clear = false }),
					buffer = args.buf,
					callback = function()
						vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 500 })
					end,
				})
			end
		end
	end,
})
