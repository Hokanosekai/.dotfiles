local status, m = pcall(require, 'mason')
if (not status) then return end

local status2, m_lsp = pcall(require, 'mason-lspconfig')
if (not status2) then return end

m.setup({})
m_lsp.setup({
  automatic_installation = true,
  ensure_installed = {
    "tsserver",
    "jsonls",
    "bashls",
    "vimls",
    "sumneko_lua",
    "pyright",
    "clangd",
    "tailwindcss",
    "dockerls",
    "cssls",
  }
})

