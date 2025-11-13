vim.g.lspconfig = { use_nvim_api = true }

local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
  vim.keymap.set({'n', 'x'}, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
  vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
end

lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = require('cmp_nvim_lsp').default_capabilities(),
})

-- Helper for defining/enabling servers
local function lsp_setup(server, opts)
  vim.lsp.config(server, opts or {})
  vim.lsp.enable(server)
end

-- Capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Show diagnostics inline
vim.diagnostic.config({
  virtual_text = {
    -- prefix = "■", -- "●" or "■", "▎", "x", "E", "W"
    spacing = 2,
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

-- Servers
lsp_setup('cmake', {})

lsp_setup('html', { capabilities = capabilities })

lsp_setup('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path..'/.luarc.json') or vim.uv.fs_stat(path..'/.luarc.jsonc') then
        return
      end
    end
    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = { version = 'LuaJIT' },
      workspace = {
        checkThirdParty = false,
        library = { vim.env.VIMRUNTIME },
      },
    })
  end,
  settings = { Lua = {} },
})

lsp_setup('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "E501", "E302", "E226" },
        },
      },
    },
  },
})

lsp_setup('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = { enable = false },
    },
  },
})

lsp_setup('starlark_rust', {})
lsp_setup('golangci_lint_ls', {})

lsp_setup('clangd', {
  capabilities = capabilities,
  on_attach = lsp_attach,
  cmd = {
    '/opt/homebrew/opt/llvm/bin/clangd',
    '--background-index',
    '--header-insertion=never',
    '--clang-tidy',
    '--compile-commands-dir=.',
  },
})

lsp_setup('julials', {})
lsp_setup('ts_ls', {})
lsp_setup('jdtls', {})

