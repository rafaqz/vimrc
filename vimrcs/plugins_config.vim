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
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'DrSpatula/vim-buddy'
" Plug 'flazz/vim-colorschemes'

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
Plug 'godlygeek/tabular'
Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/YankRing.vim'

"---------------------------------}}}
" {{{ Git

Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' } 
Plug 'vim-scripts/gitignore'

"---------------------------------}}}
" {{{ Nav

Plug 'amix/open_file_under_cursor.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'fmoralesc/vim-pad', { 'on': 'Pad' }
Plug 'reedes/vim-wheel'
" Plug 'vim-scripts/taglist.vim'

"---------------------------------}}}
" {{{ Misc
"
" Plug 'vim-scripts/tlib'
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'xolox/vim-misc'
" Plug 'tmhedberg/matchit'
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
Plug 'sheerun/vim-polyglot'
Plug 'chrisbra/csv.vim', { 'for': 'csv' }
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
Plug 'rafaqz/unite-bibtex'
Plug 'tsukkee/unite-tag'
Plug 'zoncoen/unite-autojump'

" And make it fast
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

"---------------------------------}}}
" {{{ Writing
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': 'markdown' }
Plug 'kana/vim-textobj-user', { 'for': 'markdown' }
Plug 'reedes/vim-textobj-sentence', { 'for': 'markdown' }
Plug 'reedes/vim-textobj-quote', { 'for': 'markdown' }
Plug 'reedes/vim-wordy', { 'for': 'markdown' }
Plug 'dhruvasagar/vim-table-mode', { 'for': 'markdown', 'on': 'TableModeToggle' }
" Plug 'reedes/vim-lexical'
" Plug 'reedes/vim-litecorrect', { 'for': 'markdown' }
" Plug 'reedes/vim-pencil'
" Plug 'vim-pandoc/vim-pandoc-after', { 'for': 'markdown' }

"---------------------------------}}}

" Add plugins to &runtimepath
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

" {{{ Airline
let g:airline_theme='solarized'

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
" {{{ Lexical

" augroup lexical
"   autocmd!
"   autocmd FileType markdown,mkd call lexical#init()
"   autocmd FileType textile call lexical#init()
"   autocmd FileType text call lexical#init({ 'spell': 0 })
" augroup END
" let g:lexical#thesaurus = ['/home/raf/.vim/thesaurus/mthesaur.txt',]
" let g:lexical#dictionary = ['/usr/share/dict/words',]
" let g:lexical#thesaurus_key = '<leader>t'
" let g:lexical#dictionary_key = '<leader>k'

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

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim_runtime/plugins/snippet/vim-snippets/snippets'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Pad
let g:pad#dir                         = "~/Documents/Notes"
let g:pad#default_file_extension      = ".md"
let g:pad#set_mappings                = 0
let g:pad#open_in_split               = 1
let g:pad#rename_files                = 1
let g:pad#title_first_line            = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Pandoc

" let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
" let g:pandoc#filetypes#pandoc_markdown = 0
" let g:pandoc#after#modules#enabled = ["tablemode", "neosnippets"]
"
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#formatting#mode = 'h'
let g:pandoc#syntax#conceal#use = 0
let g:pandoc#modules#disabled = ["bibliographies", "completion", "menu", "toc"]
"Other modules: ["formatting", "folding", "metadata", "executors", "keyboard", "spell", "hypertext"]
" let g:pandoc#biblio#bibs=['/home/raf/Projects/Uni/Citations/Citations.bib']
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

call unite#filters#matcher_default#use(['matcher_fuzzy'])
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Unite Bibtex
let g:unite_bibtex_bib_files=['/home/raf/Projects/Uni/Citations/Citations.bib']
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ YankRing
let g:yankring_history_dir = '~/.vim/temp_dirs/'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
