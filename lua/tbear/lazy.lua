local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "rose-pine/neovim", name = "rose-pine" },
  { "savq/melange-nvim" },
  { "catppuccin/nvim", name = "catppuccin" },
  { "morhetz/gruvbox" },
  { "folke/tokyonight.nvim" },
  { "marko-cerovac/material.nvim" },
  { "AlexvZyl/nordic.nvim" },
  { "Shatur/neovim-ayu" },
  { "metalelf0/black-metal-theme-neovim" },
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { "theprimeagen/harpoon" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPost", "BufNewFile" },
  },
  { "nvim-treesitter/playground" },
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v4.x",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
    },
  },
  { "windwp/nvim-autopairs" },
  { "christoomey/vim-tmux-navigator" },
  { "kdheepak/lazygit.nvim" },
  { "jpalardy/vim-slime" },
  { "ray-x/lsp_signature.nvim" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "SunnyTamang/select-undo.nvim" },
  { "kylechui/nvim-surround", version = "^4.0.0", event = "VeryLazy" },
}, {
  defaults = { lazy = false },
  install = { colorscheme = { "rose-pine", "melange", "zenbones", "catppuccin", "gruvbox" } },
})
