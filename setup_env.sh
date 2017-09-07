#!/bin/bash

sudo apt install vim git tmux zsh curl

git config --global user.name "Gabriela Limonta"
git config --global user.email "glimonta@gmail.com"
git config --global core.editor vim

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
sh ./installer.sh ~/.cache/dein


cat << EOF > ~/.tmux.conf
# Source: https://raw.github.com/tangledhelix/dotfiles/master/tmux.conf

unbind C-a
unbind C-b

set -g prefix C-a

# Ring the bell if any background window rang a bell
set -g bell-action any

# Default termtype. If the rcfile sets $TERM, that overrides this value.
set -g default-terminal screen-256color

# Watch for activity in background windows
setw -g monitor-activity on

# Keep your finger on ctrl, or don't
bind-key ^D detach-client
bind-key ^C new-window

# Create splits and vertical splits
#bind-key v split-window -h
#bind-key ^V split-window -h
#bind-key s split-window
#bind-key ^S split-window

unbind -
unbind _
unbind '\'
unbind '|'
unbind s
unbind C-s
unbind v
unbind C-v

bind-key - split-window
bind-key _ split-window
bind-key s split-window
bind-key C-s split-window
bind-key \ split-window -h
bind-key | split-window -h
bind-key v split-window -h
bind-key C-v split-window -h

# Pane resize in all four directions using vi bindings.
# Can use these raw but I map them to Cmd-Opt-<h,j,k,l> in iTerm2.
# http://tangledhelix.com/blog/2012/04/28/iterm2-keymaps-for-tmux/
bind-key J resize-pane -D
bind-key K resize-pane -U
bind-key H resize-pane -L
bind-key L resize-pane -R

bind-key j previous-window

# Use vi keybindings for tmux commandline input.
# Note that to get command mode you need to hit ESC twice...
set -g status-keys vi

# Use vi keybindings in copy and choice modes
setw -g mode-keys vi

set -g history-limit 65535
setw -g aggressive-resize on

bind R refresh-client
bind a send-key C-a

# easily toggle synchronization (mnemonic: e is for echo)
# sends input to all panes in a given window.
bind e setw synchronize-panes on
bind E setw synchronize-panes off

# set first window to index 1 (not 0) to map more to the keyboard layout...
set -g base-index 1
setw -g pane-base-index 1

# reload tmux config
unbind r
bind r \
	    source-file ~/.tmux.conf \;\
	        display 'Reloaded tmux config.'

# pass through xterm keys
set -g xterm-keys on

# color scheme (style based on vim-powerline)
set -g status-left-length 52
set -g status-right-length 451
set -g status-fg white
set -g status-bg colour234
set -g window-status-activity-attr bold
set -g pane-border-fg colour245
set -g pane-active-border-fg colour46
set -g message-fg colour16
set -g message-bg colour221
set -g message-attr bold
set -g status-left '#[fg=black,bg=white,bold] ⧉ #S #[fg=white,bg=black,nobold]'
set -g status-right '#(whoami)@#h %F %T'
set -g window-status-format " ☐ #I #W "
set -g window-status-current-format "#[fg=black,bg=green] ☑ #I#[bold] #W #[fg=white,bg=black,nobold]"
set -g status-interval 1

source-file ~/.tmux.airline.conf

set -sg escape-time 0
EOF



cat << EOF > ~/.tmux.airline.conf
# This tmux statusbar config was created by tmuxline.vim
# on Sun, 16 Mar 2014

set -g status-bg 'colour234'
set -g message-command-fg 'colour231'
set -g status-justify 'left'
set -g status-left-length '100'
set -g status 'on'
set -g pane-active-border-fg 'colour254'
set -g message-bg 'colour31'
set -g status-right-length '100'
set -g status-right-attr 'none'
set -g message-fg 'colour231'
set -g message-command-bg 'colour31'
set -g status-attr 'none'
set -g pane-border-fg 'colour240'
set -g status-left-attr 'none'
setw -g window-status-fg 'colour250'
setw -g window-status-attr 'none'
setw -g window-status-activity-bg 'colour234'
setw -g window-status-activity-attr 'none'
setw -g window-status-activity-fg 'colour250'
setw -g window-status-separator ''
setw -g window-status-bg 'colour234'
set -g status-left '#[fg=colour16,bg=colour254,bold] #S #[fg=colour254,bg=colour234,nobold,nounderscore,noitalics]'
set -g status-right '#[fg=colour236,bg=colour234,nobold,nounderscore,noitalics]#[fg=colour247,bg=colour236] %Y-%m-%d  %T #[fg=colour252,bg=colour236,nobold,nounderscore,noitalics]#[fg=colour235,bg=colour252] #(whoami)@#h '
setw -g window-status-format '#[fg=colour244,bg=colour234] #I #[fg=colour250,bg=colour234] #W '
setw -g window-status-current-format '#[fg=colour234,bg=colour31,nobold,nounderscore,noitalics]#[fg=colour117,bg=colour31] #I #[fg=colour231,bg=colour31,bold] #W #[fg=colour31,bg=colour234,nobold,nounderscore,noitalics]'
EOF



cat << EOF > ~/.vimrc
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
EOF

cat << EOF > ~/.zshrc
# Path to your oh-my-zsh installation.
export ZSH=/home/gabriela/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/usr/local/bison/bin/"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
EOF

# Powerline fonts
wget https://github.com/Lokaltog/powerline/raw/develop/font/PowerlineSymbols.otf https://github.com/Lokaltog/powerline/raw/develop/font/10-powerline-symbols.conf
sudo mv PowerlineSymbols.otf /usr/share/fonts/
sudo fc-cache -vf
sudo mv 10-powerline-symbols.conf /etc/fonts/conf.d/

echo "Finished setting up. Please open vim and type the command :call dein#install() to install dein.vim plugins"

ssh-keygen -t rsa -b 4096 -C "glimonta@gmail.com"
