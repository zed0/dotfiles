Plug 'Chiel92/vim-autoformat'

" same as default version but uses npm bin to get local version
let g:formatdef_tsfmt = "'$(cd $(dirname '.bufname('%').') && npm bin)/tsfmt --stdin '.bufname('%')"

