"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" {{{ Vim-Plug

call plug#begin()

"---------------------------------
" Syntax
Plug 'scrooloose/syntastic'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'chase/vim-ansible-yaml', { 'for': 'yaml' }
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'vim-scripts/nginx.vim', { 'for': 'nginx' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'lervag/vimtex', { 'for': 'latex' }
Plug 'vim-pandoc/vim-pandoc', { 'for': 'markdown' }
" Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }
" Plug 'vim-pandoc/vim-pandoc-after', { 'for': 'markdown' }
" Plug 'joonty/vdebug'

  " Ruby
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-bundler', { 'for': 'ruby' }
  Plug 'tpope/vim-rake', { 'for': 'ruby' }
  Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }

  "Haskell 
  Plug 'dag/vim2hs', { 'for': 'haskell' }
  Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
  Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
  Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }

"---------------------------------
" Edit
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neomru.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'dahu/vim-fanfingtastic'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'michaeljsmith/vim-indent-object'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/YankRing.vim'
Plug 'godlygeek/tabular', { 'on': 'Tab' }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }


"---------------------------------
" Nav
" Plug 'corntrace/bufexplorer'
Plug 'Shougo/unite.vim'
Plug 'termoshtt/unite-bibtex'
Plug 'kien/ctrlp.vim'
Plug 'amix/open_file_under_cursor.vim'
Plug 'vim-scripts/taglist.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-scripts/mru.vim', { 'on': 'MRU' }
Plug 'fmoralesc/vim-pad', { 'on': 'Pad' }

"---------------------------------
" Snippet
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"---------------------------------
" Git
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite', { 'on': 'Extradite' }
Plug 'airblade/vim-gitgutter'
Plug 'airblade/vim-rooter'
Plug 'vim-scripts/gitignore'

"---------------------------------
" Style
Plug 'altercation/vim-colors-solarized'
Plug 'bling/vim-airline'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }

"---------------------------------
" Misc
Plug 'vim-scripts/tlib'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'xolox/vim-misc'
Plug 'tmhedberg/matchit'

" Add plugins to &runtimepath
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" {{{ bufExplorer plugin

let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" {{{ Unite 

let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Unite Bibtex
let g:unite_bibtex_bib_files=["~/Projects/Uni/Natural-Environments/Assesment/out.bib"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ MRU plugin

let MRU_Max_Entries = 400

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Vim Pandoc

let g:pandoc#after#modules#enabled = ["tablemode", "neosnippets"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Vim Table Mode

let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ YankRing

if has("win16") || has("win32")
    " Don't do anything
else
    let g:yankring_history_dir = '~/.vim/temp_dirs/'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Extradite

let g:extradite_width = 60

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ CTRL-P


let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_max_files=1000
let g:ctrlp_show_hidden=1
" let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee|^\.cabal-sandbox' }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Vim grep

let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Vim-airline

let g:airline_theme="solarized"
let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Goyo

let g:goyo_width = 80
let g:goyo_height = '100%'
" let g:goyo_linenr
" autocmd User GoyoEnter execute "! xdotool key 'super+bracketright'"
" autocmd User GoyoLeave execute "! xdotool key 'super+bracketleft'"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Limelight

let g:limelight_conceal_ctermfg = 240

" Default: 0.5
let g:limelight_default_coefficient = 0.5

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ snipMate (beside <TAB> support <CTRL-j>)

" ino <c-j> <c-r>=snipMate#TriggerSnippet()<cr>
" snor <c-j> <esc>i<right><c-r>=snipMate#TriggerSnippet()<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Syntastic (syntax checker)

let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_lua_checkers=['luac']
let g:syntastic_lua_checkers=['ghc-mod']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Neocomplete

let g:neocomplete#enable_at_startup = 1

" Disable AutoComplPop.
let g:acp_enableAtStartup = 1
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby =  '[^. *\t]\.\w*\|\h\w*::'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ NeoSnippet

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim_runtime/plugins/snippet/vim-snippets/snippets'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Vimtex

let g:vimtex_view_method = 'mupdf'
let g:vimtex_view_mupdf_options = '-r 68 -C CFCAC0'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Pad

let g:pad#dir                         = "~/Documents/Notes"
let g:pad#default_file_extension      = ".md"
let g:pad#set_mappings                = 0
let g:pad#open_in_split               = 1
let g:pad#rename_files                = 1
let g:pad#title_first_line            = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}


