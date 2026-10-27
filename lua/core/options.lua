-- lua/core/options.lua

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.autoformat = false

local opt = vim.opt

-- Lines & numbers
opt.number         = true
opt.relativenumber = true
opt.cursorline     = true
opt.scrolloff      = 8
opt.wrap           = false

-- Editing
opt.expandtab  = true
opt.shiftwidth = 2
opt.tabstop    = 2

-- Search
opt.ignorecase = true
opt.smartcase  = true
opt.grepprg    = "rg --vimgrep --smart-case"
opt.grepformat = "%f:%l:%c:%m"

-- Files
opt.undofile  = true
opt.swapfile  = false
opt.backup    = false

-- UI
opt.termguicolors = true
opt.signcolumn    = "yes"
opt.splitright    = true
opt.splitbelow    = true

-- Behaviour
opt.mouse      = "a"
opt.clipboard  = "unnamedplus"
opt.updatetime = 250
opt.timeoutlen = 400

-- Clipboard
vim.g.clipboard = {
  name = 'OSC 52',
  copy = { ['+'] = require('vim.ui.clipboard.osc52').copy('+') },
  paste = { ['+'] = function() return {} end }, -- herdr suele fallar al leer, así evitas cuelgues
}

