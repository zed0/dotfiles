Plug 'vim-airline/vim-airline'

" options for airline
set laststatus=2
let g:airline_extensions = ['tabline', 'branch']
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

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
