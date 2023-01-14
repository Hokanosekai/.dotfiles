local status, project = pcall(require, 'project_nvim')
if (not status) then return end

project.setup({
  patterns = { "=src" },
  ignore_dirs = { ".git", "node_modules", "build" },
  manual_mode = false,
  silent_chdir = true,
  on_project_load = function()
    vim.cmd("cd " .. project.root)
  end,
  on_project_unload = function()
    vim.cmd("cd " .. vim.loop.os_homedir())
  end,
})
