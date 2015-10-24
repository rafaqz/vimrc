cd ~/.vim_runtime

echo 'set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/settings.vim
source ~/.vim_runtime/vimrcs/plugins.vim
source ~/.vim_runtime/vimrcs/functions.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/mapping.vim' > ~/.vimrc

echo "Config Installed. Run :PlugInstall to load plugins"
