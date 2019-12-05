"Stuff to only be set in vim (not neovim)

if !has('nvim')
	" Use vim defaults rather than vi
	set nocompatible
	set term=xterm
	" Use 256 colours (all modern terminals support this)
	set t_Co=256

	" Make the mouse work
	map <MouseDown> <C-U>
	map <MouseUp> <C-E>
	" Make scrollwheel work in a normal fashion:
	map <ScrollWheelUp> <C-Y>
	map <ScrollWheelDown> <C-E>
endif
