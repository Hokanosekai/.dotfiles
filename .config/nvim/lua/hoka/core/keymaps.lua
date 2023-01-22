local keymap = vim.keymap

keymap.set('i', 'jk', '<Esc>', { noremap = true })

-- Delete word backward
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Exit all
keymap.set('', '<C-q>a', ':wqa<Return>')

-- Quit tab
keymap.set('', '<C-q>', ':q<Return>')

-- Save file fsduhgfsdh
keymap.set('i', '<C-s>', '<cmd>write<CR>')
keymap.set('n', '<C-s>', '<cmd>write<CR>')

-- Split window
keymap.set('n', 'ws', ':split<Return><C-w>w')
keymap.set('n', 'wv', ':vsplit<Return><C-w>w')

-- Move tab
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', '<C-w><left>', '<C-w>h')
keymap.set('', '<C-w><up>', '<C-w>j')
keymap.set('', '<C-w><down>', '<C-w>k')
keymap.set('', '<C-w><right>', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><A-Left>', '<C-w>>')
keymap.set('n', '<C-w><A-Right>', '<C-w><')
keymap.set('n', '<C-w><A-Up>', '<C-w>+')
keymap.set('n', '<C-w><A-Down>', '<C-w>-')

-- NvimTree
keymap.set('n', 'nf', ':NvimTreeFocus<Return>')
keymap.set('n', 'nt', ':NvimTreeToggle<Return>')
keymap.set('n', 'nr', ':NvimTreeRefresh<Return>')

-- Telescope
local telescope_builtin = require('telescope.builtin')
keymap.set('n', 'tf', function()
  telescope_builtin.find_files({
    no_ignore = false,
    hidden = true,
  })
end)
keymap.set('n', 'tr', function()
  telescope_builtin.live_grep()
end)
keymap.set('n', 'tb', function()
  telescope_builtin.buffers()
end)
keymap.set('n', 'th', function()
  telescope_builtin.help_tags()
end)
keymap.set('n', 'tg', function()
  telescope_builtin.git_files()
end)
keymap.set('n', 'tt', function()
  telescope_builtin.tags()
end)
keymap.set('n', 'tc', function()
  telescope_builtin.commands()
end)
keymap.set('n', 'tp', function()
  require 'telescope'.extensions.projects.projects {}
end)

-- Zen Mode
keymap.set('n', '<C-w>o', '<cmd>ZenMode<CR>', { silent = true })

-- Lspsaga
keymap.set('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })
keymap.set('n', 'v', '<cmd>Lspsaga code_action<CR>', { silent = true })

-- Markdown Previews
keymap.set('n', '<C-m>pt', '<cmd>MarkdownPreviewToggle<CR>', { silent = true })
