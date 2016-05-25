set nocompatible                    " be iMproved, required
set encoding=utf-8                  " set character encoding inside vim

filetype off                        " required

if filereadable(expand("~/.dotfiles/vimrc.vundles"))
  source ~/.dotfiles/vimrc.vundles
endif

syntax on                           " required for syntax highlighting
filetype plugin indent on           " required
runtime macros/matchit.vim          " activate matchit

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  "set grepprg=ag\ --nogroup\ --nocolor
  set grepprg=ag
  let g:grep_cmd_opts='--line-numbers --noheading'
  let g:ag_prg="ag --vimgrep --case-sensitive"
  let g:ag_highlight=1

  " Use ag in ctrlp
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'

  " bind \ to :Ag!
  nnoremap \ :Ag! --hidden<space>
endif

" Plugin ctrlp
let g:ctrlp_custom_ignore={
  \ 'dir': '\v[\/](node_modules|tmp)|(\.(git|hg|svn|sass-cache))$',
  \ 'file': '\v\.(exe|so|dll|zip|swp|so|DS_Store)$'
  \ }
let g:ctrlp_use_caching = 0
let g:ctrlp_switch_buffer='ETVH'
"let g:ctrlp_lazy_update=1

" Map the leader to spacebar rather than \
let mapleader = "\<Space>"

" Enable mouse support
"set mouse=a
" Yank to system clipboard
set clipboard=unnamed

" open up vimrc
nmap <leader>vr :tabedit $MYVIMRC<cr>
" reload vimrc
nmap <leader>so :source $MYVIMRC<cr>
" Pre-populate a split command with the current directory
nmap <leader>n :tabnew <C-r>=escape(expand("%:p:h"), ' ') . '/'<cr>
" Map 0 to ^
nmap 0 ^
" Move up and down by visible lines if current line is wrapped
nmap j gj
" nmap k g
" Exit Insert mode
imap jk <esc>
imap jj <esc>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

"set noswapfile                        " Don't create swap file
"set nobackup                          " Don't create backup files

" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<cr>
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
" Support hamlc syntax, because it's basically haml
au BufRead,BufNewFile *.hamlc set ft=haml

set t_Co=256
let g:solarized_termcolors=256
set bg=dark                         " set background theme to be dark
colorscheme solarized
set lazyredraw                      " disable redraw during actions
set autoread                        " display file changes immediately
set ttyfast                         " more characters sent to the screen to for smoother redraws
set title                           " set the title to the value of 'titlestring'
set showmode                        " shows the current mode
"set showtabline=2                   " always show tabline
set showcmd                         " show the current command
set laststatus=2                    " always show status line
set statusline=\ %<%f\ -\ %y%h%m%r
set statusline+=%=                  " align anything after this to the right
set statusline+=%{strftime(\"%k:%M\ %b\ %d\")} " set the time and date
set statusline+=\ \-\                          " add status line divider
set statusline+=%{fugitive#statusline()}\ %P\  " tail of the filename
"set number                          " enable line number
"set relativenumber
set cursorline                      " highlight cursor line
set backspace=indent,eol,start      " allow backspacing over everything
set history=500
set scrolloff=10                    " keep at least 10 lines below the cursor
set list                            " show spaces and tabs
set listchars=tab:»·,trail:·,nbsp:· " string represented in `list`
set colorcolumn=50,72               " indicate column lines for text wrap
set wrap                            " wrap line when lines are longer than the window width
set splitright                      " open new vertical split panes to right
set splitbelow                      " open new split panes to the bottom
set guifont=Monaco:h18              " set the font type and size
set visualbell                      " Set visual bell instad of a 'BEEP'
set noerrorbells                    " Turn off the bell
set wildmenu

" Use softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set shiftround
set expandtab
set autoindent
set copyindent

" Highlight matching search term
set nohlsearch
set incsearch
set hlsearch
set ignorecase
set smartcase
" spacebar to turn off term highlighting
nnoremap <leader>h :nohlsearch<cr>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag
  let g:grep_cmd_opts='--line-numbers --noheading'
  let g:ag_prg="ag --vimgrep --case-sensitive"
  let g:ag_highlight=1

  " Use ag in ctrlp
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'

  " bind \ to :Ag!
  nnoremap \ :Ag! --hidden<space>
endif

" Toggle line numbers from static to relative
function! LineNumberToggle()
  if (&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <c-S-n> :call LineNumberToggle()<cr>

function! BgToggle()
  if (&bg == "dark")
    set bg=light
  else
    set bg=dark
  endif
endfunc
nnoremap <F5> :call BgToggle()<cr>
set diffopt+=vertical

nnoremap <leader>b Orequire 'pry-remote'; binding.remote_pry<esc>

" Allow netrw to remove non-empty local directories
let g:netrw_localrmdir='rm -rf'
let g:netrw_rm_cmd = 'rm -rf'
let g:netrw_rmdir_cmd = 'rm -rf'
