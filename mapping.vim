"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Key mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ Leaders

let mapleader = "\<space>"
let g:mapleader = "\<space>"
let maplocalleader = "\\"

" Use easymotion on leader
map <Leader> <Plug>(easymotion-prefix)
" Remove find highlight
map <silent> <leader><cr> :noh<cr>
" Goyo reset
nmap <leader>a <c-w>=
" Delete white space
nnoremap <leader>dw :call DeleteTrailingWS()<cr>
nnoremap <leader>de :%s///g<cr>

"  Buffers
map      <leader>ba :1,100 bd!<cr> " Close all the buffers
nnoremap <leader>bj :bprevious<cr>
nnoremap <leader>bk :bnext<cr>
nnoremap <leader>bh :bfirst<cr>
nnoremap <leader>bl :blast<cr>
nnoremap <leader>bo <c-w>o     " close every window in current tabview but the current
nnoremap <leader>bd :bd<cr>    " delete buffer without closing pane
" Git
nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<space>
nnoremap <leader>ge :Extradite<cr>
nnoremap <leader>gh :Gbrowse<cr>
nnoremap <leader>gl :silent! Glog<cr>:bot copen<cr>
nnoremap <leader>gm :Gmove<space>
nnoremap <leader>go :Git checkout<space>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gr :Gread<cr>
nnoremap <leader>gw :Gwrite<cr>
nnoremap <leader>gv :Gitv!<cr>
nnoremap <leader>gV :Gitv<cr>
" nmap     <leader>gs :copen<cr>:GGrep
nmap     <leader>gg :GitGutterToggle<cr>
nmap     <leader>gga :GitGutterStageHunk<cr>
nmap     <leader>ggd :GitGutterPreviewHunk<cr>
nmap     <leader>ggh :GitGutterLineHighlightsToggle<cr>

xnoremap dp :diffput<cr>
xnoremap do :diffget<cr>

"Open files in gimp with a string operator
" nnoremap <leader>g :set operatorfunc=GimpOperator<cr>g@

" Hide tabs and status etc
nnoremap <leader>h :call ToggleHideAll()<cr>
" Swap background color
" nnoremap <silent><leader>i :let &background = ( &background == "dark"? "light" : "dark" )<cr>
nnoremap <silent><leader>i :call ToggleBackground()<cr>

nmap <Leader>ll :Limelight!!<cr>
nmap <Leader>ls <Plug>(Limelight)
xmap <Leader>ls <Plug>(Limelight)
" Grammar
" nmap <leader>ll :GrammarousCheck<cr>
" nmap <leader>lq <Plug>(grammarous-close-info-window)<cr>
" nmap <leader>l] <Plug>(grammarous-move-to-next-error)
" nmap <leader>l[ <Plug>(grammarous-move-to-previous-error)

nmap <leader>m :mark

" Notes
nmap <leader>nn :call Note('~/Documents/notes')<cr><cr>
nmap <leader>nu :call NoteMidDir('~/Projects/Uni','notes')<cr>
nmap <leader>nr :call Note('~/Documents/Reviews')<cr><cr>

"Open files with a string operator
nnoremap <leader>o :set operatorfunc=OpenOperator<cr>g@

"Paste
nnoremap <leader>po "*p
nnoremap <leader>pp "+p
nnoremap <leader>Po "*P
nnoremap <leader>Pp "+P
nnoremap <leader>PO "*P
nnoremap <leader>PP "+P
nnoremap <leader>pO "*P
nnoremap <leader>pP "+P
vmap <leader>y "+y
vmap <leader>d "+d
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P

" Remove the Windows ^M - when the encodings gets messed up
nnoremap <leader>dm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Ranger
map <leader>rc :set operatorfunc=RangerChangeOperator<cr>g@
map <leader>rR :set operatorfunc=RangerBrowseEdit<cr>g@
map <leader>rT :set operatorfunc=RangerBrowseTab<cr>g@
map <leader>rS :set operatorfunc=RangerBrowseSplit<cr>g@
map <leader>rV :set operatorfunc=RangerBrowseVSplit<cr>g@
map <leader>ri :RangerInsert<cr>
map <leader>ra :RangerAppend<cr>
map <leader>rr :RangerEdit<cr>
map <leader>rv :RangerVSplit<cr>
map <leader>rs :RangerSplit<cr>
map <leader>rt :RangerTab<cr>
map <leader>rd :RangerCD<cr>
map <leader>rl :RangerLCD<cr>

