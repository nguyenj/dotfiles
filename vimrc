set nocompatible                    " be iMproved, required
set encoding=utf-8                  " set character encoding inside vim

filetype off                        " required

if filereadable(expand("~/.dotfiles/vimrc.vundles"))
  source ~/.dotfiles/vimrc.vundles
endif

filetype plugin indent on           " required
runtime macros/matchit.vim          " activate matchit
syntax on                           " required for syntax highlighting

" Plugin syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_mode_map = {
  \ "passive_filetypes": ["html"] }
let g:syntastic_scss_sass_quiet_messages = {
  \ "regex": 'File to import not found or unreadable' }

" Plugin ctrlp
let g:ctrlp_custom_ignore={
  \ 'dir': '\v[\/](node_modules|tmp)|(\.(git|hg|svn|sass-cache))$',
  \ 'file': '\v\.(exe|so|dll|zip|swp|so|DS_Store)$'
  \ }
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0

" Map the leader to spacebar rather than \
let mapleader = "\<Space>"

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
"nmap k g
" Exit Insert mode
imap jk <esc>
imap jj <esc>

" Paste without VIM auto formatting
map <leader>p :set paste<cr>o<esc>"*]p:set nopaste<cr>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Bind `q` to close the buffer for help files
autocmd Filetype help nnoremap <buffer> q :q<cr>

set clipboard=unnamed               " OSX clipboard
set bg=dark                         " set background theme to be dark
if isdirectory(expand("~/.dotfiles/vim/bundle/base16-vim"))
  colorscheme base16-flat           " set colorscheme using the base-16 plugin
endif
set lazyredraw                      " disable redraw during actions
set autoread                        " display file changes immediately
set ttyfast                         " more characters sent to the screen to for smoother redraws
set title                           " set the title to the value of 'titlestring'
set showmode                        " shows the current mode
set showtabline=2                   " always show tabline
set laststatus=2                    " always show status line
set statusline=%<%f\ -\ %y%h%m%r%=%{strftime(\"%k:%M\ %d\ %a\")}\ %P " tail of the filename
set relativenumber
set number                          " enable line number
" set numberwidth=5
set cursorline                      " highlight cursor line
set backspace=indent,eol,start      " allow backspacing over everything
set history=500
set scrolloff=10                    " keep at least 10 lines below the cursor
set list                            " show spaces and tabs
set listchars=tab:»·,trail:·,nbsp:· " string represented in `list`
set colorcolumn=50,72               " indicate column lines for text wrap
set wrap                            " wrap line when lines are longer than the window width
set splitright                      " open new split panes to right
set guifont=Monaco:h18              " set the font type and size
set visualbell                      " Set visual bell instad of a 'BEEP'
set noerrorbells                    " Turn off the bell
set wildmenu

" Use softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
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

" Toggle line numbers from static to relative
function! LineNumberToggle()
  if (&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <c-n> :call LineNumberToggle()<cr>
