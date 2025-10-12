"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Plug

call plug#begin()

"---------------------------------
" {{{ Bling
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
Plug 'rbong/vim-crystalline'
" Plug 'altercation/vim-colors-solarized'
" Plug 'reedes/vim-colors-pencil'
Plug 'ryanoasis/vim-devicons'
Plug 'm00qek/baleia.nvim' " ansii code theme
Plug 'rakr/vim-one'
"---------------------------------}}}
" {{{ Edit
" Plug 'wikitopian/hardmode'
" Plug 'Shougo/neocomplete.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'roxma/nvim-completion-manager'
" Plug 'jiangmiao/auto-pairs'
" Plug 'jalvesaq/zotcite'
Plug 'intuited/visdo'
" Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
Plug 'dahu/vim-fanfingtastic'
" Plug 'haya14busa/vim-easyoperator-line'
Plug 'michaeljsmith/vim-indent-object'
" Plug 'vim-scripts/Align'
Plug 'tommcdo/vim-lion'
" Plug 'terryma/vim-expand-region'
Plug 'vim-scripts/YankRing.vim'
Plug 'mbbill/undotree'
" Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/nvim-cmp'
Plug 'petertriho/cmp-git'
Plug 'samjwill/nvim-unception'
" Plug 'vim-scripts/vis'
" Plug 'vim-scripts/VisIncr'
" Plug 'Raimondi/delimitMate'
" Plug 'junegunn/vim-easy-align'
" Plug 'Shougo/echodoc.vim'
"---------------------------------}}}
" {{{ Git
" Plug 'airblade/vim-rooter'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-rhubarb'
Plug 'int3/vim-extradite'
Plug 'airblade/vim-gitgutter'
" Plug 'junegunn/gv.vim'
" Plug 'gregsexton/gitv'
" Plug 'vim-scripts/gitignore'
"---------------------------------}}}
" {{{ Nav
" Plug 'amix/open_file_under_cursor.vim'
" Plug 'Lokaltog/vim-easymotion'
Plug 'reedes/vim-wheel'
" " Plug 'majutsushi/tagbar'
" " Plug 'junegunn/fzf'
Plug 'rafaqz/ranger.vim'
" Plug 'vim-scripts/SearchComplete'
" Plug 'AndrewRadev/linediff.vim'
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
" Plug 'jalvesaq/vimcmdline'
Plug 'Vigemus/iron.nvim'
Plug 'andythigpen/nvim-coverage'
Plug 'olimorris/codecompanion.nvim'
Plug 'ravitemer/mcphub.nvim'
Plug 'nvim-lua/plenary.nvim' " needed for codecompanion
" Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
"---------------------------------}}}
" {{{ Snippet
" Plug 'honza/vim-snippets'
" Plug 'Shougo/neosnippet.vim'
" Plug 'Shougo/neosnippet-snippets'
"---------------------------------}}}
" {{{ Syntax
Plug 'neovim/nvim-lsp'
" Plug 'neovim/nvim-lspconfig'
" Plug 'jmbuhr/otter.nvim'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'quarto-dev/quarto-nvim'
Plug 'chrisbra/csv.vim'," { 'for': 'csv' }
" Plug 'baskerville/vim-sxhkdrc'
" Plug 'hashivim/vim-terraform'
" Plug 'sheerun/vim-polyglot'
" Plug 'joonty/vdebug'
"-------------------------
" {{{ R
Plug 'jalvesaq/Nvim-R'
"-------------------------}}}
" {{{ julia
" Plug 'zyedidia/julialint.vim'
" Plug 'AtsushiSakai/julia.vim'
" Plug 'JuliaEditorSupport/julia-vim'
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
" Plug 'dag/vim2hs', { 'for': 'haskell' }
" Plug 'Twinside/vim-hoogle', { 'for': 'haskell' }
" Plug 'eagletmt/neco-ghc', { 'for': 'haskell' }
" Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
" Plug 'Twinside/vim-syntax-haskell-cabal', { 'for': 'cabal' }
"-------------------------}}}
" {{{ Markdown
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
" Plug 'vim-pandoc/vim-pandoc-after' ", { 'for': ['markdown','rmd'] }
Plug 'vim-pandoc/vim-rmarkdown', { 'for': ['markdown','rmd','Rmd'] }
" Plug 'phongvcao/vim-stardict', { 'for': ['markdown','rmd'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
" Plug 'rhysd/vim-grammarous', { 'on': 'GrammarousCheck' }
" Plug 'reedes/vim-textobj-sentence'
" Plug 'reedes/vim-textobj-quote', { 'for': 'markdown' }
" Plug 'reedes/vim-wordy', { 'for': 'markdown' }
"-------------------------}}}
" {{{ Lua
Plug 'nvim-lua/plenary.nvim'
"---------------------------------}}}
"---------------------------------}}}
" {{{ Unite
" Plug 'Shougo/neoyank.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
" Plug 'osyo-manga/unite-quickfix'
Plug 'tsukkee/unite-help'
Plug 'kmnk/vim-unite-giti'
Plug 'ujihisa/unite-colorscheme'
Plug 'rafaqz/citation.vim'
" Plug 'tsukkee/unite-tag'
Plug 'critiqjo/unite-fasd.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'naquad/unite-digraphs'
Plug 'ujihisa/unite-locate'
Plug 'Shougo/vimproc.vim', { 'do': 'make' } " Make Unite fast
"---------------------------------}}}

