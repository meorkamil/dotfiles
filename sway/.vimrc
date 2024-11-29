" ----------------------------- Plugin Management -----------------------------

" Initialize vim-plug for plugin management
call plug#begin()

" NERDTree - File explorer
Plug 'preservim/NERDTree'

" vim-airline - Status line and themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arcticicestudio/nord-vim'

" Git integration
Plug 'tpope/vim-fugitive'

" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Icons for filetypes
Plug 'ryanoasis/vim-devicons'
Plug 'bryanmylee/vim-colorscheme-icons'

" Terraform syntax support
Plug 'https://github.com/hashivim/vim-terraform.git'

" Go programming support
Plug 'govim/govim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'yami-beta/asyncomplete-omni.vim'

" End plugin section
call plug#end()

" ----------------------------- General Settings -----------------------------

" File encoding
set encoding=UTF-8
set fileencoding=UTF-8

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

" Disable compatibility mode (Vim defaults)
set nocompatible

" Disable backup, swapfile, and writebackup for a cleaner workspace
set nobackup
set nowritebackup
set noswapfile

" -------------------------- Appearance and Theme ----------------------------

" Use Nord colorscheme
colorscheme nord

" Enable 256 colors if supported by terminal
set t_Co=256

" Enable true color support if Vim supports it
if has("termguicolors")
  set termguicolors
endif

" Nord settings for vim-airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'nord'
let g:nord_uniform_diff_background = 1
let g:nord_bold = 0
let g:nord_cursor_line_number_background = 1

" ---------------------------- NERDTree Settings -----------------------------

" NERDTree key mappings
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" Show hidden files in NERDTree
let NERDTreeShowHidden = 1

" ---------------------------- Mouse and Input -----------------------------

" Enable mouse support in all modes
set mouse=a

" Set appropriate ttymouse for terminal (may vary by terminal type)
set ttymouse=sgr

" ---------------------------- Govim Settings -----------------------------

" Make Govim more responsive (shorter updatetime and balloondelay)
set updatetime=1
set balloondelay=1
set timeoutlen=1000 ttimeoutlen=0

" Govim highlight settings
highlight GOVIMSignErr ctermfg=15 ctermbg=1 guisp=#bf616a guifg=#bf616a guibg=#3b4252
call sign_define("GOVIMSignWarn", {"text":"!!","texthl":"GOVIMSignWarn"})

" Enable the sign column for quickfix diagnostics
set signcolumn=number

" ---------------------------- Completion and Popup -------------------------

" Enable popup menu for completion candidates
if has("patch-8.1.1904")
  set completeopt+=popup
  set completepopup=align:menu,border:off,highlight:Pmenu
endif

" ----------------------------- Key Mappings -----------------------------

" Key mappings for Go language (Govim)
au VimEnter * :call Omni()

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

" Key mappings for NERDTree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

" ---------------------------- Omni-Completion -----------------------------

" Register omni completion for Go language
function! Omni()
    call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
                    \ 'name': 'omni',
                    \ 'whitelist': ['go'],
                    \ 'completor': function('asyncomplete#sources#omni#completor')
                    \  }))
endfunction

" ---------------------------- Final Settings -----------------------------

" Set default colorscheme to nord
colorscheme nord
