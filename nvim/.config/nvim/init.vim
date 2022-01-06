" general settings
let mapleader = " "
set number
set relativenumber
set expandtab
set tabstop=4 shiftwidth=4
set smarttab
set autoindent
set hidden
set nowrap
set scrolloff=8
set showmatch
set cursorline
set splitbelow
set splitright
syntax enable
filetype plugin indent on 


" load plugins with packer inside lua
" this is essentially a single entry point
lua require('eero')

" KEYMAPS
" window movement
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" Automatically closing braces when applied with a <CR>
inoremap {<CR> {<CR>}<Esc>ko

" set F9 to run python script, first line for normal mode, second for insert"
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" set F9 to compile and run c++ script
autocmd FileType cpp map <buffer> <F9> :w<CR>:exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType cpp imap <buffer> <F9> <esc>:w<CR>:exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>


colorscheme gruvbox
" autoload packages when plugins.lua is modified
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
