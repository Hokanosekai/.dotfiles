local status, ls = pcall(require, 'luasnip')
if (not status) then return end

local snip = ls.snippet
local func = ls.function_node

local date = function() return { os.date('%Y-%m-%d') } end
local defunc = function() return { 'def fname(args):' } end

local copyright_lua = require('hoka.snippets.copyright-lua')
local copyright = require('hoka.snippets.copyright')

ls.add_snippets(nil, {
  all = {
    snip({
      trig = "date",
      namr = "Date",
      dscr = "Date in the form of YYYY-MM-DD",
    }, {
      func(date, {}),
    }),
    snip({
      trig = "pyfunc",
      namr = "Func",
      dscr = "Python function",
    }, {
      func(defunc, {}),
    }),
    snip(copyright.snippet, {
      func(copyright.func, {}),
    }),
    snip(copyright_lua.snippet, {
      func(copyright_lua.func, {}),
    }),
  },
})
