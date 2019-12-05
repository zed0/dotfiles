" vimrc by zed0

" Install vim-plug if it's not installed
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle/')

" Add Bundles here
" To disable plugins comment out the line and run `:PlugClean`
" If the plugin has specific settings then move it to a separate file

" Local config
source ~/.vim/config/embear/vim-localvimrc.vim

" Code completion
source ~/.vim/config/SirVer/ultisnips.vim
source ~/.vim/config/neoclide/coc.nvim.vim

"Autoformatting
source ~/.vim/config/Chiel92/vim-autoformat.vim
Plug 'editorconfig/editorconfig-vim'

"Rooter
source ~/.vim/config/airblade/vim-rooter.vim

"status line
source ~/.vim/config/vim-airline/vim-airline.vim

"fuzzy finder
source ~/.vim/config/junegunn/fzf.vim

"VCS
Plug 'ludovicchabant/vim-lawrencium'
Plug 'tpope/vim-fugitive'

"misc
Plug 'junegunn/vim-easy-align'
source ~/.vim/config/Raimondi/delimitMate.vim
Plug 'jtratner/vim-flavored-markdown'
Plug 'MattesGroeger/vim-bookmarks'
source ~/.vim/config/sjl/gundo.vim.vim
Plug 'AndrewRadev/linediff.vim'
Plug 'tpope/vim-abolish'

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

" EasyAlign mappings:
vmap <Enter> <Plug>(EasyAlign)

" Default to relative line numbers with current linenumber shown
set number
set relativenumber

" Function key mappings:
nnoremap <silent> <F1> :call <SID>show_documentation()<CR>
nnoremap <F2> :call NumberToggle()<cr>
nnoremap <F3> :GundoToggle<CR>
nnoremap <F5> :Autoformat<CR>
" TODO: Look at using coc for autoformatting
"nnoremap <F5> :call CocAction('format')<CR>

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
"autocmd VimEnter * highlight SpecialKeys ctermfg=30
" show unprintable characters
set list

" more bash-like filename completion:
set wildmenu
set wildmode=longest,list
if (has('wildignorecase'))
	set wildignorecase
endif

set tabstop=4 | set noexpandtab
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
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>sd :sp<CR><Plug>(coc-definition)
nmap <silent> <leader>r <Plug>(coc-references)
nmap <silent> <leader>f :CocFix<CR>
nmap <silent> <leader>a <Plug>(coc-codeaction)
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <silent> <leader>rn <Plug>(coc-rename)
" switch from *.cpp to *.h and *.js to *.cpp
nnoremap <leader>h :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,:s,.js$,.Y123Y,:s,.html$,.js,:s,.Y123Y$,.html,<CR>
nnoremap <leader>sh :sp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,:s,.js$,.Y123Y,:s,.html$,.js,:s,.Y123Y$,.html,<CR>
nnoremap <leader>th :tabe %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,:s,.js$,.Y123Y,:s,.html$,.js,:s,.Y123Y$,.html,<CR>

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
