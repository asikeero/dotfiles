-- bootstrap packer (from github)
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end
local rtp_addition = vim.fn.stdpath('data') .. '/site/pack/*/start/*'
if not string.find(vim.o.runtimepath, rtp_addition) then
  vim.o.runtimepath = rtp_addition .. ',' .. vim.o.runtimepath
end

-- use protected call to not get error on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have  packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {border = "rounded" }
        end,
    },
}

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'windwp/nvim-autopairs'
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'
  use 'feline-nvim/feline.nvim'
  use 'rafamadriz/friendly-snippets'
  use 'numToStr/Comment.nvim'
  use 'akinsho/toggleterm.nvim'
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }
  use {
      'kyazdani42/nvim-tree.lua',
      requires = {
        'kyazdani42/nvim-web-devicons', -- optional, for file icon
      },
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzy-native.nvim',
      'burntsushi/ripgrep'}
  }
  -- autocompletion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use 'onsails/lspkind-nvim'

  -- debug
  use 'mfussenegger/nvim-dap'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'rcarriga/nvim-dap-ui'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
