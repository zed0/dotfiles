"Stuff to only be set in vim (not neovim)

if !has('nvim')
	" Use vim defaults rather than vi
	set nocompatible
	set term=xterm
	" Use 256 colours (all modern terminals support this)
	set t_Co=256
endif
