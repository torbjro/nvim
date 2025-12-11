-- This file can be loaded by calling `lua require("plugins")` from your init.vimpa

-- Only required if you have packer configured as `opt`
-- vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  use { "wbthomason/packer.nvim" }
  use { "rose-pine/neovim", name = "rose-pine" }
  use { "savq/melange-nvim" }
  use { "zenbones-theme/zenbones.nvim", dependencies = "rktjmp/lush.nvim" }
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "morhetz/gruvbox" }
  use { "nvim-telescope/telescope.nvim", tag = "0.1.8", requires = {"nvim-lua/plenary.nvim"} }
  use { "theprimeagen/harpoon" }
  use { "nvim-treesitter/nvim-treesitter" }
  use { "nvim-treesitter/playground" }
  use { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" }
  use { "neovim/nvim-lspconfig" }
  use { "hrsh7th/nvim-cmp" }
  use { "hrsh7th/cmp-nvim-lsp" }
  use { "williamboman/mason.nvim" }
  use { "windwp/nvim-autopairs" }
  use { "christoomey/vim-tmux-navigator" }
  use { "kdheepak/lazygit.nvim" }
  use { "jpalardy/vim-slime" }
  use { "ray-x/lsp_signature.nvim" }
  use { "lukas-reineke/indent-blankline.nvim", main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {}, }
  use { 'SunnyTamang/select-undo.nvim' }
end)
