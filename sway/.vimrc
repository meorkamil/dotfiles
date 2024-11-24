" Vim Plugin Management with vim-plug
call plug#begin()

" NERDTree (File explorer)
Plug 'preservim/NERDTree'

" vim-airline for status line and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'nordtheme/vim'

" Terraform syntax support
Plug 'https://github.com/hashivim/vim-terraform.git'

" Go programming support
Plug 'govim/govim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'

" Gruvbox colorscheme
"Plug 'morhetz/gruvbox'

call plug#end()

" ----------------------------- Key Mappings -----------------------------

" NERDTree key mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" ---------------------------- General Settings ----------------------------
" Set the colorscheme to Gruvbox
colorscheme nord

" Enable line numbers
set number

" Enable syntax highlighting
syntax enable

" Set backspace behavior for better editing
set backspace=indent,eol,start

" Add spacing between lines
set linespace=3

" Highlight the current line
set cursorline

" Airline Theme
let g:airline_theme = 'cool'

" -------------------------- File Handling and Backup --------------------------

" Disable compatibility mode (Vim defaults)
set nocompatible

" Disable backup, swapfile, and writebackup for a cleaner workspace
set nobackup
set nowritebackup
set noswapfile

" -------------------------- Mouse and Input --------------------------

" Enable mouse support in all modes
set mouse=a

" Set appropriate ttymouse for terminal (may vary by terminal type)
set ttymouse=sgr

" -------------------------- Govim Settings -----------------------------

" Make Govim more responsive (shorter updatetime and balloondelay)
set updatetime=1
set balloondelay=1
set timeoutlen=1000 ttimeoutlen=0

function! Omni()
    call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
                    \ 'name': 'omni',
                    \ 'whitelist': ['go'],
                    \ 'completor': function('asyncomplete#sources#omni#completor')
                    \  }))
endfunction

au VimEnter * :call Omni()

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

call govim#config#Set("ExperimentalMouseTriggeredHoverPopupOptions", {
      \ "mousemoved": "any",
      \ "pos": "topleft",
      \ "line": +1,
      \ "col": 0,
      \ "moved": "any",
      \ "wrap": v:false,
      \ "close": "click",
      \ "padding": [0, 1, 0, 1],
      \})

" Enable the sign column for quickfix diagnostics
set signcolumn=number

" Enable Go-specific syntax highlighting
autocmd! BufEnter,BufNewFile *.go,go.mod syntax on
"autocmd! BufLeave *.go,go.mod syntax off
" -------------------------- Completion and Popup -----------------------------

" Enable popup menu for completion candidates
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif