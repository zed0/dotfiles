" vimrc by zed0

" Use Vim defaults (much better!)
if !has('nvim')
	set nocompatible
	set term=xterm
	" Use 256 colours (all modern terminals support this)
	set t_Co=256
else
	set inccommand=nosplit
endif

call plug#begin('~/.vim/bundle/')

" Add Bundles here:

" Local config
Plug 'embear/vim-localvimrc'

" Code completion
Plug 'w0rp/ale'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'

"Autoformatting
Plug 'Chiel92/vim-autoformat'
Plug 'editorconfig/editorconfig-vim'

"Rooter
Plug 'airblade/vim-rooter'

"status line
Plug 'vim-airline/vim-airline'

"fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"VCS
Plug 'ludovicchabant/vim-lawrencium'
Plug 'tpope/vim-fugitive'

"misc
Plug 'junegunn/vim-easy-align'
Plug 'Raimondi/delimitMate'
Plug 'jtratner/vim-flavored-markdown'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'sjl/gundo.vim'
Plug 'AndrewRadev/linediff.vim'

call plug#end()
filetype plugin indent on

" Enable syntax highlighting if available:
syntax on
colorscheme elflord
highlight DiffAdd ctermbg=22 guibg=22
highlight DiffDelete ctermbg=52 guibg=52
highlight DiffChange ctermbg=17 guibg=17
highlight DiffText ctermbg=23 guibg=23

" Required for operations modifying multiple buffers like rename.
set hidden

" options for ALE
let g:ale_completion_enabled = 1
set completeopt-=preview
let g:ale_fix_on_save = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_fixers = {
\   'typescript': ['tslint', 'eslint', 'prettier'],
\   'javascript': ['eslint'],
\}
"\   'cpp': ['cquery'],
let g:ale_linters = {
\   'typescript': ['tsserver', 'tslint', 'eslint', 'prettier'],
\   'javascript': ['eslint'],
\   'html': ['htmlhint', 'tidy'],
\   'sass': ['sasslint'],
\   'scss': ['sasslint'],
\   'python': ['pyls', 'flake8', 'mypy', 'pylint'],
\   'cpp': ['cquery'],
\}
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_cpp_cquery_executable = '/home/zed0/src/cquery/build/release/bin/cquery'
" Autoload local vimrcs
let g:localvimrc_whitelist='.*'

" options for airline
set laststatus=2
let g:airline_extensions = ['tabline', 'branch', 'ale']
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

"
" get the colours working like I want (done with autocmd because otherwise
" something overwrites it):
" Should really use an after file
set fillchars=vert:\ 
autocmd VimEnter * highlight VertSplit cterm=NONE ctermbg=235
autocmd VimEnter * highlight StatusLine cterm=NONE ctermbg=235
autocmd VimEnter * highlight StatusLineNC cterm=NONE ctermbg=235 ctermfg=235
autocmd VimEnter * highlight Error term=NONE ctermfg=124 ctermbg=88
autocmd VimEnter * highlight ErrorMsg ctermbg=88
autocmd VimEnter * highlight SpellBad ctermbg=88
autocmd VimEnter * highlight todo term=NONE ctermfg=202 ctermbg=214
autocmd VimEnter * highlight Search ctermbg=100 ctermfg=black
autocmd VimEnter * highlight Pmenu ctermbg=DarkMagenta ctermfg=black
autocmd VimEnter * highlight PmenuSel ctermbg=DarkMagenta ctermfg=gray
autocmd VimEnter * highlight clear AlBl_active
autocmd VimEnter * highlight link AlBl_active Al6
autocmd VimEnter * highlight clear AlBl_inactive
autocmd VimEnter * highlight link AlBl_inactive Al5
autocmd VimEnter * highlight ALEErrorSign term=NONE ctermfg=9
autocmd VimEnter * highlight ALEWarningSign term=NONE ctermfg=11
autocmd VimEnter * highlight ALEInfoSign term=NONE ctermfg=12
autocmd VimEnter * highlight ALEWarning ctermbg=88

" options for rooter
let g:rooter_use_lcd = 1
let g:rooter_silent_chdir = 1

" options for gundo
let g:gundo_focus_main_buffer = 0
let g:gundo_preview_bottom = 1

" opitons for delimitMate
let delimitMate_expand_cr = 1
let delimitMate_matchpairs = "(:),[:],{:}"
let delimitMate_quotes = ""

" EasyAlign mappings:
vmap <Enter> <Plug>(EasyAlign)

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" options for autoformat
" same as default version but uses npm bin to get local version
let g:formatdef_tsfmt = "'$(cd $(dirname '.bufname('%').') && npm bin)/tsfmt --stdin '.bufname('%')"

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

set number
set relativenumber

" Function key mappings:
nnoremap <silent> <F1> :ALEHover<CR>

nnoremap <F2> :call NumberToggle()<cr>
nnoremap <F3> :GundoToggle<CR>
nnoremap <F5> :Autoformat<CR>

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
autocmd FileType robot  setlocal expandtab
"autocmd FileType robot  let b:SuperTabDisabled = 1

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
nnoremap <leader>l :set hlsearch! <cr>
nnoremap <leader>p :set paste! <cr>
imap <C-p> <C-o>:set paste!<cr>
" Map GoTo to <leader>d
nnoremap <leader>d :ALEGoToDefinition<CR>
nnoremap <leader>sd :sp<CR>:ALEGoToDefinition<CR>
nnoremap <leader>td :tab :sp<CR>:ALEGoToDefinition<CR>
" switch from *.cpp to *.h and *.js to *.cpp
nnoremap <leader>h :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,:s,.js$,.Y123Y,:s,.html$,.js,:s,.Y123Y$,.html,<CR>
nnoremap <leader>sh :sp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,:s,.js$,.Y123Y,:s,.html$,.js,:s,.Y123Y$,.html,<CR>
nnoremap <leader>th :tabe %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,:s,.js$,.Y123Y,:s,.html$,.js,:s,.Y123Y$,.html,<CR>

if has('nvim')
	nnoremap <C-W>t :sp<CR>:term<CR>
endif

" FZF bindings
" Global version of ag (we normally use the local working directory)
command! -nargs=* Agg
  \ call fzf#vim#ag(<q-args>, {'dir': getcwd(-1)})

map <leader>o :Files<CR>
map <leader>O :exec ':Files '.getcwd(-1)<CR>
map <leader>i :Ag 
map <leader>I :Agg 
map <leader>s :Snippets<CR>
map <leader>u :call fzf#run({'source': map(range(1, bufnr('$')), 'bufname(v:val)'), 'sink': 'e', 'down': '30%'})<CR>

" set folding type:
set foldmethod=indent
set foldlevel=200

set exrc
set secure
