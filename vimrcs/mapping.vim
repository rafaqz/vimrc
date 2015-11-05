"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Leaders

let mapleader = "\<space>"
let g:mapleader = "\<space>"
let maplocalleader = "\\"

" Disable highlight
map <silent> <leader><cr> :noh<cr>
" Search for pandoc @citations and images
map <leader>1 /!\[./e<cr>
map <leader>2 /@./e<cr>
map <leader>9 /\](./e<cr>
"  Buffers
map      <leader>bd :Bclose<cr>     " Close the current buffer
map      <leader>ba :1,1000 bd!<cr> " Close all the buffers
nnoremap <leader>bj :bp<cr>    " previous buffer, next buffer
nnoremap <leader>bk :bn<cr>
nnoremap <leader>bo <c-w>o     " close every window in current tabview but the current
nnoremap <leader>bd :bd<cr>     " delete buffer without closing pane
" Pandoc compilation
nnoremap <leader>cc :Pandoc pdf<cr>
" Swap background color
nnoremap <leader>dw :call DeleteTrailingWS()<cr>
nnoremap <leader>f gwip " Format paragraph
nnoremap <leader>i :let &background = ( &background == "dark"? "light" : "dark" )<CR>
" Urxvt
nnoremap <leader>j :cd %:p:h<cr>:pwd<cr>:silent !urxvtr<cr> "Urxvt - not useing $TERM as it's set to "rxvt" for compatability issues.
" Lexical
" let g:lexical#thesaurus_key = '<leader>t'
" let g:lexical#dictionary_key = '<leader>k'
" Remove the Windows ^M - when the encodings gets messed up
nnoremap <leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm 
" Pad
nmap <leader>nl         <Plug>(pad-list)                     " open the notes list
" nmap <leader>nn         <Plug>(pad-new)                      " create a new note
nmap <leader>n          :Pad new<space>
nmap <leader>ns         <Plug>(pad-search)                   " search for a note
nmap <leader>ns<leader> <Plug>(pad-incremental-search)       " search incrementally for a note
nmap <leader>ns!        <Plug>(pad-incremental-new-note)     " create a new note with incremental search
"Opening Files
"Gimp
nnoremap <leader>ofg :call OpenFile('gimp','f')<cr>
nnoremap <leader>obg :call OpenFile('gimp','b')<cr>
nnoremap <leader>owg :call OpenFile('gimp','w')<cr>
nnoremap <leader>oWg :call OpenFile('gimp','W')<cr>
nnoremap <leader>o(g :call OpenFile('gimp','(')<cr>
"Gpicview
nnoremap <leader>ofv :call OpenFile('gpicview','f')<cr>
nnoremap <leader>obv :call OpenFile('gpicview','b')<cr>
nnoremap <leader>owv :call OpenFile('gpicview','w')<cr>
nnoremap <leader>oWv :call OpenFile('gpicview','W')<cr>
nnoremap <leader>o(v :call OpenFile('gpicview','(')<cr>
"Paste
nnoremap <leader>po "*p
nnoremap <leader>pp "+p
nnoremap <leader>Po "*P
nnoremap <leader>Pp "+P
nnoremap <leader>PO "*P
nnoremap <leader>PP "+P
nnoremap <leader>pO "*P
nnoremap <leader>pP "+P
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
"Ranger
nnoremap <leader>rr :call RangerChooser("edit")<cr>
nnoremap <leader>rv :call RangerChooser("vertical split")<cr>
nnoremap <leader>rs :call RangerChooser("split")<cr>
nnoremap <leader>rt :call RangerChooser("tabedit")<cr>
nnoremap <leader>rp :call RangerPaste("a")<cr>
nnoremap <leader>rP :call RangerPaste("i")<cr>

nnoremap <leader>rf :call RangerOpenFolder('ranger','f')<cr>
nnoremap <leader>rb :call RangerOpenFolder('ranger','b')<cr>
nnoremap <leader>rw :call RangerOpenFolder('ranger','w')<cr>
nnoremap <leader>rW :call RangerOpenFolder('ranger','W')<cr>
nnoremap <leader>r( :call RangerOpenFolder('ranger','(')<cr>
nnoremap <leader>rj :cd %:p:h<cr>:pwd<cr>:silent !urxvtr -e ranger<cr>
" Spell checking
nnoremap <leader>ss :setlocal spell!<cr>
nnoremap <leader>sx ea<C-X><C-S>
nnoremap <leader>sa zg
nnoremap <leader>s? z=
" Splits
nnoremap <leader>sh :leftabove  vnew<CR>
nnoremap <leader>sl :rightbelow vnew<CR>
nnoremap <leader>sk :leftabove  new<CR>
nnoremap <leader>sj :rightbelow new<CR>
" Git
nnoremap <leader>gd :Gdiff HEAD<cr>
nnoremap <leader>gh :Gdiff HEAD~
nnoremap <leader>gc :Gcommit -m '
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>ge :Extradite<cr>
nnoremap <silent> <leader>g? :call CommittedFiles()<CR>:copen<CR>
nmap     <leader>gs :copen<CR>:GGrep
nmap     <leader>gg :GitGutterToggle<cr>
" Table Mode
nnoremap <leader>t :TableModeToggle<cr>
" Undo tree
" nnoremap <leader>u :GundoToggle<CR>
"Save
nnoremap <leader>w :w<CR>
" Goyo
nnoremap <silent> <leader>z :Goyo<cr>

" Use unite matching to open bibtex files and urls
nnoremap <silent><leader>cf :<C-u>Unite -buffer-name=bibtex -input=<C-R><C-W> -default-action=start -force-immediately bibtex_file<cr>
nnoremap <silent><leader>cu :<C-u>Unite -buffer-name=bibtex -input=<C-R><C-W> -default-action=start -force-immediately bibtex_uri<cr>
nnoremap <silent><leader>cU :<C-u>Unite -buffer-name=bibtex -input=<C-R><C-W> -default-action=yank -force-immediately bibtex_file<cr>
nnoremap <silent><leader>cF :<C-u>Unite -buffer-name=bibtex -input=<C-R><C-W> -default-action=yank -force-immediately bibtex_uri<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Unite

nmap <leader>u [unite]
nnoremap [unite] <nop>

nnoremap <silent>[unite]<space> :<C-u>Unite                       -start-insert                             source<cr>
nnoremap <silent>[unite]fr      :<C-u>Unite -buffer-name=files    -start-insert                             file_rec/async:!<cr>
nnoremap <silent>[unite]f       :<C-u>Unite -buffer-name=files    -start-insert                             file<cr>
nnoremap <silent>[unite]b       :<C-u>Unite -buffer-name=buffer   -start-insert                             buffer<cr>
nnoremap <silent>[unite]h       :<C-u>Unite -buffer-name=help     -start-insert                             help<cr>
nnoremap <silent>[unite]r       :<C-u>Unite -buffer-name=mru      -start-insert                             file_mru<cr>
nnoremap <silent>[unite]gi      :<C-u>Unite -buffer-name=giti     -start-insert                             giti<cr>
nnoremap <silent>[unite]s       :<C-u>Unite -buffer-name=grep     -start-insert                             grep<cr>
nnoremap <silent>[unite]l       :<C-u>Unite -buffer-name=line     -start-insert                             line<cr>
nnoremap <silent>[unite]:       :<C-u>Unite -buffer-name=command  -start-insert                             command<cr>
nnoremap <silent>[unite];       :<C-u>Unite -buffer-name=command  -start-insert                             command<cr>
nnoremap <silent>[unite]u       :<C-u>Unite -buffer-name=function -start-insert                             function<cr>
nnoremap <silent>[unite]m       :<C-u>Unite -buffer-name=bookmark -start-insert                             bookmark<cr>
nnoremap <silent>[unite]n       :<C-u>Unite -buffer-name=neo      -start-insert                             neosnippet<cr>
nnoremap <silent>[unite]k       :<C-u>Unite -buffer-name=mapping  -start-insert                             mapping<cr>
nnoremap <silent>[unite]q       :<C-u>Unite -buffer-name=process  -start-insert                             process<cr>
nnoremap <silent>[unite]i       :<C-u>Unite -buffer-name=history  -start-insert                             history/unite<cr>
nnoremap <silent>[unite]o       :<C-u>Unite -buffer-name=outline                                            outline<cr>
nnoremap <silent>[unite]j       :<C-u>Unite -buffer-name=jump                                               jump<cr>
nnoremap <silent>[unite]p       :<C-u>Unite -buffer-name=yank                   -default-action=append      history/yank<cr>
nnoremap <silent>[unite]e       :<C-u>Unite -buffer-name=files    -start-insert -default-action=start -quit file<cr>
nnoremap <silent>[unite]t       :<C-u>Unite -buffer-name=theme   -start-insert -auto-preview               colorscheme<cr>
nnoremap <silent>[unite]a       :<C-u>Unite -buffer-name=airline  -start-insert -auto-preview               airline_themes<cr>
nnoremap <silent>[unite]P       :<C-u>Unite -buffer-name=history                -default-action=insert      history/yank<cr>
nnoremap <silent>[unite]c       :<C-u>Unite -buffer-name=bibtex   -start-insert -default-action=append      bibtex<cr>
nnoremap <silent>[unite]cf      :<C-u>Unite -buffer-name=bibtex   -start-insert -default-action=start       bibtex_file<cr>
nnoremap <silent>[unite]cu      :<C-u>Unite -buffer-name=bibtex   -start-insert -default-action=start       bibtex_uri<cr>
nnoremap <silent>[unite]d       :<C-u>Unite -buffer-name=autojump -start-insert                             autojump<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Tabs get to steal t 

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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Other
nnoremap Q <nop> " Kill the damned Ex mode.
" :map ]] :cnext<cr>
" :map [[ :cprevious<cr>
" Treat long lines as break lines but don't break dj or <count>j behavior
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
noremap <buffer> <silent> 0 g0
noremap <buffer> <silent> $ g$
" Save file as sudo
command W w !sudo tee % > /dev/null
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<cr>
vnoremap <silent> # :call VisualSelection('b', '')<cr>
vnoremap v <Plug>(expand_region_expand)
vnoremap <C-v> <Plug>(expand_region_shrink)
"Paste multiple lines multiple times
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" NeoSnippet SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
