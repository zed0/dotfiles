"Stuff to only be set in neovim

if has('nvim')
	set inccommand=nosplit
	nnoremap <C-W>t :sp<CR>:term<CR>
endif
