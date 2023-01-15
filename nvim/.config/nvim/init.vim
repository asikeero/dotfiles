" general settings
nnoremap <SPACE> <Nop>
let mapleader = " "
set number
set expandtab
set relativenumber
set tabstop=2 shiftwidth=2
set smarttab
set autoindent
set hidden
set nowrap
set scrolloff=8
set sidescrolloff=8
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
set signcolumn=yes  " dont shift text around when warnings emerge
syntax enable
filetype plugin indent on 
nnoremap Y y$

" load plugins with packer inside lua
" this is essentially a single entry point
lua require('eero')

" KEYMAPS
" window movement
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" window resizing
nnoremap <M-Right> :vertical resize +1<CR>
nnoremap <M-Left> :vertical resize -1<CR>
nnoremap <M-Down> :resize +1<CR>
nnoremap <M-Up> :resize -1<CR>

" moving text up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <silent> <M-j> :m .+1<CR>==
nnoremap <silent> <C-j> :m .+1<CR>==
inoremap <silent> <M-k> :m .-2<CR>==
nnoremap <silent> <C-k> :m .-2<CR>==

" copy
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
" and paste
vnoremap <leader>p "+p
nnoremap <leader>P "+P

" keep cursor centered when moving with n and N
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" mimic americal layout to input commands
nnoremap ö :
vnoremap ö :

" set tabs in python to be 4 spaces wide
autocmd FileType python set tabstop=4 shiftwidth=4

" disable entering comment symbol with newline after comment
"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" set F9 to run python script, first line for normal mode, second for insert"
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" set F9 to compile and run c++ scrip
autocmd FileType cpp map <buffer> <F9> :w<CR>:exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd FileType cpp imap <buffer> <F9> <esc>:w<CR>:exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>

let g:nvcode_termcolors=256
colorscheme gruvbox

" open terminals
nnoremap <leader>+ :ToggleTerm direction=horizontal<CR> 

" autoload packages when plugins.lua is modified
augroup packer_user_config
  autocmd!
  autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end

" run lsp format when file is saved
"autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()

" close tags
autocmd FileType javascript inoremap <buffer> <C-s> <esc>yiwi<lt><esc>ea></><esc>hpF>a

" python settings
let g:python3_host_prog = '/home/eero/.local/pyenv/versions/neovim/bin/python'
