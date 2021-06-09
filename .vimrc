call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-latex/vim-latex'
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'
"Plug 'honza/vim-snippets'
Plug 'derekwyatt/vim-fswitch'
Plug 'danro/rename.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'tpope/vim-commentary'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier'
Plug 'jiangmiao/auto-pairs'
Plug 'lilydjwg/colorizer'
Plug 'tpope/vim-surround'
Plug 'psf/black'
Plug 'moll/vim-node'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'cdelledonne/vim-cmake'
Plug 'tpope/vim-dispatch'
Plug 'morhetz/gruvbox'
call plug#end()

filetype plugin on
syntax enable " Enable syntax highlighting
colorscheme gruvbox

set termguicolors
set t_Co=256
set autochdir                   " Automatically change directory to current file
set autoindent
set autoread                    " Automatically load file changes
set background=dark
set backspace=indent,eol,start  " Make backspace work properly
set cursorline                  " Higlight current line
set encoding=utf-8
set termencoding=utf-8
set expandtab                   " Turn tabs into spaces
set hidden                      " Remember undo tree and cursor positions and stuff
set history=1000
set hlsearch                    " Highlight search
set ignorecase
set incsearch                   " Show search matches as you type
set laststatus=2                " Always show statusline
set list                        " Highlight trailing spaces
set listchars=trail:.,extends:#
set nobackup
set noswapfile
set notimeout
set nowb
set number                      " Show line numbers
set ruler                       " Show row/col in lower right
set shiftwidth=2                " Autoindent 2 spaces
set smartcase
set smartindent
set so=10                       " Set scroll offset
set tabstop=2                   " Tabs are 2 spaces
set timeoutlen=1000
set ttimeout
set ttimeoutlen=0
set undolevels=1000
set wildignore+=*.log,*.aux,*.pdf,*.gz,*.bbl,*.thm,*.out,*.bst,*.std,*.blg,*.o,node_modules,build
set wildmenu
set wrap

"Weird hack to get syntax highlighting to work in tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let mapleader="\<Space>"
let maplocalleader="\<Space>"

"Keybindings
noremap ö :
noremap - /
map <C-n> gt
map <C-Tab> gt
map <C-p> gT
map <C-S-Tab> gT
map <C-t> :tabnew<cr>
set pastetoggle=<leader>v

"Quick access to vimrc
nmap <silent> <leader>ev :e $MYVIMRC<cr>
nmap <silent> <leader>sv :so $MYVIMRC<cr>

"Fugitive
map <Leader>gs :Git<cr>
map <Leader>gd :Git diff<cr>
map <Leader>gc :Git commit<cr>
map <Leader>gl :Git log<cr>
map <Leader>gp :Git push<cr>
map <Leader>gr :Git read<cr>
map <Leader>go :Git checkout<Space>
map <Leader>gb :Git branch<Space>
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"CtrlP
let g:ctrlp_map='§'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_by_filename=1
let g:ctrlp_switch_buffer=1

"tmux-navigator
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-e> :TmuxNavigatePrevious<cr>
autocmd FileType python nnoremap<buffer> <leader>p :call VimuxRunCommand("python " . bufname("%"))<cr>
autocmd FileType python nnoremap<buffer> <leader>P :call VimuxRunCommand("python -i " . bufname("%"))<cr>
autocmd FileType javascript nnoremap<buffer> <leader>p :call VimuxRunCommand("node " . bufname("%"))<cr>
autocmd FileType cpp nnoremap<buffer> <leader>p :call VimuxRunCommand("../Debug/main")<cr>
autocmd FileType cpp nnoremap<buffer> <leader>P :call VimuxRunCommand("../Release/main")<cr>
"autocmd FileType cpp nnoremap<buffer> <leader>P :Dispatch ../Release/main<cr>
let g:VimuxHeight = "30"
let g:VimuxOrientation = 'h'
let g:VimuxUseNearestPane = 0

"nerdtree
autocmd StdinReadPre * let s:std_in=1
map <C-f> :NERDTreeToggle<CR>

"vimtex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats = 'pdf,bibtex,pdf'
let g:vimtex_view_general_viewer = 'xdg-open'
let g:vimtex_latexmk_continuous = 0
let g:tex_flavor = 'pdflatex'
let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'zathura'
nmap <C-space> <Plug>IMAP_JumpForward

au FileType tex setlocal nocursorline
au FileType tex :NoMatchParen

"fswitch
au! BufEnter *.cpp let b:fswitchdst = 'hpp,h'| let b:fswitchlocs = '.,../include'
map <S-h> :FSHere<cr>

"supertab
let g:SuperTabDefaultCompletionType = "<c-n>"

"HTML tag thingie
imap <C-t> <></><Esc>5hdiwp3lpT>i

"CMake
let g:cmake_link_compile_commands = 1
map <leader>cg :CMakeGenerate<cr>
map <leader>cd :CMakeSwitch Debug<cr>
map <leader>cr :CMakeSwitch Release<cr>
map <leader>cb :CMakeBuild<cr>
map <leader>cq :CMakeClose<cr>

" Fix CocErrorHighlight in tmux
hi CocErrorHighlight gui=underline term=underline cterm=underline
hi CocWarningHighlight gui=underline term=underline cterm=underline
