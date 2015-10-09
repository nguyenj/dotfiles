set nocompatible                    " be iMproved, required
set encoding=utf-8                  " set character encoding inside vim

filetype off                        " required

if filereadable(expand("~/.dotfiles/vimrc.vundles"))
  source ~/.dotfiles/vimrc.vundles
endif

filetype plugin indent on           " required

" Plugin Airline settings
let g:airline_section_z='%p%%:%c:%l'
let g:airline_left_sep=''
let g:airline_right_sep=''

" Plugin ctrlp
let g:ctrlp_custom_ignore={
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links'
  \ }

set bg=dark                         " set background theme to be dark
colorscheme base16-eighties         " set colorscheme using the base-16 plugin
set ar                              " display file changes immediately
set lz                              " disable redraw during actions, :redraw to update
set tf                              " more characters sent to the screen to for smoother redraws

set title                           " set the title to the value of 'titlestring'
set wim=list:longest,full           " completion mode
set wmnu                            " enhanced cmd line complettion, wildmenu

set nohls                           " remove highlight on matching search term
set is                              " search while typing
set hls                             " highlight match
set ic                              " ignore case while searching
set scs                             " overrides ignore case if has uppercase
" spacebar to turn off term highlighting
nnoremap <leader><space> :nohlsearch<CR>

set et                              " use spaces instead of tabs
set ts=2                            " spaces per tab
set sw=2                            " indentation space
set sts=2                           " number of spaces per tab while editing
set sr                              " round to the nearest multiple of 'shiftwidth'

set ai                              " copy current line's indent to the new line
set ci                              " copy the existing indenting structure
set si                              " smart indenting on a new line
set sta                             " only indent if the line is not empty

set number                          " enable line number
set guifont=Monaco:h14              " set the font type and size
set visualbell                      " Set visual bell instad of a 'BEEP'
set noerrorbells                    " Turn off the bell
set list                            " show spaces and tabs
set listchars=tab:▸\ ,eol:¬,trail:·,nbsp:·,extends:>,precedes:<   " strings represented in 'list'

set ruler                           " show line and column number on the status bar
set colorcolumn=81,101,121          " indicate where lines 81 is located
set wrap                            " wrap line when lines are longer than the window width
set lbr                             " visually show the line break

set ls=2                            " always show line status
set smd                             " show current mode
set cul                             " highlight cursor line

" map jj to escape an action
imap jj <Esc>