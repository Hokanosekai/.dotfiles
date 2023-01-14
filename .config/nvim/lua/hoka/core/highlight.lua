local opt = vim.opt
local cmd = vim.cmd

opt.cursorline = true
opt.termguicolors = true
opt.winblend = 0
opt.pumblend = 5
opt.background = 'dark'

cmd [[
  augroup highlight_yank
  autocmd!
  au TextYankPost * silent! lua vim.highlight.on_yank({hisgroup="Visual", timeout=100})
  augroup END
]]
