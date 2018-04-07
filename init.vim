" https://nerditya.com/code/guide-to-neovim/

call plug#begin('$HOME/.nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-latex/vim-latex'
Plug 'valloric/youcompleteme'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-rhubarb'
Plug 'rafi/awesome-vim-colorschemes'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

colorscheme Apprentice

:cd $HOME

let mapleader="\<SPACE>"
" --------------------------------------
"  YouCompleteMe
" --------------------------------------
set encoding=utf-8
let g:ycm_confirm_extra_conf = 1
let g:ycm_extra_conf_globlist = ['C:/Users/kaspe/.nvim/*']
let g:ycm_filepath_completion_use_working_dir = 1


" --------------------------------------
" CtrlP
" --------------------------------------
"  Open file menu
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>
" --------------------------------------
" vim-airline
" --------------------------------------
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_theme= 'distinguished'
" --------------------------------------
" Nerdtree
" --------------------------------------
nnoremap <c-e> :NERDTreeToggle<CR>
" --------------------------------------
" vim-latex
" --------------------------------------
set shellslash
let g:tex_flavor='latex'
" --------------------------------------
"  vim-syntastic
" --------------------------------------
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set shiftwidth=4        " Indentation amount for < and > commands.

set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.
" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=purple2
match ExtraWhitespace /\s\+$\|\t/

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set smartindent

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

nnoremap Q @q   " Use Q to execute default register.

" Clear trailing whitespaces
:nnoremap <silent> <F6> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

nnoremap <c-s> <esc>:w<CR>
imap kj <esc>

" config autoreload
autocmd! bufwritepost init.vim source $myvimrc
