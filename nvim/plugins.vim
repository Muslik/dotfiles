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
Plug 'haishanh/night-owl.vim'
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'tpope/vim-repeat'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle'}
Plug 'tpope/vim-commentary'
Plug 'alexlafroscia/postcss-syntax.vim'
Plug 'tpope/vim-surround'
Plug 'bronson/vim-trailing-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

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
Plug 'nanotech/jellybeans.vim'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim', {'for': ['c', 'cpp', 'h']}
Plug 'hail2u/vim-css3-syntax', { 'for': ['css'] }
Plug 'gorodinskiy/vim-coloresque', {'for': ['css', 'html', 'less', 'sass', 'scss']}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-haml', {'for': ['scss', 'sass', 'haml']}
Plug 'chriskempson/base16-vim'
Plug 'daviesjamie/vim-base16-lightline'
Plug 'airblade/vim-gitgutter'
Plug 'leafgarland/typescript-vim'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'peitalin/vim-jsx-typescript'
Plug 'herringtondarkholme/yats.vim'
call plug#end()

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

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
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


"*****************************************************************************
" COC NVIM
"*****************************************************************************
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

let g:vim_jsx_pretty_colorful_config = 1
