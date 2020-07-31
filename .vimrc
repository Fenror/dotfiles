call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'vim-latex/vim-latex'
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'derekwyatt/vim-fswitch'
Plug 'danro/rename.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'benmills/vimux'
Plug 'tpope/vim-commentary'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'lilydjwg/colorizer'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

filetype plugin on
syntax on " Enable syntax highlighting

colorscheme solarized
set t_Co=256
set autoindent
set autoread                    " Automatically load file changes
set background=dark
set backspace=indent,eol,start  " Make backspace work properly
set cursorline                  " Higlight current line
set encoding=utf-8
set termencoding=utf-8
set expandtab                   " Turn tabs into spaces
set foldcolumn=1                " Extra margin to the left
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
set relativenumber
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
set wildignore+=*.log,*.aux,*.pdf,*.gz,*.bbl,*.thm,*.out,*.bst,*.std,*.blg,*.o
set wildmenu
set wrap

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
map <Leader>gs :Gstatus<cr>
map <Leader>gd :Gdiff<cr>
map <Leader>gc :Gcommit<cr>
map <Leader>gl :Glog<cr>
map <Leader>gp :Gpush<cr>
map <Leader>gr :Gread<cr>
map <Leader>go :Git checkout<Space>
map <Leader>gb :Git branch<Space>
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"CtrlP
let g:ctrlp_map='§'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_by_filename=1
let g:ctrlp_switch_buffer=1

"Relative line numbers
au InsertEnter * :set norelativenumber
au InsertLeave * :set relativenumber

"tmux-navigator
let g:tmux_navigator_no_mappings = 1
augroup vimrc
  au!
  au VimEnter * unmap <C-j>
  au VimEnter * noremap <C-j> <C-w>j
augroup END
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-e> :TmuxNavigatePrevious<cr>
map <leader>p :VimuxRunCommand "python " . bufname("%")<cr>
map <leader>P :VimuxRunCommand "python -i " . bufname("%")<cr>

"nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-f> :NERDTreeToggle<CR>

"ALE
let g:ale_linters = {
\   'python': ['flake8', 'pylint'],
\   'javascript': ['eslint'],
\   'vue': ['eslint']
\}

let g:ale_fixers = {
  \    'javascript': ['eslint'],
  \    'typescript': ['prettier', 'tslint'],
  \    'vue': ['eslint'],
  \    'scss': ['prettier'],
  \    'html': ['prettier'],
  \    'reason': ['refmt']
  \}
let g:ale_fix_on_save = 1

"vimtex
let g:Tex_DefaultTargetFormat = 'pdf'
let g:vimtex_view_general_viewer = 'xdg-open'
let g:vimtex_latexmk_continuous = 0
let g:tex_flavor = 'pdflatex'
let g:Tex_CompileRule_pdf = 'pdflatex --interaction=nonstopmode $*'
let g:Tex_ViewRule_pdf = 'zathura'

au FileType tex setlocal nocursorline
au FileType tex :NoMatchParen
