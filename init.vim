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
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'psf/black', { 'branch': 'stable' }
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.6' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'fannheyward/telescope-coc.nvim'
call plug#end()

autocmd!
set termguicolors
colorscheme onedark
syntax on
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
set updatetime=250

set smarttab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set expandtab

set viminfo+=n~/.vim_other/viminfo
set undodir=~/.vim_other/_backup
set undofile
set signcolumn=yes

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
let g:coc_global_extensions = ["coc-tsserver", "coc-eslint", "coc-json", "coc-prettier", "coc-css", "coc-pyright", "coc-vimlsp", "coc-go"]
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <C-Tab> to trigger copilot completion.
inoremap <silent><expr> <C-l> copilot#Accept("")
inoremap <silent><expr> <C-j> copilot#Next()
inoremap <silent><expr> <C-k> copilot#Previous()
inoremap <silent><expr> <C-h> copilot#Dismiss()
let g:copilot_no_tab_map = v:true

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[d` and `]d` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> ]d <plug>(coc-diagnostic-next)
nmap <silent> [d <Plug>(coc-diagnostic-prev)

" GoTo code navigation
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use ctrl+t to jump to definition
function! s:JumpToDefinition()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('jumpDefinition')
  endif
endfunction

nmap <silent> gd <Plug>(coc-definition)
nmap <silent><C-j> :call <SID>JumpToDefinition()<CR>

" Use ctrl+t to show documentation in popup window
function! s:ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  endif
endfunction
map <silent><C-t> :call <SID>ShowDocumentation()<CR>

function! <SID>FormatFile()
  if &filetype == 'python'
    execute 'Black'
  else
    call CocActionAsync('format')
  endif
endfunction

noremap <leader>n <Plug>(coc-rename)
noremap <leader>` :CocRestart<CR>
noremap <leader>f :call <SID>FormatFile()<CR>

" Highlight symbol and references when cursor isn't moving
autocmd CursorHold * silent call CocActionAsync('highlight')

" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
" let $FZF_DEFAULT_COMMAND = 'ag -g ""'
" let $FZF_DEFAULT_OPTS = '--color=fg:#D7D9D9,bg:#191B21,hl:#E06C75 --layout=reverse  --margin=1,2'
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" function! FloatingFZF()
"   let buf = nvim_create_buf(v:false, v:true)
"   call setbufvar(buf, '&signcolumn', 'no')

"   let height = float2nr(30)
"   let width = float2nr(150)
"   let horizontal = float2nr((&columns - width) / 2)
"   let vertical = float2nr((&lines - height) / 2)

"   let opts = {
"         \ 'relative': 'editor',
"         \ 'row': vertical,
"         \ 'col': horizontal,
"         \ 'width': width,
"         \ 'height': height,
"         \ 'style': 'minimal'
"         \ }

"   call nvim_open_win(buf, v:true, opts)
" endfunction

nnoremap <silent> <C-p> <cmd>Telescope find_files<cr>
nnoremap <silent> <C-b> <cmd>Telescope buffers<cr>
nnoremap <silent> <C-s> <cmd>Telescope live_grep<cr>
nnoremap <leader>t <cmd>Telescope<cr>


" Airline config
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#notexists = '✖'
let g:airline#extensions#branch#symbol = ' '
function! CustomBranchName(name)
  return a:name . ' '
endfunction
let g:airline#extensions#branch#format = 'CustomBranchName'
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_extensions = ['branch', 'hunks', 'coc', 'tabline']
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#coc#error_symbol = ' '
let g:airline#extensions#coc#warning_symbol = ' '
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#show_tab_type = 0
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>[ <Plug>AirlineSelectPrevTab
nmap <leader>] <Plug>AirlineSelectNextTab
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
map <leader>l :IndentLinesToggle<CR>
" autocmd WinEnter * :IndentLinesEnable
" autocmd WinLeave * :IndentLinesDisable
let g:vim_json_syntax_conceal = 0

" make sure all text is visible
function! RematchWhitespace()
  highlight ExtraWhitespace ctermbg=204 guibg=#E06C75
  match ExtraWhitespace /\s\+$/
  hi Conceal cterm=underline gui=underline ctermfg=59 guifg=#5c6370
endfunction

" Show trailing whitespace.
autocmd ColorScheme * call RematchWhitespace()
autocmd BufRead * call RematchWhitespace()
autocmd InsertEnter * call RematchWhitespace()
autocmd InsertLeave * call RematchWhitespace()
map <leader>w :%s/\s\+$//e<CR>

nnoremap <leader>u :MundoToggle<CR>

let g:loaded_python_provider = 0
let g:python3_host_prog = '$HOME/.pyenv/shims/python'
set pyxversion=3
nnoremap <leader>j :execute '%!python -m json.tool'<CR>

:lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "vim", "vimdoc", "typescript", "javascript", "json", "html", "yaml", "css", "graphql", "terraform", "sql", "bash", "lua" },
  sync_install = true,
  auto_install = true,

  highlight = {
    enable = false,
    additional_vim_regex_highlighting = false,
  },
}

require('telescope').setup {
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('coc')
EOF
