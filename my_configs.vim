fun! RangerChooser() 
    let cmd = printf("sil !ranger --choosefile=/tmp/chosenfile %s", 
        \ expand("%:p:h")) 
    if has("gui_running") && (has("gui_gtk") || has("gui_motif")) 
         let cmd = substitute(cmd, '!', '! xterm -e ', '') 
    endif 
    exe cmd 
    if filereadable('/tmp/chosenfile') 
    exec 'edit ' . system('cat /tmp/chosenfile') 
    call system('rm /tmp/chosenfile') 
    endif 
    redraw! 
endfun 

map <leader>r :call RangerChooser()<CR>

" Add custom vim plugins
call pathogen#infect('~/.vim_runtime/drush/bundle')

"Color scheme
colorscheme solarized
set background=dark
set t_Co=256

map <leader>p :cd %:p:h;

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
" Open tags in a new tab.
nnoremap <silent>t] <C-w><C-]><C-w>T

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
iunmap <leader>e
iunmap $1 
iunmap $2
iunmap $3
iunmap $4

" Use ranger as vim file manager



"Custom
"iunmap <leader>g 
"nnoremap <leader>gd :Gdiff HEAD<CR>
"nnoremap <leader>gh :Gdiff HEAD~
"nnoremap <leader>gc :Gcommit -m '
"nnoremap <leader>gp :Git push<CR>
"nnoremap <leader>gl :Git log<CR>
"nnoremap <leader>gr :Git rebase -i<CR>
