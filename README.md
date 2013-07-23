To install use:
```
	curl -L https://raw.github.com/zed0/dotfiles/master/bin/install.sh | sh
```

Once you've installed this base system you probably want to go into vim and run:
```
	:BundleInstall
```
This should install all the bundles listed in the .vimrc, although YouCompleteMe will probably require additional configuration depending on what version of vim and clang you have installed.
