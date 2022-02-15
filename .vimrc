let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets' " assortment of vim snippets for ultisnip
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
" Git tools
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Kotlin support
Plug 'udalov/kotlin-vim'

" C/C++ support
"Plug 'vim-scripts/c.vim'
Plug 'rhysd/vim-clang-format'
"Plug 'vim-scripts/Conque-GDB'
" Go support
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries'  }
Plug 'buoto/gotests-vim'

" Ruby support
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'ruby-formatter/rufo-vim'
" JavaScript support
Plug 'pangloss/vim-javascript'
Plug 'ternjs/tern_for_vim'


" React
Plug 'mxw/vim-jsx'

" Typescript support
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" CSS support
Plug 'JulesWang/css.vim'
Plug 'hail2u/vim-css3-syntax'

" HTML support
Plug 'mattn/emmet-vim'


" Youcompleteme
"Plug 'Valloric/YouCompleteMe'

" Outlining
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }

" GraphQL
Plug 'jparise/vim-graphql' 

" Syntax Check
 Plug 'w0rp/ale'
"
" Async Commands plugin
Plug 'skywind3000/asyncrun.vim'

"Markdown
Plug 'JamshedVesuna/vim-markdown-preview'

"Rust support
Plug 'rust-lang/rust.vim'
"PHP support
Plug 'StanAngeloff/php.vim'
"Yaml support
Plug 'avakhov/vim-yaml'

call plug#end()


set ttyfast
set modifiable
if !has('nvim')
  set ttymouse=xterm2
  set ttyscroll=3
endif

set laststatus=2
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically reread changed files without asking me anything
set autoindent                  
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set mouse=a                     "Enable mouse mode

set noerrorbells             " No beeps
set number                   " Show line numbers
set showcmd                  " Show me what I'm typing
set noswapfile               " Don't use swapfile
set nobackup                 " Don't create annoying backup files
set splitright               " Split vertical windows right to the current windows
set splitbelow               " Split horizontal windows below to the current windows
set autowrite                " Automatically save before :next, :make etc.
set hidden
set fileformats=unix,dos,mac " Prefer Unix over Windows over OS 9 formats
set noshowmatch              " Do not show matching brackets by flickering
set noshowmode               " We show the mode with airline or lightline
set ignorecase               " Search case insensitive...
set smartcase                " ... but not it begins with upper case 
set completeopt=menu,menuone
set nocursorcolumn           " speed up syntax highlighting
set nocursorline
set updatetime=300
set pumheight=10             " Completion window max size
set conceallevel=2           " Concealed text is completely hidden
set wildmenu
set lazyredraw
set clipboard=unnamed
set relativenumber

" ~/.viminfo needs to be writable and readable
set viminfo='200

if has('persistent_undo')
  set undofile
  set undodir=~/.cache/vim
endif

" color
syntax enable
set t_Co=256
set background=light
colorscheme PaperColor



" Mapping Configuration
" This comes first, because we have mappings that depend on leader
" With a map leader it's possible to do extra key combinations
" i.e: <leader>w saves the current file
let mapleader = ","


" Some useful quickfix shortcuts for quickfix
nnoremap <leader>a :cclose<CR>


" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" Center the screen
nnoremap <space> zz

" Remove search highlight
 nnoremap <leader><space> :nohlsearch<CR>
function! s:clear_highlight()
  let @/ = ""
  call go#guru#ClearSameIds()
endfunction
nnoremap <silent> <leader><space> :<C-u>call <SID>clear_highlight()<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

if has('terminal')
" Kill job and close terminal window
  tnoremap <Leader>q <C-w><C-C><C-w>c<cr>

  " switch to normal mode with esc
  tnoremap <Esc> <C-W>N

  " mappings to move out from terminal to other views
  tnoremap <C-h> <C-w>h
  tnoremap <C-j> <C-w>j
  tnoremap <C-k> <C-w>k
  tnoremap <C-l> <C-w>l
  " Open terminal in vertical, horizontal and new tab
  nnoremap <leader>tv :vsplit<cr>:term ++curwin<CR>
  nnoremap <leader>ts :split<cr>:term ++curwin<CR>
  nnoremap <leader>tt :tabnew<cr>:term ++curwin<CR>

  tnoremap <leader>tv <C-w>:vsplit<cr>:term ++curwin<CR>
  tnoremap <leader>ts <C-w>:split<cr>:term ++curwin<CR>
  tnoremap <leader>tt <C-w>:tabnew<cr>:term ++curwin<CR>

endif


" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" Exit on j
imap jj <Esc>

" Source (reload configuration)
nnoremap <silent> <F3> :source ~/.vimrc<CR>

" Toggle Spell 
nnoremap <F4> :setlocal spell! spell?<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
 nnoremap n nzzzv
 nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Do not show stupid q: window
map q: :q

" Tabs Configuration
augroup filetypedetect
  command! -nargs=* -complete=help Help vertical belowright help <args>
  autocmd FileType help wincmd L
  
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.hcl setf conf
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

  autocmd BufRead,BufNewFile *.gotmpl set filetype=gotexttmpl
  
  autocmd BufNewFile,BufRead *.ino setlocal noet ts=4 sw=4 sts=4
  autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.html setlocal noet ts=4 sw=4
  autocmd BufNewFile,BufRead *.vim setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.hcl setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.sh setlocal expandtab shiftwidth=2 tabstop=2
  autocmd BufNewFile,BufRead *.proto setlocal expandtab shiftwidth=2 tabstop=2
  
  autocmd FileType javascript setlocal ts=2 sts=2 sw=2
  autocmd FileType javascript.jsx setlocal ts=2 sts=2 sw=2
  autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2
  
  autocmd FileType ruby setlocal expandtab shiftwidth=2 tabstop=2
augroup END



" Plugins Configuration

" Vim Go
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'


" Emmet 
"let g:user_emmet_leader_key='<Tab>'


" Vim Markdown preview
let vim_markdown_preview_github=1

" Pretier JS formatting configured with ALE
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fix_on_save = 1


" C format
autocmd FileType c,cpp,objc ClangFormatAutoEnable


" ==================== NerdTree ====================
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>

let NERDTreeShowHidden=1

" ==================== UltiSnips ====================
" let the defaults :)
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif



" CtrlP search config
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|node_modules|vendor)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" RUbo (Ruby formatter support)
let g:rufo_auto_formatting = 1
