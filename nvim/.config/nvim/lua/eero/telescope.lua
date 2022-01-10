require('telescope').setup {
  defaults = {
    file_ignore_patterns = {'%.pyc'},
  },
}

require('telescope').load_extension('fzy_native')

vim.cmd [[
    " Find files using Telescope command-line sugar.
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
]]
