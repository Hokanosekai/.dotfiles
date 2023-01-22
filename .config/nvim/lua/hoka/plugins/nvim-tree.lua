local status, tree = pcall(require, 'nvim-tree')
if (not status) then
  return
end

tree.setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
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
    icons = {
      webdev_colors = true,
      git_placement = 'before',
      glyph = {
        default = '',
        symlink = '',
        git = {
          unstaged = 'M',
          staged = 'S',
          unmerged = 'U',
          renamed = 'R',
          untracked = '?',
          deleted = 'D',
          ignored = 'I',
        },
        folder = {
          default = '',
          open = '',
          symlink = '',
          symlink_open = '',
        },
      },
    }
  },
  filters = {
    dotfiles = true,
  },
})
