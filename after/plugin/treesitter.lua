local ok_configs, configs = pcall(require, "nvim-treesitter.configs")
if not ok_configs then
  return
end

local ok_install, ts_install = pcall(require, "nvim-treesitter.install")
if not ok_install then
  return
end

-- Use a fixed install dir to avoid re-downloading parsers if the default path is wiped.
local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter-parsers"
ts_install.prefer_git = true
ts_install.compilers = { "cc", "clang", "gcc" }
vim.opt.runtimepath:append(parser_install_dir)

configs.setup({
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "markdown",
    "markdown_inline",
    "javascript",
    "typescript",
    "rust",
    "cpp",
    "python",
  },
  parser_install_dir = parser_install_dir,
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<S-CR>",
      node_decremental = "<BS>",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
})
