local status, trouble = pcall(require, 'trouble')
if (not status) then return end

trouble.setup({
  auto_open = false,
  auto_close = true,
  auto_preview = false,
  auto_fold = false,
  signs = {
    error = "",
    warning = "",
    hint = "",
    information = "",
    other = "﫠"
  },
  use_diagnostic_signs = true
})
