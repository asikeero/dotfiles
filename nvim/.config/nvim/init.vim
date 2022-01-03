"        _                    
" __   _(_)_ __ ___  _ __ ___ 
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__ 
"   \_/ |_|_| |_| |_|_|  \___|
"
" :W!! sudo saves the file when the file is open in readonly mode
cmap w!! w !sudo tee > /dev/null %

" show line numbers
set number
set relativenumber

" replace tabs with spaces
set expandtab
" 1 tab = 2 spaces
set tabstop=4 shiftwidth=4

" when deleting whitespace at the beginning of a line, delete 
" 1 tab worth of spaces (for us this is 2 spaces)
set smarttab

" when creating a new line, copy the indentation from the line above
set autoindent

" keep unsaved buffers open in the background
set hidden

" change cursor shape based on mode
let &t_ti.="\<Esc>[1 q"
let &t_SI.="\<Esc>[5 q"
let &t_EI.="\<Esc>[1 q"
let &t_te.="\<Esc>[0 q"

" dont wrap text
set nowrap

" set an undofile location and allow undofile
set undodir=~/.vim/undodir
set undofile

" Ignore case when searching
set ignorecase
set smartcase

" highlight search results (after pressing Enter)
set hlsearch

" start scrolling before reaching end of current view
set scrolloff=8

" highlight all pattern matches WHILE typing the pattern
set incsearch

" show the mathing brackets
set showmatch

" highlight current line
set cursorline

" show --INSERT--
set showmode

" open splits to right and below
set splitbelow
set splitright

" set leader key to space
let mapleader = " "

" map 'jj' to Esc for fast closing of insert mode
"inoremap jj <esc>

" Move around visually (affects line wrapping)
nnoremap j gj
nnoremap k gk

" always move entire WORDS
nnoremap w W
nnoremap b B

" easier split navigations
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" Automatically closing braces when applied with a <CR>
inoremap {<CR> {<CR>}<Esc>ko

" Map NERDTreeToggle to ctrl -n
noremap <leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" filetype-based syntax highlighting and indentations
syntax enable
filetype plugin indent on

" set F9 to run python script, first line for normal mode, second for insert"
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" set F9 to compile and run c++ script
autocmd FileType cpp map <buffer> <F9> :w<CR>:exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType cpp imap <buffer> <F9> <esc>:w<CR>:exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

" VIM PLUGINS "
" first install-script
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/vim-github-dashboard'
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'Yggdroot/indentLine'
Plug 'bfrg/vim-cpp-modern'

call plug#end()

" for python syntax highlight
let g:gruvbox_transparent_bg = 1
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" set transparent background
autocmd vimenter * hi Normal ctermbg=none

" Map indent lines
nnoremap <leader>b :IndentLinesToggle<cr>

" disable inserting comment sequence on newline after comment (eg. " or //)
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
