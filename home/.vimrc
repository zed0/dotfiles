""" vimrc by zed0
" .vim/plugin    " extra functions
" .vim/ftplugin  " filetype specific settings
" .vim/config    " plugin specific configuration
" .vim/UltiSnips " snippets


""" Plugins

" Install vim-plug if it's not installed
if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle/')

" Add plugins here
" To disable plugins comment out the line and run `:PlugClean`
" If the plugin has specific settings then move it to a separate file

source ~/.vim/config/embear/vim-localvimrc.vim   " Local config
source ~/.vim/config/SirVer/ultisnips.vim        " Snippets
source ~/.vim/config/neoclide/coc.nvim.vim       " Completion/linting
source ~/.vim/config/Chiel92/vim-autoformat.vim  " autoformatting
Plug 'editorconfig/editorconfig-vim'             " editorconfig support
source ~/.vim/config/airblade/vim-rooter.vim     " local working directories
source ~/.vim/config/vim-airline/vim-airline.vim " status line
source ~/.vim/config/junegunn/fzf.vim            " fuzzy finder
Plug 'ludovicchabant/vim-lawrencium'             " mercurial support
Plug 'tpope/vim-fugitive'                        " git support
Plug 'junegunn/vim-easy-align'                   " align blocks based on characters
Plug 'jtratner/vim-flavored-markdown'            " markdown syntax highlighting
source ~/.vim/config/sjl/gundo.vim.vim           " undo tree
Plug 'AndrewRadev/linediff.vim'                  " diff lines from buffers
Plug 'tpope/vim-abolish'                         " more intelligent regexes
" TODO: Check if I actually want this
source ~/.vim/config/Raimondi/delimitMate.vim    " add matching brackets
" TODO: Look at using vim-signature instead
Plug 'MattesGroeger/vim-bookmarks'               " bookmarks

" End of plugins
call plug#end()
filetype plugin indent on

" Enable syntax highlighting if available:
syntax on
colorscheme elflord
highlight DiffAdd ctermbg=22 guibg=22
highlight DiffDelete ctermbg=52 guibg=52
highlight DiffChange ctermbg=17 guibg=17
highlight DiffText ctermbg=23 guibg=23


""" Standard settings

set number                   " Default to relative line numbers with current linenumber shown
set relativenumber
set hidden                   " don't force a save when moving to another buffer (required for operations modifying multiple buffers like rename)
set backspace=2              " allow backspacing over everything in insert mode
set autoindent               " Now we set some defaults for the editor
set textwidth=0              " Don't wrap words by default
set linebreak                " Turn linewrap on
set showbreak=>>             " broken line character
set nobackup                 " Don't keep a backup file
set nowritebackup
set history=50               " keep 50 lines of command line history
set ruler                    " show the cursor position all the time
set showcmd                  " Show (partial) command in status line.
set showmatch                " Show matching brackets.
set ignorecase               " Do case insensitive matching
set incsearch                " Incremental search
set hlsearch                 " Highlight matches
set is                       " display search
set list                     " show unprintable characters (tabs)
set listchars=tab:->,trail:- " show tabs and trailing spaces and slightly darker than default colour
set tabstop=4                " visual tab width
set noexpandtab              " use real tabs rather than spaces
set shiftwidth=4             " indent by this much using >
set mouse=a                  " enable mouse in all modes
set scrolloff=10             " Keep at least 10 lines visible above and below the cursor if possible
set foldmethod=indent        " fold based on indentation
set foldlevel=200            " default to all folds shown
set exrc                     " allow opening local vimrc files
set secure                   " don't allow local vimrc files to run dodgy commands
set wildmenu                 " more bash-like filename completion:
set wildmode=longest,list
if (has('wildignorecase'))
	set wildignorecase
endif


"""" Mappings

let mapleader=","

" Use w!! to sudo for a file if you forget to sudo vim:
cmap w!! %!sudo tee > /dev/null %

" H and L go to begining and end of line
noremap H 0
noremap L $

" Function key mappings:
nnoremap <silent> <F1> :call <SID>show_documentation()<CR>
nnoremap <silent> <F2> :call NumberToggle()<cr>
nnoremap <silent> <F3> :GundoToggle<CR>
nnoremap <silent> <F5> :Autoformat<CR>
" TODO: Look at using coc for autoformatting
"nnoremap <F5> :call CocAction('format')<CR>

vnoremap <Enter> <Plug>(EasyAlign)

" gp selects pasted text
nnoremap gp `[v`]
nnoremap <leader>p :set paste! <cr>
nnoremap <leader>l :set hlsearch! <cr>

" language server mappings
nnoremap <silent> <leader>d <Plug>(coc-definition)
nnoremap <silent> <leader>sd :sp<CR><Plug>(coc-definition)
nnoremap <silent> <leader>r <Plug>(coc-references)
nnoremap <silent> <leader>f :CocFix<CR>
nnoremap <silent> <leader>rn <Plug>(coc-rename)
nnoremap <silent> <leader>a <Plug>(coc-codeaction)
xnoremap <silent> <leader>a <Plug>(coc-codeaction-selected)

" switch from *.cpp to *.h and *.js to *.cpp
nnoremap <leader>h :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,:s,.js$,.Y123Y,:s,.html$,.js,:s,.Y123Y$,.html,<CR>
nnoremap <leader>sh :sp %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,:s,.js$,.Y123Y,:s,.html$,.js,:s,.Y123Y$,.html,<CR>
nnoremap <leader>th :tabe %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,:s,.js$,.Y123Y,:s,.html$,.js,:s,.Y123Y$,.html,<CR>

" open various things in fuzzy finder
nnoremap <leader>o :Files<CR>
nnoremap <leader>O :exec ':Files '.getcwd(-1)<CR>
nnoremap <leader>i :Ag 
nnoremap <leader>I :Agg 
nnoremap <leader>s :Snippets<CR>
nnoremap <leader>u :call fzf#run({'source': map(range(1, bufnr('$')), 'bufname(v:val)'), 'sink': 'e', 'down': '30%'})<CR>
