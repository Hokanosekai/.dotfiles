local status, alpha = pcall(require, "alpha")
if (not status) then
  return
end

local header = {
  type = "text",
  val = {
    "                                       ",
    "  ██╗  ██╗  █████╗   ██╗  ██╗  █████╗  ",
    "  ██║  ██║ ██╔═══██╗ ██║ ██╔╝ ██╔══██╗ ",
    "  ███████║ ██║   ██║ █████╔╝  ███████║ ",
    "  ██╔══██║ ██║   ██║ ██╔═██╗  ██╔══██║ ",
    "  ██║  ██║ ╚██████╔╝ ██║  ██╗ ██║  ██║ ",
    "  ╚═╝  ╚═╝  ╚═════╝  ╚═╝  ╚═╝ ╚═╝  ╚═╝ ",
    "                                       ",
  },
  opts = {
    position = "center",
    hl = "Comment",
  },
}

local quote = [[
"First, solve the problem.
Then, write the code."
]]
local quoteAuthor = "John Johnson"
local fullQuote = quote .. "\n \n                  - " .. quoteAuthor

local fortune = {
  type = "text",
  val = fullQuote,
  opts = {
    position = "center",
    hl = "Comment",
  },
}

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 6,
    width = 19,
    align_shortcut = "right",
    hl_shortcut = "Number",
    hl = "Function",
  }
  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

local buttons = {
  type = "group",
  val = {
    button("c", "   Create", ":ene <BAR> startinsert<CR>"),
    button("o", "   Open", ":Telescope find_files<CR>"),
    button("f", "   Find", ":Telescope live_grep<CR>"),
    button('p', "   Projects", ":Telescope projects<CR>"),
    button("f", "ﱮ   Folder", ":NvimTreeFocus<CR>"),
    button("u", "   Update", ":PackerSync<CR>"),
    button("q", "   Quit", ":qa!<CR>"),
  },
  opts = {
    position = "center",
    spacing = 1,
  },
}

local section = {
  header = header,
  buttons = buttons,
  footer = fortune,
}

local opts = {
  layout = {
    { type = "padding", val = 13 },
    section.header,
    { type = "padding", val = 3 },
    section.buttons,
    { type = "padding", val = 3 },
    section.footer,
    { type = "padding", val = 22 },
  },
  opts = {
    margin = 44,
  },
}
alpha.setup(opts)