map <F4> :execute "vimgrep /" . expand("<cword>") . "/j **" <Bar> cw<CR>

" Spell checking
nnoremap <leader>ss ea<C-X><C-S>
nnoremap <leader>sx :setlocal spell!<cr>
nnoremap <leader>sa zg
nnoremap <leader>sd zug
nnoremap <leader>s? z=
nnoremap <leader>sd :Sdcv <C-R><C-W><cr>
nnoremap <leader>st :Sdcv --data-dir ~/.stardict/thesaurus -u "Moby Thesaurus II" <C-R><C-W><cr>
nnoremap <leader>sw :Sdcv<space>

" Splits
nnoremap <leader>sh :leftabove  vnew<cr>
nnoremap <leader>sl :rightbelow vnew<cr>
nnoremap <leader>sk :leftabove  new<cr>
nnoremap <leader>sj :rightbelow new<cr>

" Titlecase selection
vmap <leader>ti :s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g<cr>
" Show/hide concealable things
nnoremap <leader>tc :call ConcealToggle()<cr>
" Table Mode
nnoremap <leader>tm :TableModeToggle<cr>
nnoremap <leader>tg :call TableGrid()<cr>
nnoremap <leader>tp :call TablePipe()<cr>
" Undo tree
nnoremap <leader>tu :GundoToggle<cr>
" Wrap on off
nnoremap <leader>tw :set wrap!<cr>
" Wrap on off
nnoremap <leader>ts :SyntasticToggleMode<cr>
" Refresh filetype
nmap <leader>td :filetype detect<cr>

" urxvtcd
nnoremap <leader>us :sh<cr>
nnoremap <leader>uu :cd %:p:h<cr>:pwd<cr>:silent !urxvtcd<cr>
nnoremap <leader>ur :cd %:p:h<cr>:pwd<cr>:silent !urxvtcd -e rs<cr>
nnoremap <leader>uR :cd %:p:h<cr>:pwd<cr>:silent !urxvtcd -e ranger<cr>
nnoremap <leader>uw :cd %:p:h<cr>:pwd<cr>:silent !urxvtcd -e watch_doc %:e<cr>
nnoremap <leader>ut :cd %:p:h<cr>:pwd<cr>:silent !urxvtcd -e tig<cr>

" Search for pandoc @citations and images
" map <leader>1 /!\[./e<cr>
" map <leader>2 /@\(Tbl:\)\@!\(Fig:\)\@!./e<cr>
" map <leader>3 /@fig:./e<cr>
" map <leader>4 /@Tbl:./e<cr>
" map <leader># /#fig:<C-R><C-W><cr>
" map <leader>$ /#tbl:<C-R><C-W><cr>
" map <leader>9 /\](./e<cr>
"
"Open files inc cropgui with a string operator
nnoremap <leader>x :set operatorfunc=CropOperator<cr>g@

" Goyo
nnoremap <silent> <leader>z :Goyo<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Unite

nmap , [unite]
nnoremap [unite] <nop>

