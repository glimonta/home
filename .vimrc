" Dein.vim config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein/')
  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#add('vim-airline/vim-airline')
  call dein#add('scrooloose/nerdtree')
  call dein#add('jistr/vim-nerdtree-tabs')
  call dein#add('luochen1990/rainbow')
  call dein#add('chrisbra/csv.vim')
  call dein#add('daviddavis/vim-colorpack')
  call dein#add('vim-scripts/matchit.zip')
  call dein#add('unterzicht/vim-virtualenv')
  call dein#add('klen/python-mode')
  call dein#add('mhinz/vim-signify')
  call dein#add('othree/html5.vim')
  call dein#add('pangloss/vim-javascript')
  call dein#add('scrooloose/nerdcommenter')
  call dein#add('sjl/gundo.vim')
  call dein#add('terryma/vim-multiple-cursors')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('vim-jp/vim-cpp')
  call dein#add('shougo/neocomplete.vim')
  call dein#add('scrooloose/syntastic')
"  call dein#add('vim-latex/vim-latex')
  call dein#end()
  call dein#save_state()
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("syntax")
  syntax enable
endif

if has("autocmd")
  filetype plugin indent on
endif

set background=dark
set expandtab
set shiftwidth=2
set softtabstop=0
set tabstop=8
set cryptmethod=blowfish
set hls
set hlsearch
set incsearch
set mouse=a
set nobackup
set notimeout
"set noshowmode
set number
set showcmd
set showmatch
set t_Co=256
set undodir=~/.vim/undo/
set undolevels=16384

set ttimeout
set ttimeoutlen=0
set timeout
set timeoutlen=100000000000000000

let g:netrw_altv = 1

" Fn mappings
map <F2> :set cursorline!<CR>
map <F3> :set cursorcolumn!<CR>
map <F4> :call ToggleWhiteSpaceColor()<CR>
map <F5> :set wrap!<CR>
map <F6> :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif<CR>
map <F7> :set scrollbind!<CR>
map <F8> :noh<CR>
map <F10> `[v`[
map <F11> @@
map <F13> @:

" Vim-airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:powerline_pycmd = "py3" 

" vim-nerdtree-tabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" rainbow parentheses
let g:rainbow_active = 1

" neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" syntastic
let g:syntastic_c_compiler_options = ' -std=gnu11'
let g:syntastic_cpp_compiler_options = ' -std=gnu++11'

" LaTeX Suite
let g:Tex_ViewRule_pdf = 'evince'
