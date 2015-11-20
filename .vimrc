highlight WhiteSpaceEol ctermbg=darkgreen guibg=lightgreen
highlight Tabs ctermbg=darkred guibg=lightred
hi CursorColumn gui=NONE guibg=#000000
hi! link CursorColumn CursorLine

let g:whiteSpaceColor = 1

function ToggleWhiteSpaceColor()
  if g:whiteSpaceColor
    let g:whiteSpaceColor = 0
  else
    let g:whiteSpaceColor = 1
  end
  call WhiteSpaceColorCallback()
endfunction

function WhiteSpaceColorCallback()
  if g:whiteSpaceColor
    if !exists("w:match_WhiteSpaceEol")
      let w:match_WhiteSpaceEol = matchadd('WhiteSpaceEol', '\s\+$', -1)
    end

    if !exists("w:match_Tabs")
      let w:match_Tabs = matchadd('Tabs', '\t', -1)
    end
  else
    if exists("w:match_WhiteSpaceEol")
      call matchdelete(w:match_WhiteSpaceEol)
      unlet w:match_WhiteSpaceEol
    end

    if exists("w:match_Tabs")
      call matchdelete(w:match_Tabs)
      unlet w:match_Tabs
    end
  end
endfunction

au BufWinEnter * call WhiteSpaceColorCallback()



" Stuff from Ubuntu’s /etc/vim/vimrc
if has("syntax")
  syntax on
endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

if has("autocmd")
  filetype plugin indent on
endif



runtime ftplugin/man.vim

" Options
set background=dark
set cryptmethod=blowfish
set expandtab
"set history=32768
set hls
set incsearch
set mouse=a
set nobackup
set notimeout
set noshowmode
set number
set shiftwidth=2
set showcmd
set showmatch
set softtabstop=0
set t_Co=256
set tabstop=8
set undodir=~/.vim/undo/
set undolevels=16384

set keymap=greek_utf-8
set iminsert=0
set imsearch=0

set ttimeout
set ttimeoutlen=0

set timeout
set timeoutlen=100000000000000000

let g:netrw_altv = 1



" Fn mappings
map <F2>  :set cursorline!<CR>
map <F3>  :set cursorcolumn!<CR>
map <F4>  :call ToggleWhiteSpaceColor()<CR>
map <F5>  :set wrap!<CR>
map <F6>  :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif<CR>
map <F7>  :set scrollbind!<CR>
map <F8>  :noh<CR>
map <F10> `[v`]
map <F11> @@
map <F13> @:



" NeoBundle
"
" mkdir -p ~/.vim/bundle
" git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'



NeoBundle 'Shougo/vimproc.vim', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }



NeoBundle 'bling/vim-airline'

set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1



NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'

map <Leader>n <plug>NERDTreeTabsToggle<CR>



"NeoBundle 'kien/rainbow_parentheses.vim'
NeoBundle 'luochen1990/rainbow'

let g:rainbow_active = 1

"au VimEnter * RainbowParenthesesToggle
"au Syntax * RainbowParenthesesLoadRound
"au Syntax * RainbowParenthesesLoadSquare
"au Syntax * RainbowParenthesesLoadBraces



NeoBundle 'benmills/vimux'
NeoBundle 'chrisbra/csv.vim'
NeoBundle 'daviddavis/vim-colorpack'
NeoBundle 'edsono/vim-matchit'
NeoBundle 'godlygeek/tabular'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'klen/python-mode'
NeoBundle 'mhinz/vim-signify'
NeoBundle 'mhinz/vim-tmuxify'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'othree/javascript-libraries-syntax.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'pbrisbin/html-template-syntax'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'sjl/gundo.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-unimpaired'
NeoBundle 'vim-jp/cpp-vim'



NeoBundle 'shougo/neocomplcache'

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



NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'

let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_show_privates = 1
let g:gist_post_private = 1
let g:gist_get_multiplefile = 1



NeoBundle 'shougo/unite.vim'
NeoBundle 'osyo-manga/unite-quickfix'



NeoBundle 'dag/vim2hs'

let g:haskell_conceal = 0
let g:haskell_conceal_enumerations = 0



NeoBundle 'scrooloose/syntastic'

let g:syntastic_c_compiler_options = ' -std=gnu11'
let g:syntastic_cpp_compiler_options = ' -std=gnu++11'


" Stuff for vim-latex plugin

NeoBundle 'LaTeX-Suite-aka-Vim-LaTeX'
let g:Tex_ViewRule_pdf = 'evince'


call neobundle#end()
