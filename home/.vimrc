" vimrc by zed0

" Use Vim defaults (much better!)
if !has('nvim')
	set nocompatible
	set term=xterm
	" Use 256 colours (all modern terminals support this)
	set t_Co=256
endif

" Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'git@github.com:gmarik/Vundle.vim.git'

" Add Bundles here:
Plugin 'Syntastic'
Bundle 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'sjl/gundo.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'junegunn/vim-easy-align'
Plugin 'Raimondi/delimitMate'
Plugin 'SirVer/ultisnips'
Plugin 'jtratner/vim-flavored-markdown'
Plugin 'rhysd/vim-clang-format'
Plugin 'marijnh/tern_for_vim'
Plugin 'tpope/vim-dispatch'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'AndrewRadev/linediff.vim'
Plugin 'lfv89/vim-interestingwords'
Plugin 'sunaku/vim-dasht'
Plugin 'file:///home/zed0/.vim/localBundles/syntasticHtmlHint'
Plugin 'mtscout6/syntastic-local-eslint.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Quramy/tsuquyomi'

call vundle#end()
filetype plugin indent on

" Enable syntax highlighting if available:
syntax on
colorscheme elflord
highlight DiffAdd ctermbg=22 guibg=22
highlight DiffDelete ctermbg=52 guibg=52
highlight DiffChange ctermbg=17 guibg=17
highlight DiffText ctermbg=23 guibg=23

" options for YouCompleteMe
" use global ycm config, no confirmation
let g:ycm_global_ycm_extra_conf = '/home/zed0/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" don't complete inside strings or comments
let g:ycm_complete_in_strings = 0
let g:ycm_complete_in_comment = 0
let g:ycm_min_num_of_chars_for_completion = 1
" check for errors every 2000ms
let g:ycm_allow_changing_updatetime = 0
set updatetime=2000
let g:ycm_autoclose_preview_window_after_completion = 1

" options for airline
set laststatus=2
let g:airline_theme='badwolf'
let g:airline_left_sep='►'
let g:airline_right_sep='◄'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#left_sep='►'
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#whitespace#enabled#show_message = 0

" options for dasht
let g:dasht_filetype_docsets = {
	\ 'cpp': ['boost', 'c\+\+', 'postgresql', 'qt'],
	\ 'sql': ['postgresql'],
	\ 'html': ['bootstrap_3', 'jquery', 'angularjs', 'css', 'font_awesome'],
	\ 'css': ['css'],
	\ 'javascript': ['jasmine', 'javascript', 'jquery', 'angularjs', 'momentjs', 'lo-dash', 'gulp'],
	\ 'vimscript': ['vim'],
	\ 'bash': ['bash'],
	\ }

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
"let g:bufferline_echo = 0
"let g:bufferline_rotate = 3

" options for gundo
let g:gundo_focus_main_buffer = 0
let g:gundo_preview_bottom = 1

" options for NERDTree
let NERDTreeShowHidden = 1

" opitons for delimitMate
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_quotes = ""

" EasyAlign mappings:
vmap <Enter> <Plug>(EasyAlign)
"nmap ga <Plug>(EasyAlign)

" options for ultisnips
let g:UltiSnipsEditSplit="vertical"
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['htmlhint']
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

" clang-format options
"let g:clang_format#code_style = "file"

autocmd FileType javascript setlocal omnifunc=tern#Complete<Paste>

" rotates between no line numbers, normal line numbers and relative line numbers:
function! NumberToggle()
	if(exists('&relativenumber'))
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

function! FixJS()
	"Save current cursor position
	let l:winview = winsaveview()
	"Temporarily add '--fix' to the eslint arguments
	let l:original_args = get(g:, 'syntastic_javascript_eslint_args', '')
	let g:syntastic_javascript_eslint_args = join([l:original_args, "--fix"], ' ')
	call SyntasticCheck()
	"Restore previous settings
	call winrestview(l:winview)
	let g:syntastic_javascript_eslint_args = l:original_args
	call SyntasticCheck()
endfunction
command! FixJS :call FixJS()

set number
set relativenumber

" Function key mappings:
nnoremap <silent> <F1> :call Dasht([expand('<cWORD>'), expand('<cword>')])<Return>
vnoremap <silent> <F1> y:<C-U>call Dasht(getreg(0))<Return>

nnoremap <F2> :call NumberToggle()<cr>
nnoremap <F3> :GundoToggle<CR>
nnoremap <F4> :NERDTreeToggle<CR>
autocmd FileType javascript nnoremap <F5> :FixJS<CR>

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
" Don't keep a backup file
set nowritebackup
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

autocmd FileType python setlocal expandtab

augroup typescript
	au!
	au BufNewFile,BufRead *.ts setlocal filetype=typescript
augroup END

augroup markdown
	au!
	au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

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
" Keep at least 10 lines visible above and below the cursor if possible:
set scrolloff=10

" gp selects pasted text
nnoremap gp `[v`]
nnoremap <leader>l :nohlsearch <cr>
nnoremap <leader>p :set paste! <cr>
imap <C-p> <C-o>:set paste!<cr>
" Map GoTo to <leader>d
nnoremap <leader>d :YcmCompleter GoTo<cr>
nnoremap <leader>sd :sp<CR>:YcmCompleter GoTo<cr>
nnoremap <leader>td :tab :sp<CR>:YcmCompleter GoTo<cr>
" switch from *.cpp to *.h and vice-versa
nnoremap <leader>h :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
nnoremap <leader>sh :sp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
nnoremap <leader>th :tabe %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

if has('nvim')
	nnoremap <C-W>t :sp<CR>:term<CR>
endif

" FZF bindings
map <leader>o :FZF<CR>
map <leader>i :Ag 

" splitjoin bindings
let g:splitjoin_split_mapping = ''
let g:splitjoin_join_mapping = ''
nmap <Leader>j :SplitjoinJoin<cr>
nmap <Leader>s :SplitjoinSplit<cr>

" set folding type:
set foldmethod=indent
set foldlevel=200

set exrc
set secure
