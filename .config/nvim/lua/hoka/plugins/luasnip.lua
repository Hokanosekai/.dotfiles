local status, ls = pcall(require, 'luasnip')
if (not status) then return end

ls.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
})

require('luasnip.loaders.from_vscode').lazy_load({
  paths = { "./snippets" }
})
