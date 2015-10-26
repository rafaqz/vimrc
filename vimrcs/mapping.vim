"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Leaders

let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Moving around

" easyoperator
xmap <leader><leader>v <Plug>(easyoperator-line-select)
nmap <leader><leader>d <Plug>(easyoperator-line-delete)
nmap <leader><leader>y <Plug>(easyoperator-line-yank)

" Map escape to jk
" :inoremap kj <ESC>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Editing


" Redo
map <S-u> :rjdo<crj

" Paste!
nnoremap <leader>po "*p
nnoremap <leader>pp "+p
nnoremap <leader>Po "*P
nnoremap <leader>Pp "+P
nnoremap <leader>PO "*P
nnoremap <leader>PP "+P
nnoremap <leader>pO "*P
nnoremap <leader>pP "+P

" Remap VIM 0 to first non-blank character
" map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k> "   vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Saving

" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Remember info about open buffers on close
" set viminfo^=%

map ,ww :call DeleteTrailingWS()<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Searching

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<cr>
vnoremap <silent> # :call VisualSelection('b', '')<cr>

:map ]] :cnext<cr>
:map [[ :cprevious<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Buffers 

" Close the current buffer
map <leader>bd :Bclose<cr>
" Close all the buffers
map <leader>ba :1,1000 bd!<cr>
" previous buffer, next buffer
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>
" close every window in current tabview but the current
nnoremap <leader>bo <c-w>o
" delete buffer without closing pane
noremap <leader>bd :Bd<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Tabs

" Tab keys
nnoremap tt  :tabs<cr>
nnoremap th  :silent! :tabfirst<cr>
nnoremap tk  :silent! :tabnext<cr>
nnoremap tj  :silent! :tabprev<cr>
nnoremap tl  :silent! :tablast<cr>
" nnoremap te  :tabedit<Space>
nnoremap tm  :tabmove<Space>
nnoremap td  :tabclose<cr>
nnoremap tn  :tabnew<cr>
nnoremap tN  :tabnew#<cr>
nnoremap to  :tabonly<cr>
nnoremap tc  :tabclose<cr>
nnoremap tJ  :tabmove -1<cr>
nnoremap tK  :tabmove +1<cr>
nnoremap TJ  :tabmove -1<cr>
nnoremap TK  :tabmove +1<cr>
" Open tags in a new tab.
nnoremap <silent>t] <C-w><C-]><C-w>T
" toggle between this and the last accessed tab
let g:lasttab = 1
nmap tu :exe "tabn ".g:lasttab<cr>
au TabLeave * let g:lasttab = tabpagenr()
" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map te :tabedit <c-r>=expand("%:p:h")<cr>/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Splits

" Split navigation
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <C-t> <C-W>T

" Not working
" nnoremap <M-h> :resize +5<cr>
" nnoremap <M-l> :resize -5<cr>

" Open window splits in various places
nmap <leader>sh :leftabove  vnew<CR>
nmap <leader>sl :rightbelow vnew<CR>
nmap <leader>sk :leftabove  new<CR>
nmap <leader>sj :rightbelow new<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Spell checking

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>
nnoremap <leader>sx ea<C-X><C-S>
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Command Line

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ External apps

" Urxvt - not useing $TERM as it's set to "rxvt" for compatability issues.
noremap <leader>uu :cd %:p:h<cr>:pwd<cr>:silent !urxvtr<cr>

" Ranger - put this in your bashrc: source /usr/share/doc/ranger/examples/bash_automatic_cd.sh
nnoremap <leader>ur :cd %:p:h<cr>:pwd<cr>:silent !urxvtr -e ranger<cr>
" Opening files with ranger
nnoremap grr :call RangerChooser("edit")<cr>
nnoremap grv :call RangerChooser("vertical split")<cr>
nnoremap grs :call RangerChooser("split")<cr>
nnoremap grt :call RangerChooser("tabedit")<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Plugins

" {{{ Table Mode
nmap <leader>tm :TableModeToggle<cr>       

""""""""""""""""""""""""""""""}}}
" {{{ Pad
nmap <leader>nl         <Plug>(pad-list)                     " open the notes list
" nmap <leader>nn         <Plug>(pad-new)                      " create a new note
nmap <leader>nn         :Pad new<space>
nmap <leader>ns         <Plug>(pad-search)                   " search for a note
nmap <leader>ns<leader> <Plug>(pad-incremental-search)       " search incrementally for a note
nmap <leader>ns!        <Plug>(pad-incremental-new-note)     " create a new note with incremental search

""""""""""""""""""""""""""""""}}}
" {{{ Ctrl-P
let g:ctrlp_map = '<c-f>'
map <c-b> :CtrlPBuffer<cr>
map <c-m> :CtrlPMRUFiles<cr>

""""""""""""""""""""""""""""""}}}
" {{{ NeoSnippet
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

