-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  vim.notify('packer not found!')
  return
end

-- Have packer 
packer.startup(function()
  -- Package 
  use 'wbthomason/packer.nvim'

  -- Commons
  
  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'mfussenegger/nvim-jdtls' -- java
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'

  -- Color Schemes
  use 'shaunsingh/moonlight.nvim'
  use 'shaunsingh/nord.nvim'
  use 'folke/tokyonight.nvim'
end)
