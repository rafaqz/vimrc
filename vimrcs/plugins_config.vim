"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Plug

call plug#begin()

"---------------------------------
" {{{ Bling

Plug 'junegunn/goyo.vim'
Plug 'bling/vim-airline'
Plug 'altercation/vim-colors-solarized'
Plug 'reedes/vim-colors-pencil'

"---------------------------------}}}
" {{{ Edit

Plug 'Shougo/neocomplete.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'dahu/vim-fanfingtastic'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'michaeljsmith/vim-indent-object'
Plug 'sjl/gundo.vim'
Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/Align'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/YankRing.vim'

"---------------------------------}}}
" {{{ Git

" Plug 'airblade/vim-rooter' { 'for': 'ruby' }
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
Plug 'vim-scripts/gitignore'

"---------------------------------}}}
" {{{ Nav

" Plug 'amix/open_file_under_cursor.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'reedes/vim-wheel'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf'
Plug 'rafaqz/ranger.vim'
Plug 'vim-scripts/SearchComplete'

"---------------------------------}}}
" {{{ Misc
"
" Plug 'vim-scripts/tlib'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'xolox/vim-misc'
" Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'
Plug 'tpope/vim-dispatch'
" Plug 'kana/vim-operator-user'

"---------------------------------}}}
" {{{ Snippet
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

"---------------------------------}}}
" {{{ Syntax
Plug 'scrooloose/syntastic'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
Plug 'davidhalter/jedi-vim', {'for': 'python' }
Plug 'lambdatoast/elm.vim'
" Plug 'sheerun/vim-polyglot'
" Plug 'joonty/vdebug'

"-------------------------
" {{{ Ruby
  Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'tpope/vim-bundler', { 'for': 'ruby' }
  Plug 'tpope/vim-rake', { 'for': 'ruby' }
  Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }

"-------------------------}}}
" {{{ Haskell
  Plug 'dag/vim2hs', { 'for': 'haskell' }
  Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
  Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
  Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
"-------------------------}}}


"-------------------------}}}
" {{{ R
  Plug 'vim-scripts/Vim-R-plugin'
  ", { 'for': ['r', 'markdown'] }
"-------------------------}}}


"---------------------------------}}}
" {{{ Unite
Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'osyo-manga/unite-quickfix'
Plug 'Shougo/neomru.vim'
Plug 'tsukkee/unite-help'
Plug 'kmnk/vim-unite-giti'
Plug 'ujihisa/unite-colorscheme'
Plug 'osyo-manga/unite-airline_themes'
Plug 'ujihisa/unite-colorscheme'
Plug 'rafaqz/citation.vim'
Plug 'tsukkee/unite-tag'
Plug 'critiqjo/unite-fasd.vim'
Plug 'Shougo/neoinclude.vim'

" And make it fast
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

"---------------------------------}}}
" {{{ Writing
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }
Plug 'vim-pandoc/vim-pandoc-after', { 'for': 'markdown' }
Plug 'reedes/vim-textobj-sentence', { 'for': 'markdown' }
" Plug 'reedes/vim-textobj-quote', { 'for': 'markdown' }
Plug 'reedes/vim-wordy', { 'for': 'markdown' }
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown', 'on': 'TableModeToggle'}
Plug 'phongvcao/vim-stardict'

"---------------------------------}}}

" Add plugins to &runtimepath
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" {{{ Airline
let g:airline_theme='pencil'
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Extradite

let g:extradite_width = 60
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Goyo

let g:goyo_width = 100

" Quit Vim if this is the only remaining buffer
function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q!  let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd User GoyoEnter call <SID>goyo_enter()
autocmd User GoyoLeave call <SID>goyo_leave()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Neocomplete

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

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim_runtime/plugins/snippet/vim-snippets/snippets'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Pandoc

let g:pandoc#after#modules#enabled = ["tablemode", "neosnippets"]
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#keyboard#sections#header_style = 's'
let g:pandoc#formatting#mode = 'h'
let g:pandoc#syntax#conceal#use = 1
let g:pandoc#syntax#conceal#blacklist = ["atx"]
let g:pandoc#modules#disabled = ["metadata", "bibliographies", "completion", "menu", "toc"]

"Other modules: ["formatting", "folding", "executors", "keyboard", "hypertext"]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ StarDict
let g:stardict_split_horizontal = 1
let g:stardict_split_size = 180
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Syntastic (syntax checker)

let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_lua_checkers=['luac']
let g:syntastic_lua_checkers=['ghc-mod']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Table Mode

let g:table_mode_corner_corner="+"
let g:table_mode_header_fillchar="="
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Unite

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])

" let g:unite_source_file_async_command = "locate expand('%:p:h')"
let g:unite_source_history_yank_enable = 1
let g:unite_data_directory = '~/.vim/temp_dirs/unite'
let g:unite_candidate_icon = "➜"
let g:unite_source_yank_history_save_clipboard = 1

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  nmap <silent> <buffer> <Esc><Esc> <Plug>(unite_exit)
  imap <silent> <buffer> <Esc><Esc> <Plug>(unite_exit)
endfunction

call unite#custom#profile('default', 'context', {
	\   'ignorecase': 1,
	\   'start_insert': 1,
	\ })

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Citation.vim 
let g:citation_vim_cache_path='~/.vim/temp_dirs'
let g:citation_vim_note_extension='md'
let g:citation_vim_note_dir='~/Documents/Reviews/'
let g:citation_vim_file_path='~/.pandoc/bibtex/citations.bib'
let g:citation_vim_file_format='bibtex'
let g:citation_vim_file_path='~/.zotero/zotero/jgdbnvi8.default/zotero'
let g:citation_vim_file_format='zotero'
let g:citation_vim_outer_prefix="["
let g:citation_vim_inner_prefix="@"
let g:citation_vim_description_format="{}→ ′{}′ ₊{}₊ │{}{}│"
let g:citation_vim_description_fields=["key", "title", "author", "publisher", "journal"]

let g:citation_vim_description_format = "{}∶ {} \˝{}\˝ ₋{}₋ ₍{}₎"
let g:citation_vim_description_fields = ["type", "key", "title", "author", "date"]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Unite Fasd
let g:unite_fasd#fasd_path='/usr/bin/fasd'
let g:unite_fasd#fasd_cache = '~/.fasd'
let g:unite_fasd#read_only = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" {{{ YankRing
let g:yankring_history_dir = '~/.vim/'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
