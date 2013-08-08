" vimrc by zed0

" Use Vim defaults (much better!)
set nocompatible

" Vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Add Bundles here:
Bundle 'gmarik/vundle'
Bundle 'Syntastic'
Bundle 'Valloric/YouCompleteMe'
Bundle 'sjl/gundo.vim'
Bundle 'scrooloose/nerdtree'
filetype plugin indent on

" options for YouCompleteMe
" use global ycm config, no confirmation
let g:ycm_global_ycm_extra_conf = '/home/zed0/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 1
" don't complete inside strings or comments
let g:ycm_complete_in_strings = 0
let g:ycm_complete_in_comment = 0
" check for errors every 500ms
let g:ycm_allow_changing_updatetime = 0
set updatetime=500
let g:ycm_autoclose_preview_window_after_completion = 1

" F2 rotates between no line numbers, normal line numbers and relative line
" numbers:
function! NumberToggle()
	if(&number == 0 && &relativenumber == 0)
		set number
	elseif(&number == 1 && &relativenumber == 0)
		set relativenumber
	elseif(&number == 1 && &relativenumber == 1)
		set number!
		set relativenumber!
	endif
endfunc
nnoremap <F2> :call NumberToggle()<cr>

" Map F3 to shortcut to the Gundo feature
nnoremap <F3> :GundoToggle<CR>
" Stop gundo refocusing main window
let g:gundo_focus_main_buffer = 0

" Map F4 to shortcut to the NERDTree
nnoremap <F4> :NERDTree<CR>

" Enable syntax highlighting if available:
if has("syntax")
	syntax on
	colorscheme elflord
endif

" allow backspacing over everything in insert mode
set backspace=2
" Now we set some defaults for the editor 
set autoindent
" Don't wrap words by default
set textwidth=0
" Don't keep a backup file
set nobackup
" keep 50 lines of command line history
set history=50
" show the cursor position all the time
set ruler
" Show (partial) command in status line.
set showcmd
" Show matching brackets.
set showmatch
" Do case insensitive matching
set ignorecase
" Incremental search
set incsearch
" Highlight matches
set hlsearch
" Automatically save before commands like :next and :make
set autowrite
" display search
set is
" don't highlight previous search
set linebreak
" broken line character
set showbreak=>>
" show tabs and trailing spaces
"set listchars=tab:»­,trail:·
set listchars=tab:->,trail:-
" show unprintable characters
set list

set tabstop=4
set shiftwidth=4
set mouse=a
set guifont=10x20

let mapleader=","

map <MouseDown> <C-U>
map <MouseUp> <C-E>

" Slightly nicer colours if xterm colours get used:
if &term =~ "screen"
	set term=xterm
endif

" map :W to :w because I'm an idiot
command W w
command Q q
" Use w!! to sudo for a file if you forget to sudo vim:
cmap w!! %!sudo tee > /dev/null %
" <leader>g posts the current selection to a private gist.  Requires gist - https://github.com/defunkt/gist
vnoremap <leader>g :w !gist -p -t @% <cr>
" :Curl fetches a url to a scratch buffer
command -nargs=* Curl botright new | setlocal buftype=nofile | read! curl <q-args> 2>/dev/null
" H and L go to begining and end of line
noremap H 0
noremap L g$


" Make scrollwheel work in a normal fashion:
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

nnoremap <leader>l :nohlsearch <cr>

" set folding type:
set foldmethod=syntax
set foldlevel=200
