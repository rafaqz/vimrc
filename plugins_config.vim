"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Plug

call plug#begin()

"---------------------------------
" {{{ Bling

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'reedes/vim-colors-pencil'
Plug 'ryanoasis/vim-devicons'

"---------------------------------}}}
" {{{ Edit


Plug 'wikitopian/hardmode'
Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'roxma/nvim-completion-manager'
" Plug 'jiangmiao/auto-pairs'


Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'dahu/vim-fanfingtastic'
Plug 'haya14busa/vim-easyoperator-line'
Plug 'michaeljsmith/vim-indent-object'
" Plug 'vim-scripts/Align'
Plug 'tommcdo/vim-lion'
" Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/YankRing.vim'
Plug 'sjl/gundo.vim'
Plug 'vim-scripts/vis'
Plug 'vim-scripts/VisIncr'
" Plug 'Raimondi/delimitMate'
" Plug 'junegunn/vim-easy-align'
" Plug 'Shougo/echodoc.vim'


"---------------------------------}}}
" {{{ Git

Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'int3/vim-extradite'
Plug 'airblade/vim-gitgutter', { 'on': 'GitGutterToggle' }
Plug 'junegunn/gv.vim'
Plug 'gregsexton/gitv'
Plug 'vim-scripts/gitignore'

"---------------------------------}}}
" {{{ Nav

" Plug 'amix/open_file_under_cursor.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'reedes/vim-wheel'
" " Plug 'majutsushi/tagbar'
" " Plug 'junegunn/fzf'
Plug 'rafaqz/ranger.vim'
" Plug 'vim-scripts/SearchComplete'
Plug 'AndrewRadev/linediff.vim'
"
"---------------------------------}}}
" {{{ Misc

" Plug 'vim-scripts/tlib
" Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'xolox/vim-misc'
" Plug 'tmhedberg/matchit'
Plug 'kana/vim-textobj-user'
" Plug 'tpope/vim-dispatch'
" Plug 'benekastah/neomake'
" Plug 'kana/vim-operator-user'
Plug 'jalvesaq/vimcmdline'
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

"---------------------------------}}}
" {{{ Snippet
" Plug 'honza/vim-snippets'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'

"---------------------------------}}}
" {{{ Syntax
" Plug 'scrooloose/syntastic'

Plug 'chrisbra/csv.vim'," { 'for': 'csv' }
" Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'ElmCast/elm-vim', { 'for': 'elm' }
Plug 'jalvesaq/Nvim-R'
Plug 'baskerville/vim-sxhkdrc'

Plug 'lambdatoast/elm.vim', {'for': 'elm' }
" Plug 'sheerun/vim-polyglot'
" Plug 'joonty/vdebug'

"-------------------------
" {{{ julia
"
" Plug 'zyedidia/julialint.vim'
" Plug 'AtsushiSakai/julia.vim'
Plug 'JuliaEditorSupport/julia-vim'
" Plug 'JuliaEditorSupport/deoplete-julia'

"-------------------------}}}
" {{{ Ruby
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" Plug 'tpope/vim-rails', { 'for': 'ruby' }
" Plug 'tpope/vim-bundler', { 'for': 'ruby' }
" Plug 'tpope/vim-rake', { 'for': 'ruby' }
" Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }

"-------------------------}}}
" {{{ Haskell
Plug 'dag/vim2hs', { 'for': 'haskell' }
Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
" Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'Twinside/vim-syntax-haskell-cabal', { 'for': 'cabal' }

"-------------------------}}}
" {{{ Markdown
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax', { 'for': ['markdown','rmd'] }
" Plug 'vim-pandoc/vim-pandoc-after' ", { 'for': ['markdown','rmd'] }
Plug 'vim-pandoc/vim-rmarkdown', { 'for': ['markdown','rmd'] }
" Plug 'phongvcao/vim-stardict', { 'for': ['markdown','rmd'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
" Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' }

" Plug 'reedes/vim-textobj-sentence'
" Plug 'reedes/vim-textobj-quote', { 'for': 'markdown' }
" Plug 'reedes/vim-wordy', { 'for': 'markdown' }

"-------------------------}}}

