" Be iMproved, required
set nocompatible
set encoding=utf-8
" required
filetype off


" Set the runtime path to include Vundle and initalize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where Vundle should install pluings
"call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" A tree explorer plugin
Plugin 'https://github.com/scrooloose/nerdtree.git'

" Fuzzy file, buffer, mru, tag, etc finder
Plugin 'https://github.com/kien/ctrlp.vim.git'

" Highlights the enclosing html/xml tags
Plugin 'https://github.com/Valloric/MatchTagAlways.git'

" Emmet
Plugin 'https://github.com/mattn/emmet-vim.git'

" Syntax checking hacks
Plugin 'https://github.com/scrooloose/syntastic.git'

" Visually displaying indent levels in code
Plugin 'https://github.com/Yggdroot/indentLine.git'

" Precision colorscheme
Plugin 'https://github.com/altercation/vim-colors-solarized.git'

" All of your Plugins must be added before the following line
" required
call vundle#end()
" required
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


" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
" Auto indent
set autoindent
" Smart indent
set smartindent
" No line wrapping
set nowrap
set linebreak


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
set foldmethod=manual


" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


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


" Syntastic configurations
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0




