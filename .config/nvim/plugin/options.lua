vim.opt.inccommand = "split"
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.signcolumn = "yes"
vim.opt.shada = { "'10", "<0", "s10", "h" }
vim.opt.swapfile = false
vim.opt.formatoptions:remove("o")
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.clipboard:append("unnamedplus")
vim.opt.shortmess:append("sI")
vim.opt.more = false

vim.o.showmode = false
vim.o.mouse = ""
vim.o.cmdheight = 0
