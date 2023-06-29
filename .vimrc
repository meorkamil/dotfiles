call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/NERDTree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/hashivim/vim-terraform.git'
call plug#end()

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
let NERDTreeShowHidden=1
let g:airline_theme='apprentice'