" Add plugins to &runtimepath
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

runtime macros/matchit.vim

" {{{ baleia
lua <<EOF
vim.api.nvim_create_autocmd("FileType", {
   pattern = "iron",
   callback = function()
     -- Enable baleia's ANSI color processing for this buffer
     vim.b.baleia_ansii_colors = 1
   end,
   desc = "Enable baleia ANSI colors for iron buffers",
})
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Chrystaline
"

function! g:GroupSuffix()
  if mode() ==# 'i' && &paste
    return '2'
  endif
  if &modified
    return '1'
  endif
  return ''
endfunction

function! g:CrystallineStatuslineFn(winnr)
  let g:crystalline_group_suffix = g:GroupSuffix()
  let l:curr = a:winnr == winnr()
  let l:s = ''

  if l:curr
    let l:s .= crystalline#ModeSection(0, 'A', 'B')
  else
    let l:s .= crystalline#HiItem('Fill')
  endif
  let l:s .= ' %f%h%w%m%r '
  if l:curr
    let l:s .= crystalline#Sep(0, 'B', 'Fill') . ' %{fugitive#Head()}'
  endif

  let l:s .= '%='
  if l:curr
    let l:s .= crystalline#Sep(1, 'Fill', 'B') . '%{&paste ? " PASTE " : " "}'
    let l:s .= crystalline#Sep(1, 'B', 'A')
  endif
  if winwidth(a:winnr) > 80
    let l:s .= ' %{&ft} %l/%L %2v '
  else
    let l:s .= ' '
  endif

  return l:s
endfunction

function! g:CrystallineTablineFn()
  let l:max_width = &columns
  let l:right = '%='

  let l:right .= crystalline#Sep(1, 'TabFill', 'TabType')
  let l:max_width -= 1

  let l:vimlabel = has('nvim') ?  ' NVIM ' : ' VIM '
  let l:right .= l:vimlabel
  let l:max_width -= strchars(l:vimlabel)

  let l:max_tabs = 23

  return crystalline#DefaultTabline({
        \ 'enable_sep': 1,
        \ 'max_tabs': l:max_tabs,
        \ 'max_width': l:max_width
        \ }) . l:right
endfunction

set showtabline=2
set guioptions-=e
set laststatus=2
let g:crystalline_auto_prefix_groups = 1
let g:crystalline_theme = 'onedark'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ cmp

" lua <<EOF
"   vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#FF0000" })
" 
"   -- Set up nvim-cmp.
"   local cmp = require'cmp'
"   cmp.setup({
"     snippet = {
"       -- REQUIRED - you must specify a snippet engine
"       expand = function(args)
"         vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
"         -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
"         -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
"         -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
"       end,
"     },
"     window = {
"        completion = cmp.config.window.bordered(),
"        documentation = cmp.config.window.bordered(),
"     },
"     enabled = function()
"         vim.notify(vim.fn.expand("%"))
"         return not string.find(vim.fn.expand("%"), "unite")
"     end,
"     mapping = cmp.mapping.preset.insert({
"       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
"       ['<C-f>'] = cmp.mapping.scroll_docs(4),
"       ['<C-Space>'] = cmp.mapping.complete(),
"       ['<C-e>'] = cmp.mapping.abort(),
"       ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
" 			["<Tab>"] = cmp.mapping(function(fallback)
"           if cmp.visible() then
"             cmp.select_next_item()
"           else
"             fallback()
"           end
"         end, {"i", "s"}),
"     
"         ["<S-Tab>"] = cmp.mapping(function(fallback)
"           if cmp.visible() then
"             cmp.select_prev_item()
"           else
"             fallback()
"           end
"         end, {"i", "s"}),
"     }),
"     sources = cmp.config.sources({
"       { name = 'buffer',
"         get_bufnrs = function()
"           return vim.api.nvim_list_bufs()
"         end
"       },
"       { name = 'git' },
"       { name = 'nvim_lsp' },
"       { name = 'vsnip' }, -- For vsnip users.
"       { name = 'codeium' },
"       -- { name = 'luasnip' }, -- For luasnip users.
"       -- { name = 'ultisnips' }, -- For ultisnips users.
"       -- { name = 'snippy' }, -- For snippy users.
"     }, { })
"   })
" 
"   -- Set configuration for specific filetype.
"   cmp.setup.filetype('gitcommit', {
"     sources = cmp.config.sources({
"       { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
"     }, {
"       { name = 'buffer' },
"     })
"   })
" 
"   -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
"   cmp.setup.cmdline({ '/', '?' }, {
"     mapping = cmp.mapping.preset.cmdline(),
"     sources = {
"       { name = 'buffer' }
"     }
"   })
" 
"   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
"   cmp.setup.cmdline(':', {
"     mapping = cmp.mapping.preset.cmdline(),
"     sources = cmp.config.sources({
"       { name = 'path' }
"     }, {
"       { name = 'cmdline' }
"     })
"   })
" 
"   -- Set up lspconfig.
"   local capabilities = require('cmp_nvim_lsp').default_capabilities()
"   -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
"   -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
"   --   capabilities = capabilities
"   -- }
" EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Citation.vim

