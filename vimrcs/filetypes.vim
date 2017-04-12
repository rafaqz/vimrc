""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Filetype specific settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" {{{ JavaScript

function! SetJavaScript()
  setl fen
  setl nocindent
  setl foldmethod=syntax
  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

  function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction
endfunction
au FileType javascript call SetJavaScript()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ CoffeeScript

function! SetCoffeeScript()
  setl foldmethod=indent
endfunction
au FileType coffee call SetCoffeeScript()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Ruby

function! SetRuby()
  call pathogen#infect('~/.vim_runtime/ruby_plugins/{}')
  setl foldmethod=indent
  set foldmethod=syntax
  let ruby_operators = 1
  let ruby_space_errors = 1
  let ruby_fold = 1
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_rails = 1
  let g:rubycomplete_buffer_loading = 1
  let g:rubycomplete_classes_in_global = 1
  let g:rubycomplete_rails = 1
endfunction
au FileType ruby call SetRuby()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Haskell

function! SetHaskell()
  setlocal omnifunc=necoghc#omnifunc
  set foldmethod=indent
  set completeopt+=longest
  let g:haskell_conceal_wide = 0

  " Show types in completion suggestions
  let g:necoghc_enable_detailed_browse = 1
  let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['haskell'] }

  set conceallevel=0

  " Use stylish haskell instead of par for haskell buffers
  let &formatprg="stylish-haskell"
  let g:hscoptions="𝐒⦂𝐓𝐄𝐌xtIZB𝔻"
  set tags=tags;/,codex.tags;/

  let g:tagbar_type_haskell = {
        \ 'ctagsbin'  : 'hasktags',
        \ 'ctagsargs' : '-x -c -o-',
        \ 'kinds'     : [
        \      'm:modules:0:1',
        \      'd:data: 0:1',
        \      'd_gadt: data gadt:0:1',
        \      't:type names:0:1',
        \      'nt:new types:0:1',
        \      'c:classes:0:1',
        \      'cons:constructors:1:1',
        \      'c_gadt:constructor gadt:1:1',
        \      'c_a:constructor accessors:1:1',
        \      'ft:function types:1:1',
        \      'fi:function implementations:0:1',
        \      'o:others:0:1'
        \     ],
        \ 'sro'        : '.',
        \ 'kind2scope' : {
        \     'm' : 'module',
        \     'c' : 'class',
        \     'd' : 'data',
        \     't' : 'type'
        \ },
        \ 'scope2kind' : {
        \     'module' : 'm',
        \     'class'  : 'c',
        \     'data'   : 'd',
        \     'type'   : 't'
        \ }
      \ }


  set csprg=hscope
  set csto=1 " search codex tags first
  set cst
  set csverb
  " Use buffer words as default tab completion
  " let g:SuperTabDefaultCompletionType = '<c-x><c-p>'

  " But provide (neco-ghc) omnicompletion
  if has("gui_running")
    imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  else " no gui
    if has("unix")
      inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
    endif
  endif

  " Type of expression under cursor
  nmap <silent> <leader>ht :GhcModType<CR>
  " Insert type of expression under cursor
  nmap <silent> <leader>hd :GhcModTypeInsert<CR>
  " Insert type of expression under cursor
  nmap <silent> <leader>hi :GhcModInfo<CR>
  nmap <silent> <leader>hp :GhcModInfoPreview<CR><C-j><C-k>
  " GHC errors and warnings
  nmap <silent> <leader>hc :GhcModCheckAsync<CR>
  " Haskell Lint
  nmap <silent> <leader>hl :GhcModLintAsync<CR>
  nmap <leader>hh ea<C-X><C-O>

  " Hoogle the word under the cursor
  nnoremap <silent> <leader>ho :Hoogle<CR>
  " Hoogle and prompt for input
  nnoremap <leader>hO :Hoogle
  " Hoogle for detailed documentation (e.g. "Functor")
  nnoremap <silent> <leader>hd :HoogleInfo<CR>
  " Hoogle for detailed documentation and prompt for input
  nnoremap <leader>hD :HoogleInfo
  " Hoogle, close the Hoogle window
  nnoremap <silent> <leader>hz :HoogleClose<CR>

  " Pretty unicode haskell symbols
  " nnoremap <leader>hca :set conceallevel=1<cr>
  " nnoremap <leader>hco :set conceallevel=0<cr>
  " Generate haskell tags with codex and hscope
  " map <leader>tg :!codex update --force<CR>:call system("git hscope -X TemplateHaskell")<CR><CR>:call LoadHscope()<CR>

  vnoremap <silent> <leader>h. :call Pointfree()<CR>
  vnoremap <silent> <leader>h> :call Pointful()<CR>

  nnoremap <silent> <C-\> :cs find c <C-R>=expand("<cword>")<CR><CR>

  " Conversion
  function! Pointfree()
    call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
  endfunction

  function! Pointful()
    call setline('.', split(system('pointful '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
  endfunction

  " Automatically make cscope connections
  function! LoadHscope()
    let db = findfile("hscope.out", ".;")
    if (!empty(db))
      let path = strpart(db, 0, match(db, "/hscope.out$"))
      set nocscopeverbose " suppress 'duplicate connection' error
      exe "cs add " . db . " " . path
      set cscopeverbose
    endif
  endfunction
  au BufEnter /*.hs call LoadHscope()

  let g:haskell_tabular = 1

  augroup whitespace
    autocmd!
    " autocmd BufWrite *.hs :call DeleteTrailingWS()
  augroup END

  augroup haskell
    autocmd!
    map <silent> <leader><cr> :noh<cr>:GhcModTypeClear<cr>:SyntasticReset<cr>
    setlocal omnifunc=necoghc#omnifunc
  augroup END
endfunction
au FileType haskell call SetHaskell()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Elm
"
function! SetElm()
  call neocomplete#util#set_default_dictionary(
        \ 'g:neocomplete#sources#omni#input_patterns',
        \ 'elm',
        \ '\.')
endfunction
autocmd FileType elm call SetElm()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Python

function! SetPython()
  let python_highlight_all = 1
  syn keyword pythonDecorator True None False self
  set foldmethod=indent
  setlocal omnifunc=jedi#completions
  " let g:jedi#completions_enabled = 0
  " let g:jedi#auto_vim_configuration = 0
  let g:neocomplete#force_omni_input_patterns.python =
        \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
  " alternative pattern: '\h\w*\|[^. \t]\.\w*'
endfunction
autocmd FileType python call SetPython()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Vim

function! SetVim()
  " fold vimrc by categories
  set foldmethod=marker
  set foldlevel=0
  :setlocal keywordprg=:help
endfunction
autocmd! FileType vim call SetVim()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Markdown

augroup markdown
  autocmd!
  autocmd! Bufread,BufEnter,BufNewFile *.md
        \   call SetLight()
  autocmd! BufLeave *.md call SetDark()

  autocmd FileType pandoc,markdown,mkd,rmd
        \   setlocal textwidth=80
        \ | setlocal commentstring=<!--\ %s\ -->
        \ | set foldlevel=1
        \ | set nowrap
        \ | let g:neocomplete#disable_auto_complete = 1
        \ | let g:table_mode_corner='|'
augroup END

fun! SetLight()
  set background=light
  colorscheme pencil
  exec 'source ~/.vim/plugged/vim-pandoc-syntax/syntax/pandoc.vim'
endfun

fun! SetDark()
  set background=dark
  colorscheme solarized
  exec 'source ~/.vim/plugged/vim-pandoc-syntax/syntax/pandoc.vim'
endfun

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Git

au FileType gitcommit call setpos('.', [0, 1, 1, 0])

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ CSS

" set omnifunc=syntaxcomplete#Complete
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

