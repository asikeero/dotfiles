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

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'feline-nvim/feline.nvim'
  use 'morhetz/gruvbox'
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
      'nvim-telescope/telescope-fzy-native.nvim'}
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
