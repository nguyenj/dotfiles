" Be iMproved, required
set nocompatible
set encoding=utf-8
" required
filetype off


if filereadable(expand("~/.dotfiles/vimrc.vundles"))
  source ~/.dotfiles/vimrc.vundles
endif


filetype plugin indent on
" To ignore plugin indent changes, instead use:
"filetype plugin on

" For solarized plugin (color scheme)
" https://github.com/altercation/vim-colors-solarized.git
syntax enable
let hour=strftime("%H")
if 6<=hour && hour<18
  set background=light
else
  set background=dark
endif
colorscheme solarized
" Toggle solarized color theme to either be dark or light
call togglebg#map("<F5>")


" Setting the font
set guifont=Monaco:h18


" Display the status lin
set laststatus=2
" Show mode
set showmode
" Show current command
set showcmd
" Allow modelines
set modeline
" Show line numbers
set number
" Show cmd in bottom bar
set showcmd
" Highlight current line
set cursorline
" Display file title to the title bar
set title
" Show visual wild autocomplete
set wildmenu
" Redraw only when needed
set lazyredraw


" Set visual bell instad of a 'BEEP'
set visualbell
" Turn off the bell
set noerrorbells


" Do not keep highlighted results
set nohlsearch
" Search as characters are entered
set incsearch
" Highlight searches
set hlsearch
" Search highlight while typing
set incsearch
" Ignore case when searching
set ignorecase
" ... unless with a capital letter
set smartcase
" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" Highlight matching [{()}]
set showmatch


" Auto indent
set autoindent
set copyindent
set cindent
" Smart indent
set smartindent
set smarttab
" Softtabs, 2 spaces
"set tabstop=2
"set shiftwidth=2
"set softtabstop=2
"set shiftround
"set expandtab
" Wrap line, but do not break line
set wrap
set linebreak
set nolist


" Shows row and column number
set ruler
" Vim to display file changes immediately
set autoread
" Display extra whitespace
set list
"set listchars=tab:»·,trail:·,nbsp:·
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·,extends:>,precedes:<
" Rule at 80 characters
set colorcolumn=81


" Scroll before cursor reaches the edges
set scrolloff=15
set sidescrolloff=15
" Scroll sideways a character at a time
set sidescroll=1


" Enable folding
set foldenable
" Open the first 10 level of folding
set foldlevelstart=10
" space to open/close folds
nnoremap <space> za
" fold base on syntax
set foldmethod=syntax


" Quicker window movement
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l


" Avoid the esc key
inoremap jk <esc>
inoremap jj <esc>
" Disable arrow keys
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>


" Indent Plugin configuration
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar='·'

" Airline plugin configuration
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_left_sep=''
let g:airline_right_sep=''


