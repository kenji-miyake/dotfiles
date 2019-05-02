" General
syntax enable
filetype plugin indent on
set clipboard=unnamedplus

" File
set autoread
set hidden
set nobackup
set noswapfile

" Encoding
set encoding=utf-8
set fileencoding=utf-8

" UI
set number
set cursorline
set ruler
set visualbell
set showmatch
set laststatus=2

" Completion
set wildmode=list:longest

" Key Binding
nnoremap <Up> gk
nnoremap <Down> gj
imap <C-a> <Home>
imap <C-e> <End>

" Indent
set smartindent
set list
set listchars=tab:>-
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

" Search
set ignorecase
set smartcase
set wrapscan
set noincsearch
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
