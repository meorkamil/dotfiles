" Vim Plugin Management with vim-plug
call plug#begin()

" NERDTree (File explorer)
Plug 'preservim/NERDTree'

" vim-airline for status line and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Terraform syntax support
Plug 'https://github.com/hashivim/vim-terraform.git'

" Go programming support
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }  " Uncomment if you want to use vim-go
Plug 'govim/govim'

" Gruvbox colorscheme
Plug 'morhetz/gruvbox'

call plug#end()

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
set updatetime=5
set balloondelay=5

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
