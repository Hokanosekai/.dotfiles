local opt = vim.opt
local w = vim.wo
local api = vim.api
local cmd = vim.cmd

cmd('autocmd!')

vim.scriptencoding = 'utf-8'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

w.number = true
w.relativenumber = true

opt.title = true
opt.autoindent = true
opt.smartindent = true
opt.hlsearch = true

opt.backup = false
opt.backupskip = { '/tmp/*', '/private/tmp/*' }

opt.showcmd = true
opt.cmdheight = 1

opt.laststatus = 2
opt.expandtab = true
opt.scrolloff = 10

opt.shell = 'fish'
opt.inccommand = 'split'
opt.ignorecase = true
opt.smarttab = true

opt.shiftwidth = 2
opt.tabstop = 2

opt.wrap = false
opt.backspace = { 'start', 'eol', 'indent' }
opt.path:append { '**' }
opt.wildignore:append { '*/node_modules/*' }

cmd([[let &t_Cs = "\e[4:3m"]])
cmd([[let &t_Ce = "\e[4:0m"]])

api.nvim_create_autocmd("InsertLeave", {
  pattern = '*',
  command = "set nopaste"
})

opt.formatoptions:append { 'r' }
