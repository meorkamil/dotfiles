" Vim Plugin Management with vim-plug
call plug#begin()

" NERDTree (File explorer)
Plug 'preservim/NERDTree'

" vim-airline for status line and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons'

" Terraform syntax support
Plug 'https://github.com/hashivim/vim-terraform.git'

" Go programming support
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  " Uncomment if you want to use vim-go
Plug 'govim/govim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'


" Colorscheme
Plug 'morhetz/gruvbox'

call plug#end()

set encoding=UTF-8
set fileencoding=UTF-8

" ----------------------------- Key Mappings -----------------------------

" NERDTree key mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Show hidden files in NERDTree
let NERDTreeShowHidden=1

" ---------------------------- General Settings ----------------------------

" Enable 256 color support
set t_Co=256

" Set background to dark for gruvbox
set background=dark

" Set the colorscheme to Gruvbox
colorscheme gruvbox

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
let g:airline_powerline_fonts = 1
let g:airline_theme='cool'

" -------------------------- File Handling and Backup --------------------------

" Disable compatibility mode (Vim defaults)
set nocompatible

" Disable backup, swapfile, and writebackup for a cleaner workspace
set nobackup
set nowritebackup
set noswapfile

" -------------------------- Mouse and Input --------------------------

" Enable mouse support in all modes
set mouse=n

" Set appropriate ttymouse for terminal (may vary by terminal type)
set ttymouse=sgr

" -------------------------- Govim Settings -----------------------------

" Make Govim more responsive (shorter updatetime and balloondelay)
set updatetime=1
set balloondelay=1
set timeoutlen=1000 ttimeoutlen=0

" Enable the sign column for quickfix diagnostics
set signcolumn=number

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

" Enable Go-specific syntax highlighting
autocmd! BufEnter,BufNewFile *.go,go.mod syntax on
"autocmd! BufLeave *.go,go.mod syntax off
" -------------------------- Completion and Popup -----------------------------

" Enable popup menu for completion candidates
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif
