vim.g.mapleader = " "
vim.g.compile_mode = {
	default_command = {
		rust = "cargo ",
		go = "",
	},
}

vim.cmd("syntax off")

vim.cmd.packadd("nvim.difftool")

vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/igorlfs/nvim-dap-view",
	"https://github.com/theHamsta/nvim-dap-virtual-text",

	{ src = "https://github.com/saghen/blink.cmp", version = "v1.10.2" },

	"https://github.com/rebelot/kanagawa.nvim",
	"https://github.com/ej-shafran/compile-mode.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/echasnovski/mini.pairs",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", branch = "main" },
})

-- plugins config
local dap = require("dap")
local dap_widgets = require("dap.ui.widgets")
local dap_view = require("dap-view")
dap_view.setup({
	winbar = {
		show = true,
		show_keymap_hints = true,
	},
	windows = {
		size = 0.43,
		position = "right",
		terminal = {
			size = 0.5,
			position = "left",
			hide = {},
		},
	},
	follow_tab = false,
})

vim.keymap.set("n", "go", dap_view.toggle)
vim.keymap.set("n", "<Leader>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<leader>k", dap_widgets.hover)
vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F10>", dap.restart)

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
	view_options = {
		show_hidden = true,
	},
})
require("nvim-treesitter").setup({
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
require("mini.pairs").setup({})
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
			auto_show = false,
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
		implementation = "prefer_rust_with_warning",
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
		css = { "biome" },
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
vim.opt.number = true
vim.opt.relativenumber = true
vim.o.grepprg = "rg --vimgrep --smart-case --glob '!target/*' --glob '!.git/*'"
vim.o.grepformat = "%f:%l:%c:%m"
vim.opt.statusline = [[[%n] %<%f  %h%w%m%r%=%-14.(%l,%c%V%) %P]]
vim.opt.mouse = ""
vim.opt.timeoutlen = 250
vim.opt.inccommand = "split"
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.shada = { "'10", "<0", "s10", "h" }
vim.opt.swapfile = false
vim.opt.formatoptions:remove("o")
vim.opt.incsearch = true
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
vim.o.showmode = false
vim.o.signcolumn = "yes:1"

-- keymaps
vim.keymap.set("n", "<leader>s", "<cmd>source ~/.config/nvim/init.lua<CR>")
vim.keymap.set("n", "t", "<Nop>")

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

vim.keymap.set("n", "U", "<C-r>")
vim.keymap.set("t", "<ESC><ESC>", "<C-\\><C-n>")

vim.keymap.set("n", "0", "_")

vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

local function flash_move(cmd)
	local highlight_group = "IncSearch"
	local timeout = 250

	local bufnr = vim.api.nvim_get_current_buf()
	local row = vim.api.nvim_win_get_cursor(0)[1] - 1

	local ns_id = vim.api.nvim_create_namespace("flash_move")

	vim.api.nvim_buf_set_extmark(bufnr, ns_id, row, 0, {
		end_row = row + 1,
		hl_group = highlight_group,
		hl_eol = true,
	})

	vim.cmd("normal! " .. cmd)

	vim.defer_fn(function()
		if vim.api.nvim_buf_is_valid(bufnr) then
			vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)
		end
	end, timeout)
end

vim.keymap.set({ "n", "v", "x" }, "J", function()
	flash_move("zt25j")
end)

vim.keymap.set({ "n", "v", "x" }, "K", function()
	flash_move("zb25k")
end)

-- vim.keymap.set({ "n", "v", "x" }, "J", "<C-d>")
-- vim.keymap.set({ "n", "v", "x" }, "K", "<C-u>")
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

vim.keymap.set("n", "<leader>y", ":%y<CR>")
vim.keymap.set("n", "<leader>c", ":Compile<CR>")
vim.keymap.set("n", "gf", ":vertical botright wincmd f<CR>", { desc = "Go to file in full-height vsplit" })
vim.keymap.set("n", "<leader>e", function()
	require("oil").toggle_float(nil, { preview = { vertical = true } }, nil)
end)

vim.keymap.set("n", "ge", function()
	vim.diagnostic.open_float({
		focusable = true,
		border = "solid",
		source = "if_many",
		header = "",
	})
end)

local lsps = {
	biome = {
		cmd = { "biome", "lsp-proxy" },
		root_markers = { "biome.json", "biome.jsonc", "package.json", ".git" },
		settings = {
			formatter = {
				lineWidth = 120,
				indentWidth = 4,
			},
		},
	},

	just_ls = {
		cmd = { "just-lsp" },
		root_markers = { "justfile", ".git" },
	},

	elixir_ls = {
		cmd = { "/home/humam/elixir/language_server.sh" },
		root_markers = { "mix.exs", ".git" },
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

	css_ls = {
		cmd = { "vscode-css-language-server", "--stdio" },
	},
}

local filetypes_config = {
	json = { "biome" },
	html = { "superhtml" },
	css = { "css_ls" },

	javascript = { "ts_ls", "biome", "tailwind_ls" },
	typescript = { "ts_ls", "biome", "tailwind_ls" },

	javascriptreact = { "ts_ls", "biome", "tailwind_ls" },
	typescriptreact = { "ts_ls", "biome", "tailwind_ls" },

	c = { "clangd" },

	cpp = { "clangd" },

	rust = { "rust_ls" },

	yaml = { "yaml_ls" },

	go = { "gopls" },
	gomod = { "gopls" },
	-- elixir = { "elixir_ls" },

	-- sql = { "pgls" },

	lua = { "lua_ls" },

	just = { "just_ls" },
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
	group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
	pattern = "*",
	desc = "highlight selection on yank",
	callback = function()
		vim.highlight.on_yank({ timeout = 100 })
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

		if client:supports_method("textDocument/hover") then
			set_lsp_keymap("n", "gk", function()
				vim.lsp.buf.hover({
					border = "solid",
					focusable = true,
				})
			end)
		end

		if client:supports_method("textDocument/signatureHelp") then
			set_lsp_keymap("n", "gs", function()
				vim.lsp.buf.signature_help({
					border = "solid",
					focusable = false, -- usually better for signature help to stay out of the way
				})
			end)
		end
	end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function(args)
		local mark = vim.api.nvim_buf_get_mark(args.buf, '"')
		local line_count = vim.api.nvim_buf_line_count(args.buf)
		if mark[1] > 0 and mark[1] <= line_count then
			vim.api.nvim_win_set_cursor(0, mark)
			vim.schedule(function()
				vim.cmd("normal! zz")
			end)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.api.nvim_create_autocmd("BufRead", {
	group = vim.api.nvim_create_augroup("dotenv_ft", { clear = true }),
	pattern = { ".env", ".env.*" },
	callback = function()
		vim.bo.filetype = "dosini"
	end,
})

vim.api.nvim_create_user_command("Rg", function(opts)
	local success, _ = pcall(vim.cmd, "silent grep! " .. opts.args)

	if success then
		vim.cmd("copen")
		vim.cmd("wincmd p")
	else
		vim.api.nvim_echo({ { "Search failed. Check your ripgrep arguments.", "ErrorMsg" } }, true, {})
	end
end, { nargs = "+" })
