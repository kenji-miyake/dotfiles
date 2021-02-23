" Plugin
function! PackInit() abort
  packadd minpac

  call minpac#init()
  call minpac#add('k-takata/minpac', {'type': 'opt'})

  call minpac#add('editorconfig/editorconfig-vim')
  call minpac#add('Chiel92/vim-autoformat')
  call minpac#add('tyru/caw.vim')
  call minpac#add('nathanaelkane/vim-indent-guides')
  call minpac#add('bronson/vim-trailing-whitespace')
  call minpac#add('thinca/vim-zenspace')
endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

" Plugin settings
au BufWrite * :Autoformat

nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)

let g:indent_guides_enable_on_vim_startup = 1

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
colorscheme desert
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
