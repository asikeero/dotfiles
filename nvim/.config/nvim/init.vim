" general settings
let mapleader = " "
set number
set relativenumber
set expandtab
set tabstop=2 shiftwidth=2
set smarttab
set autoindent
set hidden
set nowrap
set scrolloff=8
set showmatch
set incsearch
set undofile
set nohlsearch
set cursorline
set splitbelow
set splitright
set ignorecase
set smartcase
set termguicolors
set mouse=a
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

" set tabs in python to be 4 spaces wide
autocmd FileType python set tabstop=4 shiftwidth=4

" disable entering comment symbol with newline after comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set F9 to run python script, first line for normal mode, second for insert"
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" set F9 to compile and run c++ script
autocmd FileType cpp map <buffer> <F9> :w<CR>:exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType cpp imap <buffer> <F9> <esc>:w<CR>:exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

let g:nvcode_termcolors=256
colorscheme gruvbox

" autoload packages when plugins.lua is modified
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
