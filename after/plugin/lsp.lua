-- Keep lsp-zero if you want its conveniences (signs, defaults, etc.)
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
  vim.keymap.set({ 'n', 'x' }, '<F3>', function() vim.lsp.buf.format { async = true } end, opts)
  vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
end

-- Extend lsp-zero with your attach and capabilities
local capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp_zero.extend_lspconfig({
  sign_text = true,
  lsp_attach = lsp_attach,
  capabilities = capabilities,
})

-- Example servers using new API
vim.lsp.config("cmake", {})

-- HTML with snippet support
local html_capabilities = vim.lsp.protocol.make_client_capabilities()
html_capabilities.textDocument.completion.completionItem.snippetSupport = true
vim.lsp.config("html", {
  capabilities = html_capabilities,
})

-- Lua LS with special on_init
vim.lsp.config("lua_ls", {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
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
  settings = {
    Lua = {},
  },
})

-- Python (pylsp) with plugin settings
vim.lsp.config("pylsp", {
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

-- Rust
vim.lsp.config("rust_analyzer", {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = { enable = false },
    },
  },
})

-- Other servers
vim.lsp.config("starlark_rust", {})
vim.lsp.config("golangci_lint_ls", {})
vim.lsp.config("clangd", {
  capabilities = capabilities,
  on_attach = lsp_attach,
})
vim.lsp.config("julials", {})
vim.lsp.config("ts_ls", {})
vim.lsp.config("jdtls", {})

