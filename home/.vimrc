" vimrc by zed0

" Use Vim defaults (much better!)
set nocompatible
" Use 256 colours (all modern terminals support this)
set term=xterm
set t_Co=256

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
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Bundle 'bling/vim-bufferline'
Bundle 'Raimondi/delimitMate'
filetype plugin indent on

" Enable syntax highlighting if available:
syntax on
colorscheme elflord

" options for YouCompleteMe
" use global ycm config, no confirmation
let g:ycm_global_ycm_extra_conf = '/home/zed0/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" don't complete inside strings or comments
let g:ycm_complete_in_strings = 0
let g:ycm_complete_in_comment = 0
" check for errors every 2000ms
let g:ycm_allow_changing_updatetime = 0
set updatetime=2000
let g:ycm_autoclose_preview_window_after_completion = 1

" options for airline
set laststatus=2
let g:airline_enable_syntastic = 0
let g:airline_detect_whitespace = 0
let g:airline_theme='badwolf'
let g:airline_left_sep='►'
let g:airline_right_sep='◄'
" get the colours working like I want (done with autocmd because otherwise
" something overwrites it):
" Should really use an after file
set fillchars=vert:\ 
autocmd VimEnter * highlight VertSplit cterm=NONE ctermbg=235
autocmd VimEnter * highlight StatusLine cterm=NONE ctermbg=235
autocmd VimEnter * highlight StatusLineNC cterm=NONE ctermbg=235 ctermfg=235
autocmd VimEnter * highlight Error term=NONE ctermfg=124 ctermbg=196
autocmd VimEnter * highlight todo term=NONE ctermfg=202 ctermbg=214
autocmd VimEnter * highlight Search ctermbg=100 ctermfg=black
autocmd VimEnter * highlight Pmenu ctermbg=DarkMagenta ctermfg=black
autocmd VimEnter * highlight PmenuSel ctermbg=DarkMagenta ctermfg=gray
autocmd VimEnter * highlight clear AlBl_active
autocmd VimEnter * highlight link AlBl_active Al6
autocmd VimEnter * highlight clear AlBl_inactive
autocmd VimEnter * highlight link AlBl_inactive Al5

" options for bufferline
let g:bufferline_echo = 0
let g:bufferline_rotate = 3

" options for gundo
let g:gundo_focus_main_buffer = 0

" options for NERDTree
let NERDTreeShowHidden = 1

" opitons for delimitMate
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_quotes = ""

" rotates between no line numbers, normal line numbers and relative line numbers:
function! NumberToggle()
	if (exists('&relativenumber'))
		if(&number == 0 && &relativenumber == 0)
			set number
		elseif(&number == 1 && &relativenumber == 0)
			set relativenumber
		elseif(&relativenumber == 1)
			if(&number == 1)
				set number!
			endif
			set relativenumber!
		endif
	else
		set nu!
	endif
endfunc

" Function key mappings:
nnoremap <F2> :call NumberToggle()<cr>
nnoremap <F3> :GundoToggle<CR>
nnoremap <F4> :NERDTreeToggle<CR>

" don't force a save when moving to another buffer
set hidden
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
" display search
set is
" don't highlight previous search
set linebreak
" broken line character
set showbreak=>>
" show tabs and trailing spaces and slightly darker than default colour
set listchars=tab:->,trail:-
autocmd VimEnter * highlight SpecialKeys ctermfg=30
" show unprintable characters
set list

" more bash-like filename completion:
set wildmenu
set wildmode=longest,list
if (has('wildignorecase'))
	set wildignorecase
endif

autocmd FileType * set tabstop=4 | set noexpandtab
set tabstop=4
set shiftwidth=4
set mouse=a
set guifont=10x20

let mapleader=","

map <MouseDown> <C-U>
map <MouseUp> <C-E>

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
noremap L $
" Make scrollwheel work in a normal fashion:
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

nnoremap <leader>l :nohlsearch <cr>

" set folding type:
set foldmethod=syntax
set foldlevel=200
