local status, tree = pcall(require, 'nvim-tree')
if (not status) then
  return
end

tree.setup({
  sort_by = "case_sensitive",
  view = {
    width = 23,
    adaptive_size = true,
    mappings = {
      list = {
        
      },
    },
    signcolumn = 'yes',
  },
  renderer = {
    indent_width = 2,
    group_empty = true,
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = ' ',
        edge = ' ',
        item = ' ',
        bottom = ' ',
        none = ' ',
      },
    },
  },
  filters = {
    dotfiles = true,
  },
  open_on_setup = true,
})

