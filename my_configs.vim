
"Color scheme
colorscheme solarized
set background=dark
set t_Co=256

" Add custom vim plugins
call pathogen#infect('~/.vim_runtime/drush/bundle')

" Tab keys
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tm  :tabmove<Space>
nnoremap td  :tabclose<CR>
nnoremap tn  :tabnew<CR>
nnoremap to  :tabonly<CR>
nnoremap tc  :tabclose<CR>

" Tab spacing
set expandtab
set shiftwidth=2
set softtabstop=2
set number

" Session
set ssop-=options    " do not store global and local values in a session
set ssop-=folds      " do not store folds
set ssop-=buffers    " do not store buffers
" Save session
nnoremap <leader>sw  :wa<CR>:mksession!<Space>~/sessions/
" Open session
nnoremap <leader>se  :source ~/sessions/

" Tags - search down to root to find them.
set tags=./tags;/

" Overrides
iunmap $e
iunmap $t
iunmap $q
nunmap <space>
iunmap $1 
iunmap $2
iunmap $3
iunmap $4
