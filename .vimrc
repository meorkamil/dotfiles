
" Vim configuration file "

" enable mouse support "
set mouse=a
"
"" enable syntax "
syntax on
"
"" enable line numbers "
set number
"
"" highlight current line "
set cursorline
:highlight Cursorline cterm=bold ctermbg=black
"" enable highlight search pattern "
set hlsearch
"
"" enable smartcase search sensitivity "
set ignorecase
set smartcase
"
"" Indentation using spaces "
"" tabstop:	width of tab character
"" softtabstop:	fine tunes the amount of whitespace to be added
"" shiftwidth:	determines the amount of whitespace to add in normal mode
"" expandtab:	when on use space instead of tab
"" textwidth:	text wrap width
"" autoindent:	autoindent in new line
set tabstop	=4
set softtabstop	=4
set shiftwidth	=4
set textwidth	=79
set expandtab
set autoindent
"
"" show the matching part of pairs [] {} and () "
"set showmatch

call plug#begin()
Plug 'preservim/NERDTree'
Plug 'tpope/vim-fugitive' "Git workflows
Plug 'tpope/vim-rhubarb' "Git - to go to github link in the browser
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
call plug#end()
"
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

let NERDTreeShowHidden=1

" remove trailing whitespace from Python and Fortran files "
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.f90 :%s/\s\+$//e
autocmd BufWritePre *.f95 :%s/\s\+$//e
autocmd BufWritePre *.for :%s/\s\+$//e

"" enable color themes "
"if !has('gui_running')
"	set t_Co=256
"endif
"" enable true colors support "
set termguicolors
"" Vim colorscheme "
"colorscheme desert
packadd! dracula
syntax enable
colorscheme dracula

let g:dracula_bold = 1
let g:dracula_colorterm = 1
"-------------------------------------------------------------"cula_inverse = 1
"Bonus. " Find & Replace (if you use the ignorecase, smartcase these are mandatory) "
"            :%s/<find>/<replace>/g   "replace global (e.g. :%s/mass/grass/g)"
"            :%s/<find>/<replace>/gc  "replace global with confirmation"
"            :%s/<find>/<replace>/gi  "replace global case insensitive"
"            :%s/<find>/<replace>/gI  "replace global case sensitive"
"            :%s/<find>/<replace>/gIc "replace global case sensitive with confirmation"

"        " Vim (book)marks "
"            mn     "replace n with a word A-Z or number 0-9"
"            :'n     "go to mark n"
"            :`.     "go to the last change"
"            :marks  "show all declared marks"
"            :delm n "delete mark n"

"        " Delete range selection "
"            :<line_number>,<line_number>d "(e.g. :2,10d deletes lines 2-10)"

"        " LaTeX shortcuts "
"            nnoremap <F1> :! pdflatex %<CR><CR>
"            nnoremap <F2> :! bibtex $(echo % \| sed 's/.tex$//') & disown<CR><CR>
"            nnoremap <F3> :! evince $(echo % \| sed 's/tex$/pdf/') & disown<CR><CR>
"            nnoremap <F4> :! rm *.log *.aux *.out *.blg & disown<CR><CR>

" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
