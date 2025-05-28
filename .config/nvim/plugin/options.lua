local opt = vim.opt
local o = vim.o

opt.inccommand = "split"

opt.smartcase = true
opt.ignorecase = true

opt.number = true
opt.relativenumber = true

opt.splitbelow = true
opt.splitright = true

opt.signcolumn = "yes"
opt.shada = { "'10", "<0", "s10", "h" }

opt.swapfile = false

opt.formatoptions:remove("o")

opt.wrap = true
opt.linebreak = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.termguicolors = true
opt.cursorline = true
opt.clipboard:append("unnamedplus")
opt.shortmess:append("sI")

opt.more = false

o.showmode = false
o.mouse = ""
o.cmdheight = 0
