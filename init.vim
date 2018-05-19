" https://nerditya.com/code/guide-to-neovim/

call plug#begin('$HOME/.nvim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-latex/vim-latex'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'rust-lang/rust.vim'
Plug 'tpope/vim-rhubarb'
Plug 'rafi/awesome-vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'valloric/youcompleteme'
Plug 'beyondmarc/glsl.vim'
Plug 'junegunn/goyo.vim'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

set background=dark
colorscheme onedark

let mapleader="\<SPACE>"

" --------------------------------------
"  Tagbar
" --------------------------------------
nnoremap <c-q> :TagbarToggle<cr>
" --------------------------------------
"  Ultisnips
" --------------------------------------
let g:UltiSnipsExpandTrigger="<c-tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="vertical"

" --------------------------------------
" CtrlP
" --------------------------------------
"  Open file menu
nnoremap <Leader>o :CtrlP<cr>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<cr>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<cr>
" Search tags
nnoremap <Leader>, :CtrlPTag<cr>

" Ignore some files
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.obj,*.map,*.pdb,*.idb  " Windows

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
let g:syntastic_html_tidy_quiet_messages = { "level" : "warnings" }
" --------------------------------------
"  YouCompleteMe
" --------------------------------------
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_collect_identifiers_from_tags_files = 1

" --------------------------------------
"  Goyo
" --------------------------------------
let g:goyo_width = 120
let g:goyo_height = 90
let g:goyo_linenr = 1

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
set smartindent

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" --------------------------------------
"  Tag things
" --------------------------------------
"  Need to remap due to finnish layout
nnoremap <c-i> <c-]>

" --------------------------------------
"  Misc things
" --------------------------------------

" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens it
" (but not if it's already open). However, as part of the autocmd, this doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" Thanks to https://forums.handmadehero.org/index.php/forum?view=topic&catid=4&id=704#3982
" error message formats
" Microsoft MSBuild
set errorformat+=\\\ %#%f(%l\\\,%c):\ %m
" Microsoft compiler: cl.exe
set errorformat+=\\\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %m
" Microsoft HLSL compiler: fxc.exe
set errorformat+=\\\ %#%f(%l\\\,%c-%*[0-9]):\ %#%t%[A-z]%#\ %m

function! DoBuildBatchFile()
    " build.bat
    set makeprg=build
    " Make sure the output doesnt interfere with anything
    silent make
    " Open the output buffer
    "vert copen 70
    copen 20
    echo "Build Complete"
endfunction

function! DoOpenVisualStudio()
    execute "!devenv Kalm2D.sln"
endfunction

"Open VisualStudio
nnoremap <F4> :call DoOpenVisualStudio()<CR>
" Set F7 to build. I like this since I use visual studio with the c++ build env
nnoremap <F5> :call DoBuildBatchFile()<CR><CR>
"Go to previous error
nnoremap <F6> :cp<CR>
"Go to next error
nnoremap <F7> :cn<CR>
"Close quickfix
nnoremap <F8> :ccl<CR>

" Clear trailing whitespaces
nnoremap <silent> <F9> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
" Get ctags and dump it in the current directory
nnoremap <silent> <F10> :!ctags -R .<cr><cr>

" Save
nnoremap <c-s> <esc>:w<CR>

" Esc (is there really no better alternative for me?!?!)
imap kj <esc>

nnoremap <Leader>q :q<CR>

" config autoreload
autocmd! bufwritepost init.vim source $myvimrc

" faster snippet file finding


"Here for reference
"function BuildProject()
    ""save the current working directory so we can come back
    "let l:starting_directory = getcwd()

    ""get the directory of the currently focused file
    "let l:curr_directory = expand('%:p:h')
    ""move to the current file
    "execute "cd " . l:curr_directory

    "while 1
        ""check if build.bat exists in the current directory
        "if filereadable("build.bat")
            ""run make and exit
            "make
            "break
        "elseif l:curr_directory ==# "/" || l:curr_directory =~# '^[^/]..$'
            ""if we've hit the top level directory, break out
            "break
        "else
            ""move up a directory
            "cd ..
            "let l:curr_directory = getcwd()
        "endif
    "endwhile

    ""reset directory
    "execute "cd " . l:starting_directory
"endfunction
"
"
" Ensure the buffer for building code opens in a new view
"set switchbuf=useopen,vsplit
set switchbuf=useopen


" GLSL defaults
"let g:glsl_default_version = 'glsl330'
let g:glsl_file_extensions = '*.glsl,*.vsh,*.fsh,*.vert,*.tesc,*.tese,*.geom,*.frag,*.comp,*.vs,*.fs,*.gs'


