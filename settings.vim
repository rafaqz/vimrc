
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
"" {{{ General

""Shell
set shell=bash
set ttyfast
"" Use Unix as the standard file type
set ffs=unix,dos,mac
"" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

"" Sets how many lines of history VIM has to remember
"set history=700
"" Tags - search down to root to find them.
"set tags=./tags;/
"" Don't redraw while executing macros (good performance config)
"set lazyredraw
"" For regular expressions turn magic on
"set magic
"" Specify the behavior when switching between buffers
"try
"  set switchbuf=useopen,usetab,newtab
"  set stal=2
"catch
"endtry

"" set dir to current file
" autocmd BufEnter * silent! lcd %:p:h

"" No annoying sound on errors
set noerrorbells
set novisualbell
"set t_vb=
"set tm=500

"" No annoying promtps
"set shortmess=aoOtI

"" Enable filetype plugins
"filetype plugin on
"filetype indent on

"" Turn on the WiLd menu
set wildmenu
"" Ignore compiled files
"" set wildignore=*.o,*~,*.pyc,*/tmp/*,*.so,*.swp,*.zip
"set wildignore=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
"" set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" set wildmenu ""
" set wildchar <Tab>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Nvim

" Yank to clipboard
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Movement

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7
" Leader key timeout
set tm=500
"Always show current position
set ruler

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
" No mouse in insert mode.
if has('mouse')
  set mouse=n
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Layout

set number      " Show line numbers
set cmdheight=1 " Height of the command bar
set hidden      " A buffer becomes hidden when it is abandoned

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Folds

" set foldlevelstart=20
" set foldcolumn=0
" set foldmethod=syntax
" set foldnestmax=10

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Colors

" 256 color mode
set t_Co=256
" let g:solarized_termcolors=16
" colorscheme solarized
colorscheme one

if GetFileLine("/home/raf/.background_color", 1) == "dark"
  set background=dark
else
  set background=light
endif

syntax enable

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Status line

" Always show the status line
set laststatus=2
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ GUI

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
endif

" Disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Search

" Ignore case when searching
" set ignorecase
" When searching try to be smart about cases
set smartcase
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Files

" Set directory to current file
set autochdir

" Turn backup files off
set nobackup
set nowb
set noswapfile

" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim/temp_dirs/undodir
    set undofile
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
" set viminfo^=%

" Put config files in nicer places
"
if !has("nvim")
  set viminfo+=n~/.vim/viminfo
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Tab and indents

set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs
set ai "Auto indent
set si "Smart indent

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Lines and wrapping
"
" Linebreak on 500 characters
set linebreak
set tw=500

set nowrap "dont wrap lines
set whichwrap+=<,>,h,l,[,]
set synmaxcol=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Highlight

" set cursorline!

" Italic comments
highlight Comment cterm=italic
" No underline for fold
hi Folded term=bold cterm=NONE
" let &colorcolumn=join(range(81,999),",")

augroup highlight_things
  " autocmd BufEnter * call Highlight_Overlength()
  " autocmd BufEnter,ColorScheme * call Highlight_Split()
  autocmd BufEnter,ColorScheme * call Highlight_EndOfBuffer()
augroup END

set redrawtime=10000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ LanguageServer
lua << EOF
  require'lspconfig'.julials.setup{
      on_new_config = function(new_config, _)
          local julia = vim.fn.expand("~/.julia/environments/nvim-lspconfig/bin/julia")
          if require'lspconfig'.util.path.is_file(julia) then
              new_config.cmd[1] = julia
          end
      end
  }
EOF


autocmd Filetype julia setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>

" Fix up
nnoremap <C-K> <C-W><C-K>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}


