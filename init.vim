set number
set relativenumber

"Vim Plugin manager
execute pathogen#infect()
syntax on
filetype plugin indent on

" Theme

syntax enable
colorscheme OceanicNext

syntax on
  let g:oceanic_next_terminal_bold = 1
  let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" Deoplete
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Vertical line
set colorcolumn=80

" Tab settings
set softtabstop=2
set shiftwidth=2
set expandtab

" Nerd Commenter

  " Add spaces after comment delimiters by default
  let g:NERDSpaceDelims = 1

  " Align line-wise comment delimiters flush left instead of following code indentation
  let g:NERDDefaultAlign = 'left'

  " Allow commenting and inverting empty lines (useful when commenting a region)
  let g:NERDCommentEmptyLines = 1

  " Enable trimming of trailing whitespace when uncommenting
  let g:NERDTrimTrailingWhitespace = 1

"Toggle NERDTree on and off
map <C-n> :NERDTreeToggle<CR>

" Positions NERDTree to the right
let g:NERDTreeWinPos = "right"

" CtrlP ignores node_modules and dist directory
let g:ctrlp_custom_ignore = { 'dir': 'dist$\|node_modules$' }

" Disables bell sounds
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

set backupdir=./.backup,.,/tmp
set directory=.,./.backup,/tmp

" Use 'jk' as to go into normal mode
imap jk <Esc>

" Key mapping to move lines up and down

  " Mac
  nnoremap ∆ :m .+1<CR>==
  nnoremap ˚ :m .-2<CR>==

  " Linux/Windows
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv

" Key mapping to search for visually selected text
vnoremap // y/<C-R>"<CR>

if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen.
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif
