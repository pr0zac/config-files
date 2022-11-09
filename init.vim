let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'pr0zac/onedark.vim'
" Plug 'joshdick/onedark.vim'
Plug 'othree/yajs.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jparise/vim-graphql'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'luochen1990/rainbow'
Plug 'blueyed/vim-diminactive'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'elzr/vim-json'
Plug 'bkad/CamelCaseMotion'
Plug 'myusuf3/numbers.vim'
Plug 'simnalamburt/vim-mundo'
call plug#end()

autocmd!
set termguicolors
colorscheme onedark
syntax on
syn match tab display "\t"
hi link tab Error
set cursorline
set colorcolumn=81

set nu rnu
set backspace=indent,eol,start
set incsearch
set hlsearch
set clipboard=unnamedplus
set nomodeline

set history=1000
set showbreak=...
set wrap linebreak nolist
set hidden
set cmdheight=2
set updatetime=300

set smarttab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set viminfo+=n~/.vim_other/viminfo
set undodir=~/.vim_other/_backup
set undofile

set wildmode=list:longest,full
set wildmenu
set completeopt=longest,menu,noinsert,noselect
set mouse+=a

let mapleader = ","

"dear f1 key, please go fuck yourself, sincerely zac
inoremap <f1> <esc>
nnoremap <f1> <esc>
vnoremap <f1> <esc>

" Fix page-up/page-down behavior
nnoremap <silent> <PageUp> <C-U>
vnoremap <silent> <PageUp> <C-U>
inoremap <silent> <PageUp> <C-\><C-O><C-U>

nnoremap <silent> <PageDown> <C-D>
vnoremap <silent> <PageDown> <C-D>
inoremap <silent> <PageDown> <C-\><C-O><C-D>

" Buffer switching shortcuts
nnoremap gh :bp<CR>
nnoremap gl :bn<CR>
nnoremap gq :BD<CR>

" CamelCaseMotion configs
map <silent> <leader>w <Plug>CamelCaseMotion_w
map <silent> <leader>b <Plug>CamelCaseMotion_b
map <silent> <leader>e <Plug>CamelCaseMotion_e
map <silent> <leader>ge <Plug>CamelCaseMotion_ge

" jump to last cursor position when opening a file
" don't do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
  if &filetype !~ 'commit\c'
    if line("'\"") > 0 && line("'\"") <= line("$")
      exe "normal! g`\""
      normal! zz
    endif
  end
endfunction

" Autoresize splits when vim is resized
autocmd VimResized * exe "normal! \<c-w>="

let g:rainbow_active = 1

let g:closetag_filenames = '*.tsx'
let g:closetag_regions = {
\ 'typescript.tsx': 'jsxRegion,tsxRegion',
\ 'javascript.jsx': 'jsxRegion',
\ }

let g:AutoPairsShortcutToggle=''
let g:AutoPairsShortcutBackInsert='<C-b>'

" Coc.nvim
hi CocUnderline guibg=#E5C07B guifg=black
let g:coc_global_extensions = ["coc-tsserver", "coc-eslint", "coc-json", "coc-prettier", "coc-css", "coc-pyright"]
let g:echodoc_enable_at_startup = 1
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ CheckBackSpace() ? "\<TAB>" :
  \ coc#refresh()
autocmd CompleteDone * if pumvisible() == 0 | pclose | endif

inoremap <silent><expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <silent><expr><CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
map <silent><C-j> <Plug>(coc-definition)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
map <leader>r :CocCommand document.renameCurrentWord<CR>
map <leader>r :CocCommand document.renameCurrentWord<CR>
map <leader>` :CocRestart<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
map <silent><C-t> :call <SID>show_documentation()<CR>

" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let $FZF_DEFAULT_OPTS = '--color=fg:#D7D9D9,bg:#191B21,hl:#E06C75 --layout=reverse  --margin=1,2'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(30)
  let width = float2nr(150)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = float2nr((&lines - height) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height,
        \ 'style': 'minimal'
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction

nnoremap <silent> <C-p> :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
nnoremap <silent> <C-b> :call fzf#vim#buffers()<CR>

" Airline config
let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']
let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'
let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#switch_buffers_and_tabs = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
set laststatus=2
set ttimeoutlen=50

" Configure NERDTree stuff
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = ['^\.DS_Store$', '^node_modules$[[dir]]', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
let g:NERDTreeStatusline = ''

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_startify = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderPatternMatching = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1
let WebDevIconsUnicodeDecorateFolderNodesExactMatches = 1

" indentLine
let g:indentLine_enabled = 0
let g:indentLine_char = "|"
let g:indentLine_color_term = 236
let g:indentLine_color_gui = '#272A33'
map <C-l> :IndentLinesToggle<CR>
" autocmd WinEnter * :IndentLinesEnable
" autocmd WinLeave * :IndentLinesDisable
let g:vim_json_syntax_conceal = 0

" Show trailing whitespace.
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
map <leader>s :%s/\s\+$//e<CR>

nnoremap <leader>u :MundoToggle<CR>
nnoremap <leader>j :execute '%!python -m json.tool'<CR>
