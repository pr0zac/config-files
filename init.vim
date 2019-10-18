"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/pr0zac/.config/nvim/cache/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/pr0zac/.config/nvim/cache')
  call dein#begin('/home/pr0zac/.config/nvim/cache')

  " Let dein manage dein
  " Required:
  call dein#add('/home/pr0zac/.config/nvim/cache/repos/github.com/Shougo/dein.vim')

  call dein#add('joshdick/onedark.vim')
  " call dein#add('sonph/onehalf', {'rtp': 'vim/'})
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('Shougo/denite.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  call dein#add('peitalin/vim-jsx-typescript')
  call dein#add('jparise/vim-graphql')
  call dein#add('ctrlpvim/ctrlp.vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-surround')
  call dein#add('luochen1990/rainbow')
  call dein#add('dense-analysis/ale')
  call dein#add('blueyed/vim-diminactive')
  call dein#add('qpkorr/vim-bufkill')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
" if dein#check_install()
"  call dein#install()
" endif

"End dein Scripts-------------------------
"
let g:deoplete#enable_at_startup = 1

let g:rainbow_active = 1

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Ctrl-P configuration
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=50
let g:ctrlp_lazy_update=1
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix']
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Airline config
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
set laststatus=2
set ttimeoutlen=50

syntax on
syn match tab display "\t"
hi link tab Error
set t_Co=256
set cursorline
set colorcolumn=81
colorscheme onedark
hi Normal ctermfg=15 ctermbg=235 guifg=#FFFFFF guibg=#282C34

"Show trailing whitespace.
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
map gs :%s/\s\+$//e<CR>

"dear f1 key, please go fuck yourself, sincerely zac
inoremap <f1> <esc>
nnoremap <f1> <esc>
vnoremap <f1> <esc>

set number
set backspace=indent,eol,start
set incsearch
set hlsearch
set clipboard=unnamedplus
set nomodeline

set history=1000
set showbreak=...
set wrap linebreak nolist
set hidden

set smarttab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set undodir=~/.vim_other/_backup
set undofile

" Buffer switching shortcuts
map gh :bp<CR>
map gl :bn<CR>
map gq :BD<CR>

" Fix page-up/page-down behavior
nnoremap <silent> <PageUp> <C-U><C-U>
vnoremap <silent> <PageUp> <C-U><C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U><C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D><C-D>
vnoremap <silent> <PageDown> <C-D><C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D><C-\><C-O><C-D>