""""""""""""""""""""""""""""""}}}
" {{{ Git
nnoremap <leader>gd :Gdiff HEAD<cr>
nnoremap <leader>gh :Gdiff HEAD~
nnoremap <leader>gc :Gcommit -m '
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>ge :Extradite<cr>
nnoremap <silent> <leader>g? :call CommittedFiles()<CR>:copen<CR>
nmap <leader>gg :copen<CR>:GGrep 

""""""""""""""""""""""""""""""}}}
" {{{ Tagbar
  map <leader>tt :TagbarToggle<CR>

""""""""""""""""""""""""""""""}}}
" {{{ Undo tree
nmap <silent> <leader>u :GundoToggle<CR>

""""""""""""""""""""""""""""""}}}
" {{{ Vimtex
nnoremap <leader>xx :VimtexView<cr>
nnoremap <leader>xv :VimtexView<cr>
nnoremap <leader>xs :VimtexRSearch<cr>
nnoremap <leader>xc :VimtexCompile<cr>
nnoremap <leader>xe :VimtexErrors<cr>
nnoremap <leader>xi :VimtexInfo<cr>
nnoremap <leader>xt :VimtexTocOpen<cr>
nnoremap <leader>xl :VimtexLabelsOpen<cr>

""""""""""""""""""""""""""""""}}}
" {{{ Rails
nnoremap trm          :Tmodel<cr>
nnoremap trv          :Tview<cr>
nnoremap trc          :Tcontroller<cr>
nnoremap trs          :Tschema<cr>
nnoremap tri          :Tintegrationtest<cr>

nnoremap <leader>rtm  :Tmodel<cr>
nnoremap <leader>rtv  :Tview<cr>
nnoremap <leader>rtc  :Tcontroller<cr>
nnoremap <leader>rts  :Tschema<cr>
nnoremap <leader>rtt  :Tintegrationtest<cr>

nnoremap <leader>rem  :Emodel<cr>
nnoremap <leader>rev  :Eview<cr>
nnoremap <leader>rec  :Econtroller<cr>
nnoremap <leader>res  :Eschema<cr>
nnoremap <leader>ret  :Eintegrationtest<cr>

nnoremap <leader>rsm  :Smodel<cr>
nnoremap <leader>rsv  :Sview<cr>
nnoremap <leader>rsc  :Scontroller<cr>
nnoremap <leader>rss  :Sschema<cr>
nnoremap <leader>rst  :Sintegrationtest<cr>

nnoremap <leader>rvm  :Vmodel<cr>
nnoremap <leader>rvv  :Vview<cr>
nnoremap <leader>rvc  :Vcontroller<cr>
nnoremap <leader>rvs  :Vschema<cr>
nnoremap <leader>rvt  :Vintegrationtest<cr>

vnoremap <leader>rxm  :RExtractMethod<cr>
vnoremap <leader>rxc  :RExtractConstant<cr>
vnoremap <leader>rxv  :RExtractLocalVariable<cr>
vnoremap <leader>rxl  :RExtractLet<cr>
vnoremap <leader>rxx  :Rextract<space>

""""""""""""""""""""""""""""""}}}
" {{{ Limelight
nnoremap <silent> <leader>l :Limelight!!<cr>

""""""""""""""""""""""""""""""}}}
" {{{ Goyo
nnoremap <silent> <leader>z :Goyo<cr> 

""""""""""""""""""""""""""""""}}}
" Alignment {{{

" Align on equal signs
map <Leader>a= :Align =<CR>
" Align on commas
map <Leader>a, :Align ,<CR>
" Align on pipes
map <Leader>a<bar> :Align <bar><CR>
" Prompt for align character
map <leader>ap :Align

""""""""""""""""""""""""""""""}}}
" Slime {{{

" vmap <silent> <Leader>rs <Plug>SendSelectionToTmux
" nmap <silent> <Leader>rs <Plug>NormalModeSendToTmux
" nmap <silent> <Leader>rv <Plug>SetTmuxVars

""""""""""""""""""""""""""""""}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" Unused {{{
"
" Manually create key mappings (to avoid rebinding C-\)
" let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
"
" Set to auto read when a file is changed from the outside
" set autoread

" Allow the normal use of "," by pressing it twice
" noremap ,, ,

" Find custom built ghc-mod, codex etc
" let $PATH = $PATH . ':' . expand("~/.haskell-vim-now/bin")
"
" let Vundle manage Vundle

" " Support bundles
" Plugin 'jgdavey/tslime.vim'
" Plugin 'Shougo/vimproc.vim'
" Plugin 'scrooloose/syntastic'
" Plugin 'moll/vim-bbye'
" Plugin 'nathanaelkane/vim-indent-guides'
" Plugin 'vim-scripts/gitignore'

" Plugin 'vim-scripts/Gundo'

" " Allow pane movement to jump out of vim into tmux
" Plugin 'christoomey/vim-tmux-navigator'

" " Haskell
" Plugin 'raichoo/haskell-vim'
" Plugin 'enomsg/vim-haskellConcealPlus'
" Plugin 'eagletmt/ghcmod-vim'
" Plugin 'eagletmt/neco-ghc'
" Plugin 'Twinside/vim-hoogle'
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>
