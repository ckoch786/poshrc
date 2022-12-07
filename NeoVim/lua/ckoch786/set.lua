local opt = vim.opt

print("loading lua\\ckoch786\\set.lua")
print(opt.runtimepath)
--opt.runtimepath^=~\PowerShell\NeoVim\ 
--opt.runtimepath+=~\PowerShell\NeoVim\after

opt.guicursor = ""

opt.nu = true
opt.relativenumber = true

opt.errorbells = false

opt.tabstop = 4 
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "Powershell/Neovim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

-- Give more space for displaying messages.
opt.cmdheight = 1

opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
opt.shortmess:append("c")

opt.colorcolumn = "80"

vim.g.mapleader = " "