let g:citation_vim_cache_path='~/.cache'
let g:citation_vim_bibtex_file='~/Uni/Citations/Library.bib'
let g:citation_vim_collection=""
let g:citation_vim_zotero_path='~/Zotero'
let g:citation_vim_zotero_version=5
" let g:citation_vim_mode='bibtex'
" let g:citation_vim_key_format="{author}{date}{title}"
call unite#util#set_default('g:citation_vim_description_format',  "{}∶ {} ‴{}‴ ₋{}₋ ₍{}₎ ┊{}┊")
call unite#util#set_default('g:citation_vim_description_fields', ["type", "key", "title", "author", "date", "publication"])

let $ZCitationTemplate = '{author}{year}{title}'
let $ZoteroSQLpath = '~/Zotero/zotero.sqlite'
let $Zotcite_tmpdir = '~/.cache'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ cmdline

" vimcmdline mappings
" let cmdline_map_start          = "<LocalLeader>s"
" let cmdline_map_send           = "<LocalLeader>d"
" let cmdline_map_send_and_stay  = "<LocalLeader>l"
" let cmdline_map_source_fun     = "<LocalLeader>f"
" let cmdline_map_send_paragraph = "<LocalLeader>p"
" let cmdline_map_send_block     = "<LocalLeader>b"
" let cmdline_map_quit           = "<LocalLeader>q"
" let cmdline_app                = {}
" let cmdline_app['julia']       = '/opt/julia/bin/julia'
" " let cmdline_app['julia']       = '/opt/julia/bin/julia -t 6'
" " let cmdline_app['julia']       = '/bin/zsh -c "JULIA_NUM_THREADS=6 /opt/julia/bin/julia"'
" let cmdline_app['julia']       = '/bin/zsh -c "/opt/julia/bin/julia -t 6"'
" " let cmdline_app['julia']       = '/opt/julia/bin/julia --project=.'
" " let cmdline_app['julia']       = '/opt/julia/bin/julia -p3'
" " let cmdline_app['julia']       = '/opt/julia/bin/julia --check-bound=yes'
" " let cmdline_app['julia']       = '/opt/julia/bin/julia --inline=no'

" " vimcmdline options
" let cmdline_vsplit             = 1      " Split the window vertically
" let cmdline_esc_term           = 1      " Remap <Esc> to :stopinsert in Neovim terminal
" let cmdline_in_buffer          = 1      " Start the interpreter in a Neovim buffer
" let cmdline_term_height        = 15     " Initial height of interpreter window or pane
" let cmdline_term_width         = 80     " Initial width of interpreter window or pane
" let cmdline_tmp_dir            = '.'
" "'/tmp' " Temporary directory to save files
" let cmdline_outhl              = 1      " Syntax highlight the output
" let cmdline_external_term_cmd  = "alacritty -e %s &"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Codecompanion

lua << EOF
require("codecompanion").setup({
  adapters = {
    acp = {
      gemini_cli = function()
        return require("codecompanion.adapters").extend("gemini_cli", {
          defaults = {
            auth_method = "gemini-api-key", -- "oauth-personal"|"gemini-api-key"|"vertex-ai"
          },
          env = {
            GEMINI_API_KEY = "cmd:op read op://personal/Gemini_API/credential --no-newline",
          },
        })
      end,
    },
  },
})
EOF

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
" {{{ Iron.vim
lua << EOF
local iron = require("iron.core")
local view = require("iron.view")
local common = require("iron.fts.common")

