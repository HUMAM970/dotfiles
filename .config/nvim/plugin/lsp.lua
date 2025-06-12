vim.lsp
	.enable({ 'clangd', 'gopls', 'luals' })

vim.diagnostic
	.config({
		virtual_text =
		{
			spacing = 2,
		},
		update_in_insert = true
	})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup('lspgroup', {}),
	callback = function(args)
		local client =
			assert(vim.lsp.get_client_by_id(args.data.client_id))

		local function
		set_lsp_keymap(mode, lhs, rhs, opts)
			opts = opts or {}
			opts.buffer = args.buf
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		if client:supports_method("textDocument/implementation")
		then
			set_lsp_keymap("n", "gim", vim.lsp.buf.implementation)
		end

		if client:supports_method("textDocument/codeAction")
		then
			set_lsp_keymap({ "n", "v" }, "gca", vim.lsp.buf.code_action)
		end

		if client
			:supports_method("textDocument/declaration") then
			set_lsp_keymap("n", "gD", vim.lsp.buf.declaration)
		end

		if client:supports_method("textDocument/definition") then
			set_lsp_keymap("n", "gd", vim.lsp.buf.definition)
		end

		if client
			:supports_method("textDocument/typeDefinition") then
			set_lsp_keymap("n", "gtd", vim.lsp.buf.type_definition)
		end

		if client:supports_method("textDocument/hover") then set_lsp_keymap("n", "gk", vim.lsp.buf.hover) end
	end,
})
