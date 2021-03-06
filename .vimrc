let UNVERSIONED = "~/.vimrc_unversioned"
if filereadable(UNVERSIONED)
    exe "source" . UNVERSIONED
endif

set nocompatible

"set mouse=a

set number

imap jj <Esc>

set laststatus=2

set clipboard=unnamed
" set clipboard=unnamedplus

set scrolloff=3

" Intuitive backspacing in insert mode
set backspace=indent,eol,start

map <A-1> 1gt
map <A-2> 2gt
map <A-3> 3gt
map <A-4> 4gt
map <A-5> 5gt
map <A-6> 6gt
map <A-7> 7gt
map <A-8> 8gt
map <A-9> 9gt

" File-type highlighting and configuration.
" Run :filetype (without args) to see what you may have
" to turn on yourself, or just set them all to be sure.
syntax on
filetype on
filetype plugin on
filetype indent on

" Highlight search terms...
set hlsearch
set incsearch " ...dynamically as they are typed.

"This is necessary to allow pasting from outside vim. It turns off auto stuff.
"You can tell you are in paste mode when the ruler is not visible
set pastetoggle=<F2>
"Usually annoys me
set nowrap
"Usually I don't care about case when searching
set ignorecase
"Only ignore case when we type lower case when searching
set smartcase
"I hate noise. The t_vb bit removes any delay also
set visualbell t_vb=
"Show menu with possible tab completions
set wildmenu
"Ignore these files when completing names and in Explorer
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif

""""""""""""""""""""""""""""""""""""""""""""""""
" Indenting
""""""""""""""""""""""""""""""""""""""""""""""""

"Default to autoindenting of C like languages
"This is overridden per filetype below
set noautoindent smartindent

"The rest deal with whitespace handling and
"mainly make sure hardtabs are never entered
"as their interpretation is too non standard in my experience
set softtabstop=4
" Note if you don't set expandtab, vi will automatically merge
" runs of more than tabstop spaces into hardtabs. Clever but
" not what I usually want.
set expandtab
set shiftwidth=4
set shiftround
set nojoinspaces

set hidden

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar

let mapleader = ","

nnoremap <silent> <space> <esc>:noh<cr><esc>

nnoremap <silent> <leader><tab> <esc>:NERDTreeToggle<cr>

"set guifont=Consolas:h11:cDEFAULT
"set guifont=Monospace:h14:cDEFAULT

if has("gui_running")
  if has("gui_gtk2")
"    set guifont=Dina\ 12
    set guifont=Ubuntu\ Mono\ 13
"  elseif has("gui_photon")
"    set guifont=Courier\ New:s11
"  elseif has("gui_kde")
"    set guifont=Courier\ New/11/-1/5/50/0/0/0/1/0
  elseif has("x11")
     set guifont=-windows-dina-medium-r-normal--16-100-96-96-c-80-microsoft-cp1252
"    set guifont=-*-courier-medium-r-normal-*-*-180-*-*-m-*-*
  else
     set guifont=Dina:h12:cDEFAULT
  endif
endif
set guifont=Ubuntu\ Mono\ 13

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

vmap <silent>sf <Plug>SQLU_Formatter<CR>
nmap <silent>scl <Plug>SQLU_CreateColumnList<CR>
nmap <silent>scd <Plug>SQLU_GetColumnDef<CR>
nmap <silent>scdt <Plug>SQLU_GetColumnDataType<CR>
nmap <silent>scp <Plug>SQLU_CreateProcedure<CR> 

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

set background=dark
colorscheme darkblue
if has("gui_running")
    colorscheme solarized
endif

nnoremap <leader><leader> <esc>:buffers<cr>:buffer<space>

" For moving lines (^] is a special character; use <M-k> and <M-j> if it works)
nnoremap <A-k> mz:m-2<CR>`z==
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
vnoremap <A-j> :m'>+<CR>gv=`<my`>mzgv`yo`z
nnoremap <A-j> mz:m+<CR>`z==

vnoremap <A-k> :m'<-2<CR>gv=`>my`<mzgv`yo`z

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif
set title
nmap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>w :w<CR>

call pathogen#infect()
syntax on
filetype plugin indent on
let g:tagbar_usearrows = 1

nnoremap <leader>l :TagbarToggle<CR>

