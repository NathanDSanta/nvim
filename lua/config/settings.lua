local opt = vim.opt
local o = vim.o

opt.guicursor = ""

-- Line numbers
opt.nu = true
opt.relativenumber = true

-- Indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.expandtab = true
opt.smarttab = true
opt.smartindent = true
opt.autoindent = true
opt.breakindent = true

-- Text wrap
opt.wrap = false

-- File
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
opt.undofile = true

-- Search
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.inccommand = "split"

-- Colors
opt.termguicolors = true

-- Scroll
opt.scrolloff = 9
opt.signcolumn = "yes"

-- To make the editor feel more responsive, supposedly
opt.updatetime = 250

-- Splits
opt.splitright = true
opt.splitbelow = true

-- Whitespaces
opt.listchars = { trail = "·" }

-- If i want to have a border at 80 characters
-- opt.colorcolumn = "80"

o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
