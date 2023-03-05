local fn = vim.fn
 local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
  return true
end

-- Autocommand that reloads neovim whenever you save the plugins
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins
return packer.startup(function(use)

  use 'wbthomason/packer.nvim' -- Packer manage itself
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in NeoVim
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins

  -- color schema (:colorscheme command 기본 제공)
  use 'tiagovla/tokyodark.nvim'
  --use 'sainnhe/edge'
  --use 'lunarvim/colorschemes'
  --use 'bluz71/vim-nightfly-guicolors'
  -- use {
  --   'svrana/neosolarized.nvim',
  --   requires = {
  --     'tjdevries/colorbuddy.nvim'
  --   }
  -- }

  -- maximizes and restores current window
  use 'szw/vim-maximizer'
  use 'tpope/vim-surround'
  -- use 'vim-scripts/ReplaceWithRegister'
  use 'jiangmiao/auto-pairs'

  -- Comment (gcc)
  use 'numToStr/Comment.nvim'

  -- nvim tree
  use 'nvim-tree/nvim-tree.lua'
  use 'kyazdani42/nvim-web-devicons'

  -- status line
  use 'nvim-lualine/lualine.nvim'

  -- fuzzy Finding
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
  use {'nvim-telescope/telescope.nvim', branch = '0.1.x'}

  -- Auto completion(cmp)
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'hrsh7th/cmp-cmdline' -- cmdline completions
  use 'hrsh7th/cmp-nvim-lsp' -- cmdline completions
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions

  -- Snippets
  use 'L3MON4D3/LuaSnip'  -- snippet engine
  use 'rafamadriz/friendly-snippets' -- a brunch of snippets to use

  -- managing & installing lsp servers
  use 'neovim/nvim-lspconfig' -- configuring lsp servers
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
