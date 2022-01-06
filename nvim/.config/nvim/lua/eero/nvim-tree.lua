require('nvim-tree').setup {
  filters = {
    dotfiles = false,
    custom = {}
  },
}

-- remaps custom to this plugin
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeToggle<CR>', {noremap = true, silent = true})
