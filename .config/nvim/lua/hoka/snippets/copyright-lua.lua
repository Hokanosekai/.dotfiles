local snippet = {
  trig = "cr-lua",
  namr = "Copyright Lua",
  dscr = "Copyright for Lua",
}

local func = function()
  return {
		"--                                        ",
		"--   ██╗  ██╗  █████╗   ██╗  ██╗  █████╗  ",
		"--   ██║  ██║ ██╔═══██╗ ██║ ██╔╝ ██╔══██╗ ",
		"--   ███████║ ██║   ██║ █████╔╝  ███████║ ",
		"--   ██╔══██║ ██║   ██║ ██╔═██╗  ██╔══██║ ",
		"--   ██║  ██║ ╚██████╔╝ ██║  ██╗ ██║  ██║ ",
		"--   ╚═╝  ╚═╝  ╚═════╝  ╚═╝  ╚═╝ ╚═╝  ╚═╝ ",
		"--                                        ",
    "--  author: hokanosekai",
    "--  project: " .. vim.fn.expand("%:p:h:t", true),
    "--  path: " .. vim.fn.expand("%:p:h", true),
    "--  date: " .. os.date('%Y-%m-%d') .. "                      ",
    "--  version: 0.0.1                        ",
	}
end

return {
  snippet = snippet,
  func = func,
}


