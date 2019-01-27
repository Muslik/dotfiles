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
Plug 'pangloss/vim-javascript', {'for': ['js', 'jsx']}
Plug 'mxw/vim-jsx', {'for': ['jsx']}
Plug 'sjl/vitality.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'zchee/deoplete-clang', { 'do': 'brew install llvm' }
Plug 'zchee/libclang-python3'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
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
Plug 'chriskempson/base16-vim'
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim', {'for': ['c', 'cpp', 'h']}
Plug 'hail2u/vim-css3-syntax', { 'for': ['css'] }
Plug 'gorodinskiy/vim-coloresque', {'for': ['css', 'html', 'less', 'sass', 'scss']}
Plug 'tpope/vim-haml', {'for': ['scss', 'sass', 'haml']}
Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax', {'for': ['html', 'js', 'jsx']}
Plug 'arnaud-lb/vim-php-namespace', {'for': ['php']}
call plug#end()

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#libclang_path = "/usr/local/Cellar/llvm/7.0.1/lib/libclang.dylib"
call deoplete#custom#var('clangx', 'clang_binary', '/usr/local/bin/clang')
"*****************************************************************************
" ALE
"*****************************************************************************

let g:ale_sign_error = '●' " Less aggressive than the default '>>'
let g:ale_sign_warning = '.'
let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
let g:ale_c_gcc_options = '-Wall -Wextra -Werror -I../includes -I./includes -I include -I libft -I./include/headers'
let g:ale_c_clangtidy_options = '-Wall -Wextra -Werror -I../includes -I./includes -I include -I libft -I./include/headers'
let g:ale_c_clang_options = '-Wall -Wextra -Werror -I../includes -I./includes -I include -I libft -I./include/headers'
let g:ale_c_clang_options = '-Wall -Wextra -Werror -I../includes -I./includes -I include -I libft -I./include/headers'
let g:ale_cpp_clang_options = '-Wall -Wextra -Werror -I../includes -I./includes -I./include/headers -std=c++11'
let g:ale_cpp_clangcheck_options = '-Wall -Wextra -Werror -I../includes -I./includes -I./include/headers -std=c++11'

"*****************************************************************************
" EMMET
"*****************************************************************************

let g:user_emmet_leader_key='<leader>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}
autocmd FileType html,css,js,jsx EmmetInstall
autocmd FileType js,html,css,javascript.jsx setlocal shiftwidth=2 tabstop=2

"*****************************************************************************
" MARKDOWN"
"*****************************************************************************
let vim_markdown_preview_github=1

""*****************************************************************************
"" ULTISNIPS
""*****************************************************************************
" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<Leader>e"
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
