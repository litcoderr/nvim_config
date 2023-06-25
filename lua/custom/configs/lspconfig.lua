local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    python = {
      pythonPath = "/opt/homebrew/Caskroom/miniforge/base/bin/python"
    }
  }
})

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git")
}

lspconfig.dartls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "dart", 'language-server', '--protocol=lsp' },
}