iron.setup {
  config = {
    -- Whether a repl should be discarded or not
    scratch_repl = false,
    -- Your repl definitions come here
    repl_definition = {
      sh = {
        -- Can be a table or a function that
        -- returns a table (see below)
        command = {"zsh"}
      },
      python = {
        command = { "python3" },  -- or { "ipython", "--no-autoindent" }
        format = common.bracketed_paste_python,
        block_dividers = { "# %%", "#%%" },
        env = {PYTHON_BASIC_REPL = "1"} --this is needed for python3.13 and up.
      }
    },
    -- set the file type of the newly created repl to ft
    -- bufnr is the buffer id of the REPL and ft is the filetype of the 
    -- language being used for the REPL. 
    repl_filetype = function(bufnr, ft)
      -- or return a string name such as the following
      return "iron"
    end,
    -- Send selections to the DAP repl if an nvim-dap session is running.
    dap_integration = true,
    -- How the repl window will be displayed
    -- See below for more information
    repl_open_cmd = view.split.botright("%45"),

    -- repl_open_cmd can also be an array-style table so that multiple 
    -- repl_open_commands can be given.
    -- When repl_open_cmd is given as a table, the first command given will
    -- be the command that `IronRepl` initially toggles.
    -- Moreover, when repl_open_cmd is a table, each key will automatically
    -- be available as a keymap (see `keymaps` below) with the names 
    -- toggle_repl_with_cmd_1, ..., toggle_repl_with_cmd_k
    -- For example,
    -- 
    -- repl_open_cmd = {
    --   view.split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
    --   view.split.rightbelow("%25")  -- cmd_2: open a repl below
    -- }
  },
  -- Iron doesn't set keymaps by default anymore.
  -- You can set them here or manually add keymaps to the functions in iron.core
  keymaps = {
    toggle_repl = "<space>rr", -- toggles the repl open and closed.
    -- If repl_open_command is a table as above, then the following keymaps are
    -- available
    -- toggle_repl_with_cmd_1 = "<space>rv",
    -- toggle_repl_with_cmd_2 = "<space>rh",
    restart_repl = "<space>rR", -- calls `IronRestart` to restart the repl
    send_motion = "<space>ss",
    visual_send = "<space>ss",
    send_file = "<space>sf",
    send_line = "<space>sl",
    send_paragraph = "<space>sp",
    send_until_cursor = "<space>su",
    send_mark = "<space>sm",
    send_code_block = "<space>sb",
    send_code_block_and_move = "<space>sn",
    mark_motion = "<space>mc",
    mark_visual = "<space>mc",
    remove_mark = "<space>md",
    cr = "<space>s<cr>",
    interrupt = "<space>s<space>",
    exit = "<space>sq",
    clear = "<space>cl",
  },
  -- If the highlight is on, you can change how it looks
  -- For the available options, check nvim_set_hl
  highlight = {
    italic = true
  },
  ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
}

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<space>rf', '<cmd>IronFocus<cr>a')
vim.keymap.set('n', '<space>rh', '<cmd>IronHide<cr>')
vim.keymap.set('n', '<space>sap', function()
    local ts_utils = require 'nvim-treesitter.ts_utils'

    local bufnr = vim.api.nvim_get_current_buf()
    local cursor_node = ts_utils.get_node_at_cursor()
    local top_non_module = nil
    local node = cursor_node

    while node do
      local type = node:type()
      if type ~= 'module' then
        top_non_module = node
      end
      node = node:parent()
    end
    data = vim.treesitter.get_node_text(top_non_module, bufnr)
    iron.send(nil, data)
  end
)

EOF
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ julia-vim
let g:latex_to_unicode_suggestions = 0
let g:julia_blocks = 0
let g:julia_indent_align_funcargs = 1

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
let R_external_term = 'alacritty -e'

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
let g:ranger_terminal = "alacritty -h"
let g:ranger_insert_format = '.'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Quarto

lua << EOF
require('quarto').setup{
  debug = false,
  closePreviewOnExit = true,
  lspFeatures = {
    enabled = true,
    chunks = "curly",
    languages = { "julia", "bash", "html" },
    diagnostics = {
      enabled = true,
      triggers = { "BufWritePost" },
    },
    completion = {
      enabled = true,
    },
  },
  codeRunner = {
    enabled = false,
    default_method = nil, -- 'molten' or 'slime'
    ft_runners = {}, -- filetype to runner, ie. `{ python = "molten" }`.
                     -- Takes precedence over `default_method`
    never_run = { "yaml" }, -- filetypes which are never sent to a code runner
  },
}
EOF

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Rooter

" let g:rooter_silent_chdir = 1

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
let g:syntastic_cpp_checkers = ['cppcheck']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Table Mode
let g:table_mode_auto_align = 0
let g:table_mode_update_time = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" {{{ Treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "julia", "javascript", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (or "all")
  ignore_install = {},

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    -- disable = function(lang, buf)
    --     local max_filesize = 100 * 1024 -- 100 KB
    --     local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
    --     if ok and stats and stats.size > max_filesize then
    --         return true
    --     end
    -- end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

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
