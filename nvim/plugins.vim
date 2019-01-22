"  ██████╗ ██╗     ██╗   ██╗ ██████╗ ███████╗
"  ██╔══██╗██║     ██║   ██║██╔════╝ ██╔════╝
"  ██████╔╝██║     ██║   ██║██║  ███╗███████╗
"  ██╔═══╝ ██║     ██║   ██║██║   ██║╚════██║
"  ██║     ███████╗╚██████╔╝╚██████╔╝███████║
"  ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚══════╝
call plug#begin()
"*****************************************************************************
"" Plug install packages
"*****************************************************************************
Plug 'rhysd/vim-clang-format'
Plug 'vim-scripts/bnf.vim'
Plug 'pbondoer/vim-42header'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sjl/vitality.vim'
Plug 'valloric/youcompleteme', {'do': './install.py --tern-completer'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
	let g:make = 'make'
endif
Plug 'honza/vim-snippets'
Plug 'cocopon/iceberg.vim'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'
Plug 'othree/xml.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'arnaud-lb/vim-php-namespace'
Plug 'chriskempson/base16-vim'
call plug#end()

"*****************************************************************************
" ALE
"*****************************************************************************

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file

"*****************************************************************************
" EMMET
"*****************************************************************************

let g:user_emmet_leader_key='<leader>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
autocmd FileType html,css,javascript.jsx EmmetInstall
autocmd FileType js,html,css,javascript.jsx setlocal shiftwidth=2 tabstop=2

"*****************************************************************************
" MARKDOWN"
"*****************************************************************************
let vim_markdown_preview_github=1

""*****************************************************************************
"" ULTISNIPS
""*****************************************************************************
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit="vertical"

"*****************************************************************************
" NERD TREE
"*****************************************************************************
let g:NERDTreeChDirMode=2
let NERDTreeShowHidden=0
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=0
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 35
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
