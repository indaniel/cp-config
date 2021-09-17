call plug#begin('~/.vim/plugged')

" looks
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug '2leks/ayu-vim'
Plug 'arcticicestudio/nord-vim'

" Pearing which is buggy as fuck
Plug 'tmsvg/pear-tree'

" syntax highlighting
Plug 'sheerun/vim-polyglot'
" linter
Plug 'dense-analysis/ale'

" fuzzyfinder
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

" signify
Plug 'preservim/nerdtree'

call plug#end()

" Airline!!

let g:airline_theme='minimalist'
let g:airline_powerline_fonts = 1

g:AutoPairsMapCR

" Looks
set termguicolors
let ayucolor="dark"
colorscheme ayu
hi Normal guibg=NONE ctermbg=NONE
set listchars=tab:›\ ,eol:¬,trail:•
set number
hi Whitespace guifg=#3d4849
hi LineNr guifg=#FFFFFF
match Whitespace /\s/
match Whitespace /\t/
match whitespace /\n/


" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>t :tabnew<Enter>
noremap <leader>w :tabclose<Enter>
noremap <leader>d :NERDTree<Enter>
:noremap j k
:noremap k j
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
map <C-V>       "+gP
map <S-Insert>      "+gP


"ale
let g:airline#extensions#ale#enabled = 1
let b:ale_linters = ['vint', 'cquery', 'clang', 'flake8', 'shellcheck', 'bashate']
let b:ale_fixers = ['autopep8', 'yapf']
let b:ale_warn_about_trailing_whitespace = 0
let g:ale_python_flake8_options = '--ignore=E226,E501,F403,F405,E201'
set signcolumn=yes
highlight ALEErrorSign guifg=Red
highlight ALEWarningSign guifg=Orange
hi signcolumn guibg=NONE
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '>>'

"telescope
cnoreabbrev tele Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍

let g:pear_tree_smart_openers = 1
let g:pear_tree_smart_closers = 1
let g:pear_tree_smart_backspace = 1

set ai
set shiftwidth=4
set si

autocmd filetype cpp nnoremap <F5> :w <bar> !g++ -std=c++17 -O2 -Wall % -o %:r && %:r.exe <CR>