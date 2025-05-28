-- local capabilities = require("blink.cmp").get_lsp_capabilities()
local mason_lspconfig = require("mason-lspconfig")
-- local lspconfig = require("lspconfig")

-- local servers = mason_lspconfig.get_installed_servers()

-- for _, server in ipairs(servers) do
-- 	lspconfig[server].setup({
-- 		capabilities = capabilities,
-- 	})
-- end

mason_lspconfig.setup({
	automatic_enable = true,
})
