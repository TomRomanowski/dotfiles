set number
set relativenumber

" Use 'jk' as to go into normal mode
imap jk <Esc>

" Remap jk to go to normal mode when in terminal mode
tnoremap jk <C-\><C-n>

" Key mapping to search for visually selected text
vnoremap // y/<C-R>"<CR>

" Vertical line
set colorcolumn=80

" Tab settings
set softtabstop=4
set shiftwidth=4
set expandtab

" Key mapping to move lines up and down

  " Mac
  " <A-j>
  nnoremap ∆ :m .+1<CR>==
  " <A-k>
  nnoremap ˚ :m .-2<CR>==

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
Plug 'hzchirs/vim-material'

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

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

Plug 'https://github.com/nvie/vim-flake8.git'

Plug 'prettier/vim-prettier', { 'do': 'npm install' }

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'craigemery/vim-autotag'

Plug 'terryma/vim-multiple-cursors'

call plug#end()

let g:material_style = 'oceanic'
set background=dark
colorscheme vim-material

" use tab to forward cycle for autocomplete
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle for autocomplete
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
" map <C-n> :NERDTreeToggle<CR>

" Close nvim if NERDTree is only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Format some json
com! FormatJSON %!python -m json.tool

" Key bindings for resizing buffer panes
noremap <C-j> <C-W>-
noremap <C-k> <C-W>+
noremap <C-h> 2<C-W><
noremap <C-l> 2<C-W>>

" Map Ctrl-c to copy text to system clipboard
map <C-c> "+y<CR>

" Disable scratch preview window
set completeopt-=preview

" ~~~Indentation~~~
autocmd FileType javascript setlocal ts=4 sts=4 sw=4
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd FileType go setlocal ts=4 sts=4 sw=4

" ~~~Prettier~~~
let g:prettier#config#tab_width = 4
let g:prettier#autoformat = 0
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#jsx_bracket_same_line = 'false'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#trailing_comma = 'none'
let g:prettier#config#parser = 'babylon'
let g:prettier#config#single_quote = 'true'

" ~~~Golang code highlighting~~~
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"

" Disable word wrap
set wrap!
