vim.g.mapleader = " "
vim.g.compile_mode = {
	default_command = {
		c = "gcc ",
		rust = "cargo run ",
		go = "go run ",
	},
}

vim.cmd("syntax off")

vim.cmd.packadd("nvim.difftool")

vim.pack.add({
	"https://github.com/windwp/nvim-ts-autotag",

	{ src = "https://github.com/saghen/blink.cmp", branch = "v1" },

	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/ej-shafran/compile-mode.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/echasnovski/mini.pairs",
	"https://github.com/stevearc/oil.nvim", -- dependencies: "nvim-tree/nvim-web-devicons"
	"https://github.com/nvim-telescope/telescope.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

-- plugins config
require("vim._core.ui2").enable({})
require("kanagawa").setup({
	terminalColors = true,
	colors = { theme = { all = { ui = { bg_gutter = "none" } } } },
})

vim.cmd("colorscheme kanagawa")

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
	view_options = { how_hidden = true },
})
require("nvim-treesitter").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
require("mini.pairs").setup()
require("nvim-ts-autotag").setup()
require("blink.cmp").setup({
	keymap = {
		preset = "default",
		["<C-j>"] = { "select_next", "fallback" },
		["<C-k>"] = { "select_prev", "fallback" },
	},
	appearance = {
		nerd_font_variant = "mono",
		use_nvim_cmp_as_default = false,
	},
	completion = {
		documentation = { auto_show = true, auto_show_delay_ms = 0 },
		menu = {
			draw = {
				columns = {
					{ "label", "label_description", gap = 3 },
					{ "kind_icon", "kind" },
				},
			},
		},
	},
	sources = {
		default = { "lsp", "path", "buffer" },
	},

	fuzzy = {
		-- implementation = "prefer_rust_with_warning",
		sorts = {
			"sort_text",
			"score",
		},
	},
	signature = { enabled = true },
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		json = { "biome" },
		javascript = { "biome", "biome-organize-imports" },
		typescript = { "biome", "biome-organize-imports" },
		javascriptreact = { "biome", "biome-organize-imports" },
		typescriptreact = { "biome", "biome-organize-imports" },
		html = { "superhtml" },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_format = "fallback",
	},
})
require("gitsigns").setup({
	current_line_blame = false,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = "eol",
		delay = 100,
	},
})

-- options
vim.opt.timeoutlen = 300
vim.opt.inccommand = "split"
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.shada = { "'10", "<0", "s10", "h" }
vim.opt.swapfile = false
vim.opt.formatoptions:remove("o")
vim.opt.wrap = false
vim.opt.linebreak = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.shortmess:append("sI")
vim.opt.smoothscroll = true
vim.opt.completeopt = "menu,menuone,fuzzy,noinsert"
vim.opt.more = false
vim.opt.statusline = "[%n] %<%f %h%w%m%r%=%-14.(%l,%c%V%) %P"
vim.o.showmode = false
vim.o.signcolumn = "yes:1"

-- keymaps
vim.keymap.set("n", "U", "<C-r>")

vim.keymap.set("n", "0", "_")

vim.keymap.set({ "n", "v", "x" }, "J", "<C-d>")
vim.keymap.set({ "n", "v", "x" }, "K", "<C-u>")
vim.keymap.set({ "n", "v", "x" }, "L", "g_")
vim.keymap.set({ "n", "v", "x" }, "H", "_")

vim.keymap.set("n", "<C-j>", "<c-w><c-j>")
vim.keymap.set("n", "<C-k>", "<c-w><c-k>")
vim.keymap.set("n", "<C-l>", "<c-w><c-l>")
vim.keymap.set("n", "<C-h>", "<c-w><c-h>")

vim.keymap.set("n", "<M-,>", "<c-w>5<")
vim.keymap.set("n", "<M-.>", "<c-w>5>")
vim.keymap.set("n", "<M-t>", "<C-W>+")
vim.keymap.set("n", "<M-s>", "<C-W>-")

vim.keymap.set("n", "<leader>h", ":nohl<CR>")
vim.keymap.set({ "n", "v", "x" }, "m", "%")

vim.keymap.set({ "n", "v", "x" }, "ge", "Gzz")

vim.keymap.set("n", "<leader>q", ":bw<CR>")
vim.keymap.set("n", "<leader>y", ":%y<CR>")
vim.keymap.set("n", "<leader>c", ":Compile<CR>")

vim.keymap.set("n", "<leader>l", function()
	local config = vim.diagnostic.config()
	if config.virtual_text then
		vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
	else
		vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
	end
end, { desc = "Toggle lsp_lines" })

vim.keymap.set("n", "<leader>e", function()
	require("oil").toggle_float(nil, { preview = { vertical = true } }, nil)
end)

