# Git + Pandoc Markdown + Haskell + Ruby vimrc.

This is my vimrc, it was originally based on the Ultimate vimrc but is heavily 
modified and reorganised to have a simpler layout.

git://github.com/amix/vimrc.git

To install run
```
	git clone git://github.com/rafaqz/vimrc.git ~/.vim_runtime
	sh ~/.vim_runtime/install.sh
```

It includes plugins for git, Ruby  and Haskell. It's also features integration 
with the ranger file manager, which I highly recomment. See my dotfiles for ranger configs.

## Dependencies

Available through most package managers:

ctags
git
ranger

### Haskel specific
install stack
stack install codex hlint ghc-mod stylish-haskel hasktags hscope pointful

## Key Mapping
General: vimrcs/mapping.config
Language specific mappings are in the "mappings" section of each filetype.vim

It's best that you become familiar with theses files! You WILL need to edit them
sooner or later. Don't keep pulling from this repo, start your own. You will
only get a solid vim workflow when you start editing it for your own needs, not
using something built for my needs.
