set number
set relativenumber

" Use 'jk' as to go into normal mode
imap jk <Esc>

" Key mapping to search for visually selected text
vnoremap // y/<C-R>"<CR>

" Vertical line
set colorcolumn=80

" Tab settings
set softtabstop=2
set shiftwidth=2
set expandtab

highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

"Auto completion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (guicolors option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

" Plugins
call plug#begin('~/.local/share/nvim/plugged')

Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }

" Material theme
Plug 'kaicataldo/material.vim'

let g:material_theme_style = 'dark'
let g:material_terminal_italics = 1

" Sytax highlighting for javascript
Plug 'https://github.com/pangloss/vim-javascript.git'

" Autocomplete standard library
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

let g:deoplete#enable_at_startup = 1

" Autocomplete for javascript
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }

" Autocomplete for python
Plug 'zchee/deoplete-jedi'

" Fuzzy file finder to search text recursively across files in directory
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Better syntax highlighting for languages
Plug 'sheerun/vim-polyglot'

" NerdTree
Plug 'https://github.com/scrooloose/nerdtree.git'

call plug#end()

set background=dark
colorscheme material

" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" replacement for ctrlp
map <silent> <C-p> :GF<CR>

" displays preview of what was searched using 'Ag' in window to the right
command! -bang -nargs=* Ag                                    
  \ call fzf#vim#ag(<q-args>,                                 
  \                 <bang>fzf#vim#with_preview('right:50%'),  
  \                 <bang>0)


" Fuzzy finder key binding remap
map <silent> <C-F> :Ag 

" Remap :NERDTree command
map <C-n> :NERDTreeToggle<CR>

" Close nvim if NERDTree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Remap jk to go to normal mode when in terminal mode
tnoremap jk <C-\><C-n>