nnoremap <silent>[unite]<space> :UniteResume<cr>
nnoremap <silent>[unite]u   :<C-u>Unite                                                    source<cr>
" nnoremap <silent>[unite]d   :<C-u>Unite -buffer-name=file_rec  -input=~/Documents          file_rec/async:!<cr>
nnoremap <silent>[unite]f   :<C-u>Unite -buffer-name=files                                 file<cr>
nnoremap <silent>[unite]F   :<C-u>Unite -buffer-name=file_rec                              file_rec/async:!<cr>
nnoremap <silent>[unite]b   :<C-u>Unite -buffer-name=buffer                                buffer<cr>
nnoremap <silent>[unite]h   :<C-u>Unite -buffer-name=help                                  help<cr>
nnoremap <silent>[unite]r   :<C-u>Unite -buffer-name=fasd                                  fasd<cr>
nnoremap <silent>[unite]g   :<C-u>Unite -buffer-name=giti                                  giti<cr>
nnoremap <silent>[unite]s   :<C-u>Unite -buffer-name=grep                                  grep<cr>
nnoremap <silent>[unite]/   :<C-u>Unite -buffer-name=locate                                locate<cr>
nnoremap <silent>[unite]l   :<C-u>Unite -buffer-name=line                                  line<cr>
nnoremap <silent>[unite]k   :<C-u>Unite -buffer-name=mapping                               mapping<cr>
nnoremap <silent>[unite]:   :<C-u>Unite -buffer-name=command                               command<cr>
nnoremap <silent>[unite];   :<C-u>Unite -buffer-name=command                               command<cr>
nnoremap <silent>[unite]i   :<C-u>Unite -buffer-name=history                               history/unite<cr>
nnoremap <silent>[unite]o   :<C-u>Unite -buffer-name=outline                               outline<cr>
nnoremap <silent>[unite]j   :<C-u>Unite -buffer-name=jump      -no-start-insert            jump<cr>
nnoremap <silent>[unite]p   :<C-u>Unite -buffer-name=yank      -default-action=append      history/yank<cr>
nnoremap <silent>[unite]P   :<C-u>Unite -buffer-name=yank      -default-action=insert      history/yank<cr>
nnoremap <silent>[unite]d   :<C-u>Unite -buffer-name=digraphs  -default-action=insert      digraphs<cr>
nnoremap <silent>[unite]t   :<C-u>Unite -buffer-name=colorscheme    -auto-preview               colorscheme<cr>
nnoremap <silent>[unite]a   :<C-u>Unite -buffer-name=airline   -auto-preview               airline_themes<cr>
nnoremap <silent><leader>cc :<C-u>Unite -buffer-name=citation/key   -default-action=insert citation/key<cr>
nnoremap <silent><leader>cC :<C-u>Unite -buffer-name=citation/key_inner   -default-action=insert citation/key_inner<cr>
nnoremap <silent><leader>CC :<C-u>Unite -buffer-name=citation/key_inner   -default-action=insert citation/key_inner<cr>
nnoremap <silent><leader>cT :<C-u>Unite -buffer-name=citation/title   -default-action=insert citation/title<cr>
nnoremap <silent><leader>cF :<C-u>Unite -buffer-name=citation/file  -default-action=insert citation/file<cr>
nnoremap <silent><leader>cO :<C-u>Unite -buffer-name=citation/file  -default-action=start  citation/file<cr>
nnoremap <silent><leader>cU :<C-u>Unite -buffer-name=citation/url   -default-action=start  citation/url<cr>
nnoremap <silent><leader>cI :<C-u>Unite -buffer-name=citation/combined  -default-action=preview  citation/combined<cr>
nnoremap <silent><leader>cz :<C-u>Unite -buffer-name=citation_collection citation_collection<cr>

" Use unite matching to open citation files and urls
nnoremap <silent><leader>cw :<C-u>UniteWithCursorWord -default-action=yank citation/key<cr>
nnoremap <silent><leader>co :<C-u>UniteWithCursorWord -default-action=start -force-immediately citation/file<cr>
nnoremap <silent><leader>cf :<C-u>UniteWithCursorWord -default-action=files -force-immediately citation/file<cr>
nnoremap <silent><leader>cu :<C-u>UniteWithCursorWord -default-action=start -force-immediately citation/url<cr>
nnoremap <silent><leader>ci :<C-u>UniteWithCursorWord -default-action=preview -force-immediately citation/combined<cr>
nnoremap <silent><leader>ct :<C-u>UniteWithCursorWord -default-action=yank -force-immediately citation/title<cr>
" nnoremap <silent><leader>cn :<C-u>UniteWithCursorWord -force-immediately -default-action=yank citation/key_raw<cr>:!urxvtcd -e zotcli add-note <C-R>0<cr>
nnoremap <silent><leader>cn :CitationNote<cr>