"---------------------------------}}}
" {{{ Unite
" Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
" Plug 'osyo-manga/unite-quickfix'
Plug 'tsukkee/unite-help'
" Plug 'kmnk/vim-unite-giti'
Plug 'ujihisa/unite-colorscheme'
Plug 'osyo-manga/unite-airline_themes'
Plug 'rafaqz/citation.vim'
" Plug 'tsukkee/unite-tag'
Plug 'critiqjo/unite-fasd.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'naquad/unite-digraphs'
Plug 'ujihisa/unite-locate'

" And make it fast
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

"---------------------------------}}}

" Add plugins to &runtimepath
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

runtime macros/matchit.vim

" {{{ Airline

let g:airline#extensions#disable_rtp_load = 1
let g:airline_theme='zenburn'

" Tabline
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_min_count = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#fnamemod = ':t'

" Powerline Fonts
let g:airline_powerline_fonts = 1
let g:airline_right_alt_sep = "\ue0b9"
let g:airline_right_sep     = "\ue0ba"
let g:airline_left_alt_sep  = "\ue0bb"
let g:airline_left_sep      = "\ue0bc"
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = "\uE612"
let g:airline_symbols.maxlinenr = ""
let g:airline_symbols.crypt = "?"
let g:airline_symbols.whitespace = "\uF096"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Citation.vim
"
let g:citation_vim_cache_path='~/.cache'
let g:citation_vim_bibtex_file='~/Uni/Citations/Library.bib'
let g:citation_vim_collection=""
let g:citation_vim_zotero_path='~/Zotero'
let g:citation_vim_zotero_version=5
" let g:citation_vim_mode='bibtex'
let g:citation_vim_key_format="{zotero_key}#{author}{date}{title}#"
call unite#util#set_default('g:citation_vim_description_format',  "{}∶ {} ‴{}‴ ₋{}₋ ₍{}₎ ┊{}┊") 
call unite#util#set_default('g:citation_vim_description_fields', ["type", "key", "title", "author", "date", "publication"])

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ cmdline

" vimcmdline mappings
let cmdline_map_start          = "<LocalLeader>s"
let cmdline_map_send           = "<LocalLeader>d"
let cmdline_map_send_and_stay  = "<LocalLeader>l"
let cmdline_map_source_fun     = "<LocalLeader>f"
let cmdline_map_send_paragraph = "<LocalLeader>p"
let cmdline_map_send_block     = "<LocalLeader>b"
let cmdline_map_quit           = "<LocalLeader>q"
let cmdline_app                = {}
let cmdline_app['julia']       = 'julia -O3'

" vimcmdline options
let cmdline_vsplit             = 1      " Split the window vertically
let cmdline_esc_term           = 1      " Remap <Esc> to :stopinsert in Neovim terminal
let cmdline_in_buffer          = 1      " Start the interpreter in a Neovim buffer
let cmdline_term_height        = 15     " Initial height of interpreter window or pane
let cmdline_term_width         = 80     " Initial width of interpreter window or pane
" let cmdline_tmp_dir            = '/' " Temporary directory to save files
let cmdline_outhl              = 1      " Syntax highlight the output
let cmdline_external_term_cmd  = "urxvtcd -e %s"

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
" {{{ julia-vim
let g:latex_to_unicode_suggestions = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ julia language server
" let g:LanguageClient_autoStart = 1

" let g:default_julia_version = '0.6'
" let g:LanguageClient_serverCommands = {
"  \   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
"  \       using LanguageServer;
"  \       server = LanguageServer.LanguageServerInstance(STDIN, STDOUT, false);
"  \       server.rootPath = "~/Uni/Masters/code/plant_model_julia";
"  \       server.runlinter = true;
"  \       run(server);
"  \   '],
"  \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Limelight

" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
let g:limelight_default_coefficient = 0.4

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Neocomplete/Deoplete
" let g:deoplete#enable_at_startup = 1

"Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
" Use neocomplete.
" let g:neocomplete#enable_at_startup = 1
" Use smartcase.
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#enable_camel_case = 1
" let g:neocomplete#enable_fuzzy_completion = 1
" let g:neocomplete#manual_completion_start_length = 0
" let g:neocomplete#auto_completion_start_length = 3
" let g:neocomplete#sources#syntax#min_keyword_length = 3
" let g:neocomplete#enable_auto_delimiter = 1
" let g:neocomplete#enable_auto_close_preview = 1
" let g:neocomplete#skip_auto_completion_time = ''
" let g:neocomplete#max_list = 150
" let g:neocomplete#fallback_mappings = [ "\<C-x>\<C-o>", "\<C-x>\<C-n>" ]

" Define dictionary.
" let g:neocomplete#sources#dictionary#dictionaries = {
"       \ 'default' : '',
"       \ }

" Define keyword.
" if !exists('g:neocomplete#keyword_patterns')
"   let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns['default'] = '\h\w*'


" " Do not autocomplete/cache in sensitive file patterns
" let g:neocomplete#sources#buffer#disabled_pattern =
"       \ '\/private\/var\/\|\/shm\/\|\/tmp\/\|\.vault\.vim'

" let g:neocomplete#lock_buffer_name_pattern =
"       \ g:neocomplete#sources#buffer#disabled_pattern

" " Keyword patterns completion
" " ---

" " Define a default keyword pattern
" if ! exists('g:neocomplete#keyword_patterns')
"   let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns._ = '\h\k*(\?'

" " Enable omni-completion
" " ---

" if ! exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif

" let g:neocomplete#sources#omni#input_patterns.coffee =
"       \ '[[:alpha:]./"''$]\+'
" let g:neocomplete#sources#omni#input_patterns.go =
"       \ '[^.[:digit:] *\t]\.\w*'
" "let g:neocomplete#sources#omni#input_patterns.c =
" "	\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?'
" "let g:neocomplete#sources#omni#input_patterns.cpp =
" "	\ '[^.[:digit:] *\t]\%(\.\|->\)\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" let g:neocomplete#sources#omni#input_patterns.ruby =
"       \ '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.python =
"       \ '[^. *\t]\.\w*\|\h\w*'
" let g:neocomplete#sources#omni#input_patterns.r = '\$'

" " Force omni-completion input patterns
" " ---

" if ! exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif

" let g:neocomplete#force_omni_input_patterns.javascript =
"       \ '[^. \t]\.\w*'
" let g:neocomplete#force_omni_input_patterns.typescript =
"       \ '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplete#force_omni_input_patterns.php =
"       \ '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
" "let g:neocomplete#force_omni_input_patterns.python =
" "	\ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
" " Alternative pattern: \ '\h\w*\|[^. \t]\.\w*'
" let g:neocomplete#force_omni_input_patterns.r = '\$'


" call neocomplete#custom#source('_', 'converters',
"       \ ['converter_add_paren', 'converter_remove_overlap',
"       \  'converter_delimiter', 'converter_abbr'])

" Mappings
" --------

" let g:neocomplete#fallback_mappings = [ "\<C-x>\<C-o>", "\<C-x>\<C-n>" ]

" Movement within 'ins-completion-menu'
" imap <expr><C-j>   pumvisible() ? "\<C-n>" : "\<C-j>"
" imap <expr><C-k>   pumvisible() ? "\<C-p>" : "\<C-k>"
" imap <expr><C-f>   pumvisible() ? "\<PageDown>" : "\<Right>"
" imap <expr><C-b>   pumvisible() ? "\<PageUp>" : "\<Left>"
" imap <expr><C-d>   pumvisible() ? "\<PageDown>" : "\<Right>"
" imap <expr><C-u>   pumvisible() ? "\<PageUp>" : "\<Left>"

" <C-n>: neocomplete.
" imap <expr> <C-n>  pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>\<Down>"
" <C-p>: keyword completion.
" imap <expr> <C-p>  pumvisible() ? "\<C-p>" : "\<C-p>\<C-n>"

" Special plugin key-mappings
"inoremap <expr><C-l>  neocomplete#mappings#complete_common_string()
" inoremap <expr><C-l> neocomplete#mappings#refresh()
" inoremap <expr><C-g> neocomplete#undo_completion()

