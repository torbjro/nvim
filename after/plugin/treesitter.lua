require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "help", "javascript", "typescript", "rust", "cpp", "python" },
  sync_install = false,
  auto_install = true,
  ignore_install = {"help"},
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