" Use zotero fulltext search to filter before unite
nnoremap <silent><leader>cs :<C-u>Unite -buffer-name=citation/key -default-action=yank citation/key:<C-R><C-W><cr>
vnoremap <silent><leader>cs :<C-u>exec "Unite -buffer-name=citation/key -default-action=yank citation/key:" . escape(@*,' ') <cr>
nnoremap <silent><leader>cx :<C-u>exec "Unite -buffer-name=citation/key -default-action=yank citation/key:" . escape(input('Search Key : '),' ') <cr>
nnoremap <silent><leader>cS :<C-u>Unite -buffer-name=citation/key_inner -default-action=yank citation/key_inner:<C-R><C-W><cr>
vnoremap <silent><leader>cS :<C-u>exec "Unite -buffer-name=citation/key_inner -default-action=yank citation/key_inner:" . escape(@*,' ') <cr>
nnoremap <silent><leader>cX :<C-u>exec "Unite -buffer-name=citation/key_inner -default-action=yank citation/key_inner:" . escape(input('Search Key : '),' ') <cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Tabs get to steal t

" Tab keys
nnoremap tt  :call TabToggle()<cr>
nnoremap ts  :tabs<cr>
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
nnoremap TJ  :tabmove -1<cr>
nnoremap tK  :tabmove +1<cr>
nnoremap TK  :tabmove +1<cr>
nnoremap tL  :tabmove $<cr>
nnoremap TL  :tabmove $<cr>
nnoremap tH  :tabmove 0<cr>
nnoremap TH  :tabmove 0<cr>
" Open tags in a new tab.
nnoremap <silent>t] <C-w><C-]><C-w>T

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Other
"

" Kill Ex mode.
nnoremap Q <nop>
" Next/Previous error/buffer etc
nnoremap ]] :cnext<cr>
nnoremap [[ :cprevious<cr>
" Treat long lines as break lines but don't break dj or <count>j behavior
nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'

" Save file as sudo
command W w !sudo tee % > /dev/null
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<cr>
vnoremap <silent> # :call VisualSelection('b', '')<cr>

" Format paragraph
" nnoremap <localleader>f gwip

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Neovim specific
" tnoremap  <C-\><C-n>

" tnoremap <A-h> <C-\><C-N><C-w>h
" tnoremap <A-j> <C-\><C-N><C-w>j
" tnoremap <A-k> <C-\><C-N><C-w>k
" tnoremap <A-l> <C-\><C-N><C-w>l
" inoremap <A-h> <C-\><C-N><C-w>h
" inoremap <A-j> <C-\><C-N><C-w>j
" inoremap <A-k> <C-\><C-N><C-w>k
" inoremap <A-l> <C-\><C-N><C-w>l
" nnoremap <A-h> <C-w>h
" nnoremap <A-j> <C-w>j
" nnoremap <A-k> <C-w>k
" nnoremap <A-l> <C-w>l

" tnoremap <A-H> <C-\><C-N><C-w>H
" tnoremap <A-J> <C-\><C-N><C-w>J
" tnoremap <A-K> <C-\><C-N><C-w>K
" tnoremap <A-L> <C-\><C-N><C-w>L
" inoremap <A-H> <C-\><C-N><C-w>H
" inoremap <A-J> <C-\><C-N><C-w>J
" inoremap <A-K> <C-\><C-N><C-w>K
" inoremap <A-L> <C-\><C-N><C-w>L
" nnoremap <A-H> <C-w>H
" nnoremap <A-J> <C-w>J
" nnoremap <A-K> <C-w>K
" nnoremap <A-L> <C-w>L

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Additional subscript digraphs
execute "digraphs ks " . 0x2096
execute "digraphs as " . 0x2090
execute "digraphs es " . 0x2091
execute "digraphs hs " . 0x2095
execute "digraphs is " . 0x1D62
execute "digraphs js " . 0x2C7C
execute "digraphs ks " . 0x2096
execute "digraphs ls " . 0x2097
execute "digraphs ms " . 0x2098
execute "digraphs ns " . 0x2099
execute "digraphs os " . 0x2092
execute "digraphs ps " . 0x209A
execute "digraphs rs " . 0x1D63
execute "digraphs ss " . 0x209B
execute "digraphs ts " . 0x209C
execute "digraphs us " . 0x1D64
execute "digraphs vs " . 0x1D65
execute "digraphs xs " . 0x2093
