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
Plug 'vim-scripts/bnf.vim', {'for': ['bnf']}
Plug 'pbondoer/vim-42header'
Plug 'w0rp/ale'
Plug 'ryanoasis/vim-devicons', { 'on': 'NERDTreeToggle'}
Plug 'JamshedVesuna/vim-markdown-preview', {'for': ['md']}
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'mxw/vim-jsx', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'sjl/vitality.vim'
Plug 'zchee/libclang-python3'
Plug 'tpope/vim-repeat'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'

Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'jiangmiao/auto-pairs'

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
Plug 'chriskempson/base16-vim'
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim', {'for': ['c', 'cpp', 'h']}
Plug 'hail2u/vim-css3-syntax', { 'for': ['css'] }
Plug 'gorodinskiy/vim-coloresque', {'for': ['css', 'html', 'less', 'sass', 'scss']}
Plug 'tpope/vim-haml', {'for': ['scss', 'sass', 'haml']}
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
call plug#end()

"*****************************************************************************
" ALE
"*****************************************************************************

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_c_parse_makefile = 1
let g:ale_c_parse_compile_commands = 1
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
let g:ale_fix_on_save = 1

"*****************************************************************************
" EMMET
"*****************************************************************************

let g:user_emmet_leader_key='<leader>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
"*****************************************************************************
" MARKDOWN"
"*****************************************************************************
let vim_markdown_preview_github=1

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