" Start file completion TODO Not working all the time
" imap <silent><expr> <C-x><C-f> neocomplete#start_manual_complete('file')

" <CR>: If popup menu visible, expand snippet or close popup with selection,
"       Otherwise, check if within empty pair and use delimitMate.
" imap <silent><expr><CR> pumvisible() ?
" 	\ (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<C-y>")
" 		\ : "\<CR>")

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
" imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
"       \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
"       \ : (<SID>is_whitespace() ? "\<Tab>"
"       \ : neocomplete#start_manual_complete()))

" smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
"       \ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
"       \ : (<SID>is_whitespace() ? "\<Tab>"
"       \ : neocomplete#start_manual_complete()))

" inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:is_whitespace() "{{{
"   let col = col('.') - 1
"   return ! col || getline('.')[col - 1] =~? '\s'
" endfunction "}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ NeoSnippet

" For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
" endif
" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory='~/.vim_runtime/plugins/snippet/vim-snippets/snippets'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Nvim-R

let R_assign = 0
let R_in_buffer = 0
let R_tmpdir = "/tmp/Nvim-R"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Pandoc

let g:pandoc#after#modules#enabled = ["tablemode"]
let g:pandoc#folding#fold_yaml = 1
let g:pandoc#keyboard#sections#header_style = 's'
let g:pandoc#formatting#mode = 'h'
let g:pandoc#syntax#conceal#use = 0
" let g:pandoc#syntax#conceal#blacklist = ["atx"]
let g:pandoc#modules#disabled = ["folding", "metadata", "bibliographies", "completion", "menu", "toc"]
" Other modules: ['formatting', 'folding', 'executors', 'keyboard', 'hypertext']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Ranger.vim
"
" let g:ranger_terminal = "urxvtcd -e"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Rooter

let g:rooter_silent_chdir = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ StarDict

let g:stardict_split_horizontal = 1
let g:stardict_split_size = 180

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Syntastic (syntax checker)

let g:syntastic_python_checkers=['pyflakes']
let g:syntastic_lua_checkers=['luac']
let g:syntastic_lua_checkers=['ghc-mod']

let g:syntastic_enable_r_lintr_checker = 1
let g:syntastic_r_checkers = ['lintr']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Table Mode
let g:table_mode_auto_align = 0
let g:table_mode_update_time = 1

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
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  " Enable navigation with control-j and control-k in insert mode
  imap     <silent><buffer> <C-j>   <Plug>(unite_select_next_line)
  nnoremap <silent><buffer> <C-j>   <Plug>(unite_select_next_line)
  imap     <silent><buffer> <C-k>   <Plug>(unite_select_previous_line)
  nnoremap <silent><buffer> <C-k>   <Plug>(unite_select_previous_line)
  nnoremap <silent><buffer> <C-l> unite#do_action('preview')
  nnoremap <silent><buffer> <C-t> unite#do_action('tabopen')
  imap     <silent><buffer> <C-t> unite#do_action('tabopen')
  nnoremap <silent><buffer> <C-v> unite#do_action('vsplit')
  imap     <silent><buffer> <C-v> unite#do_action('vsplit')
  nnoremap <silent><buffer> <C-x> unite#do_action('split')
  imap     <silent><buffer> <C-x> unite#do_action('split')
  nnoremap <silent><buffer><expr> <C-i> unite#do_action('preview')
  imap     <silent><buffer><expr> <C-i> unite#do_action('preview')
  nnoremap <silent><buffer><expr> <C-o> unite#do_action('start')
  imap     <silent><buffer><expr> <C-o> unite#do_action('start')
  nmap <silent><buffer> <Esc><Esc> <Plug>(unite_exit)
  imap <silent><buffer> <Esc><Esc> <Plug>(unite_exit)
endfunction

call unite#custom#profile('default', 'context', {
      \   'ignorecase': 1,
      \   'start_insert': 1,
      \   'winheight': 40
      \ })

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Unite Fasd
"
let g:unite_fasd#fasd_path='/usr/bin/fasd'
let g:unite_fasd#fasd_cache = '~/.fasd'
let g:unite_fasd#read_only = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ YankRing
"
let g:yankring_history_dir = '~/.vim/'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

