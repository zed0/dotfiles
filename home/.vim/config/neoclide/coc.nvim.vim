Plug 'neoclide/coc.nvim', {'branch': 'release'}

inoremap <silent><expr> <TAB>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Update linting results faster (default is 4000)
set updatetime=300

" Plugins

let g:coc_global_extensions = [
	\ 'coc-angular',
	\ 'coc-tsserver',
	\ 'coc-ultisnips',
	\ 'coc-css',
	\ 'coc-eslint',
	\ 'coc-html',
	\ 'coc-json',
	\ 'coc-python',
	\ 'coc-rls',
	\ 'coc-tslint-plugin',
	\ 'coc-tsserver'
\ ]

