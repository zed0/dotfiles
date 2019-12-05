Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Global version of ag (we normally use the local working directory)
command! -nargs=* Agg
  \ call fzf#vim#ag(<q-args>, {'dir': getcwd(-1)})