-- lsp
local lsps = {
	biome = {
		cmd = { "biome", "lsp-proxy" },
		root_markers = { "biome.json", "biome.jsonc", "package.json", ".git" },
		settings = {
			formatter = {
				lineWidth = 120,
			},
		},
	},
	pgls = {
		cmd = { "pgls", "lsp-proxy" },
		root_markers = { "postgres-language-server.jsonc", ".git" },
	},

	-- eslint = {
	-- 	cmd = { "eslint-language-server", "--stdio" },
	-- 	root_markers = { "eslint.config.js", "package.json", ".git" },
	-- },

	clangd = {
		cmd = { "clangd" },
		root_markers = {
			".clangd",
			".clang-tidy",
			".clang-format",
			"compile_commands.json",
			"compile_flags.txt",
			"configure.ac",
			".git",
		},
	},

	golint = {
		cmd = { "golangci-lint-langserver" },
		root_markers = { ".golangci.yml", ".golangci.yaml", "go.mod", "go.work", ".git" },
	},

	gopls = {
		cmd = { "gopls" },
		root_markers = { "go.mod", "go.work", ".git" },
	},

	lua_ls = {
		cmd = { "lua-language-server" },
		root_markers = {
			".luarc.json",
			".luarc.jsonc",
			".luacheckrc",
			".stylua.toml",
			"stylua.toml",
			"selene.toml",
			"selene.yml",
			".git",
		},
	},

	rust_ls = {
		cmd = { "rust-analyzer" },
		root_markers = { "Cargo.lock", "Cargo.toml", ".git" },
	},

	superhtml = {
		cmd = { "superhtml", "lsp" },
	},

	tailwind_ls = {
		cmd = { "tailwindcss-language-server", "--stdio" },
		root_markers = { "tailwind.config.js", "tailwind.config.ts", "package.json", ".git" },
		settings = {
			tailwindCSS = {
				classFunctions = { "cva", "cx" },
			},
		},
	},

	ts_ls = {
		cmd = { "typescript-language-server", "--stdio" },
		root_markers = { "tsconfig.json", "package.json", ".git" },
		settings = {
			javascript = {
				format = { enable = false },
			},
			typescript = {
				format = { enable = false },
			},
		},
	},

	yaml_ls = {
		cmd = { "yaml-language-server", "--stdio" },
	},
}

local filetypes_config = {
	json = { "biome" },
	html = { "superhtml" },

	javascript = { "ts_ls", "biome", "tailwind_ls" },
	typescript = { "ts_ls", "biome", "tailwind_ls" },

	javascriptreact = { "ts_ls", "biome", "tailwind_ls" },
	typescriptreact = { "ts_ls", "biome", "tailwind_ls" },

	c = { "clangd" },

	cpp = { "clangd" },

	rust = { "rust_ls" },

	yaml = { "yaml_ls" },

	go = { "gopls", "golint" },
	gomod = { "gopls", "golint" },

	-- sql = { "pgls" },

	lua = { "lua_ls" },
}

local function create_final_config(ft_cfg, source_lsps)
	local final = {}

	for name, config in pairs(source_lsps) do
		final[name] = vim.deepcopy(config)
		final[name].filetypes = {}
	end

	for ft_key, names in pairs(ft_cfg) do
		local fts = type(ft_key) == "table" and ft_key or { ft_key }

		for _, ft in ipairs(fts) do
			if type(ft) == "string" then
				for _, name in ipairs(names) do
					if final[name] then
						table.insert(final[name].filetypes, ft)
					end
				end
			end
		end
	end

	return final
end

local final_lsps = create_final_config(filetypes_config, lsps)

for name, config in pairs(final_lsps) do
	vim.lsp.config(name, {
		cmd = config.cmd,
		root_markers = config.root_markers,
		settings = config.settings,
		filetypes = config.filetypes,
	})
end

vim.lsp.enable(vim.tbl_keys(final_lsps))

vim.diagnostic.config({
	virtual_text = {
		spacing = 2,
	},
	update_in_insert = true,
})

-- autocmd
vim.api.nvim_create_autocmd("FileType", {
	callback = function()
		pcall(vim.treesitter.start)
	end,
})

vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.cmd("clearjumps")
	end,
})

-- vim.api.nvim_create_autocmd("LspAttach", {
-- 	callback = function(args)
-- 		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
-- 		if client:supports_method("textDocument/completion") then
-- 			vim.o.complete = "o,.,w,b,u"
-- 			vim.o.completeopt = "menu,menuone,popup,noinsert"
-- 			vim.lsp.completion.enable(true, client.id, args.buf)
-- 		end
-- 	end,
-- })

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
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
			set_lsp_keymap("n", "gi", vim.lsp.buf.implementation)
		end

		if client:supports_method("textDocument/codeAction") then
			set_lsp_keymap({ "n", "v" }, "ga", vim.lsp.buf.code_action)
		end

		if client:supports_method("textDocument/declaration") then
			set_lsp_keymap("n", "gD", vim.lsp.buf.declaration)
		end

		if client:supports_method("textDocument/definition") then
			set_lsp_keymap("n", "gd", vim.lsp.buf.definition)
		end

		if client:supports_method("textDocument/typeDefinition") then
			set_lsp_keymap("n", "gt", vim.lsp.buf.type_definition)
		end

		if client:supports_method("textDocument/references") then
			set_lsp_keymap("n", "gR", vim.lsp.buf.references)
		end

		-- if client:supports_method("textDocument/inlineCompletion") then
		-- 	set_lsp_keymap("n", "gR", vim.lsp.)
		-- end

		if client:supports_method("textDocument/hover") then
			set_lsp_keymap("n", "gk", vim.lsp.buf.hover)
		end
	end,
})
