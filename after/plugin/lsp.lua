local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
  vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
  vim.keymap.set({'n','x'}, '<F3>', function() vim.lsp.buf.format({ async = true }) end, opts)
  vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)

  if client.server_capabilities.semanticTokensProvider then
    vim.lsp.semantic_tokens.start(bufnr, client.id)
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.diagnostic.config({
  virtual_text = { spacing = 2 },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local servers = {
  cmake = {},
  html = {},
  lua_ls = {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc') then
          return
        end
      end
      client.config.settings.Lua = vim.tbl_deep_extend(
        'force',
        client.config.settings.Lua,
        {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME },
          },
        }
      )
    end,
    settings = { Lua = {} },
  },
  basedpyright = {
      settings = {
        basedpyright = {
          typeCheckingMode = "basic",   -- or "off"
          disableOrganizeImports = true,
          reportMissingTypeStubs = "none",
          reportMissingImports = "none",
          reportGeneralTypeIssues = "none",
        }
  }
    },
  rust_analyzer = {
    settings = {
      ['rust-analyzer'] = {
        diagnostics = { enable = false },
      },
    },
  },
  starlark_rust = {},
  golangci_lint_ls = {},
  clangd = {
    cmd = {
      '/opt/homebrew/opt/llvm/bin/clangd',
      '--background-index',
      '--header-insertion=never',
      '--clang-tidy',
      '--compile-commands-dir=.',
    },
  },
  julials = {},
  ts_ls = {},
  jdtls = {},
}

for name, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = capabilities
  lspconfig[name].setup(config)
end

local diagnostics_visible = true

function _G.toggle_diagnostics()
  diagnostics_visible = not diagnostics_visible

  vim.diagnostic.config({
    virtual_text = diagnostics_visible,
    signs = true,       -- keep signs enabled
    underline = diagnostics_visible,
  })

  if diagnostics_visible then
    print("Diagnostics: ON")
  else
    print("Diagnostics: OFF")
  end
end

vim.keymap.set("n", "<leader>td", toggle_diagnostics, { desc = "Toggle diagnostics" })
