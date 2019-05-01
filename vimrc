" Stolen from Ben Orenstein, Gary Bernhardt, Drew Neil, others

" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle (required)!
Plugin 'VundleVim/Vundle.vim'

Plugin 'MarcWeber/vim-addon-mw-utils' " vim: interpret a file by function and cache file automatically
Plugin 'tomtom/tlib_vim' " utility functions for vim
Plugin 'SirVer/ultisnips' " snippets
Plugin 'honza/vim-snippets' " snippet files for languages
Plugin 'tpope/vim-commentary' " for commenting stuff out
Plugin 'tpope/vim-vinegar' " for splitting windows
Plugin 'kien/ctrlp.vim' " fuzzy file finder
Plugin 'terryma/vim-expand-region'
Plugin 'christoomey/vim-titlecase'
Plugin 'thoughtbot/vim-rspec'
Plugin 'jgdavey/tslime.vim'
Plugin 'godlygeek/tabular'
Plugin 'rizzatti/funcoo.vim'
Plugin 'mattn/webapi-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'chiedo/vim-px-to-em'

" Frontend
Plugin 'othree/html5.vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'epilande/vim-react-snippets'
Plugin 'mxw/vim-jsx'
Bundle 'tpope/vim-markdown'
Plugin 'slim-template/vim-slim'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'kchmck/vim-coffee-script'
Plugin 'leafgarland/typescript-vim'

Plugin 'ervandew/supertab'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'wincent/Command-T'

" nelstrom's plugin depends on kana's
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'

" Other languages
Plugin 'tpope/vim-foreplay'
Plugin 'tpope/vim-classpath'
Plugin 'guns/vim-clojure-static'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()

" powerline

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" ================
" ruby stuff
" ================

" typescript
autocmd filetype typescript :set makeprg=tsc
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript

syntax on                 " enable syntax highlighting
filetype plugin indent on " enable filetype-specific indenting and plugins

augroup myfiletypes
  " clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd filetype ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd filetype ruby,eruby,yaml setlocal path+=lib

augroup end

" enable built-in matchit plugin
runtime macros/matchit.vim
" ================

let mapleader = "\<space>"

nmap <Leader>bi :source ~/.vimrc<cr>:PluginInstall<cr>
map <Leader>cu :Tabularize /:\zs<cr>
map <Leader>do :tabe .env<cr>
map <Leader>ge :tabe Gemfile<cr>
map <Leader>i mmgg=G`m
map <Leader>m :Rmodel
map <Leader>nn :sp ~/Documents/lifelong-learning/coding-notes.md<CR>
map <Leader>o :CtrlP<CR>
map <Leader>coo :tabe ~/Documents/lifelong-learning/<CR>
map <Leader>p :set paste<cr>o<esc>"*]p:set nopaste<cr>
map <Leader>q :q<cr>
map <Leader>r :e config/routes.rb<cr>
map <Leader>e :e config/locales/client.en.yml<cr>
map <Leader>ra :%s/
map <Leader>rs :vsp <c-r>#<cr><c-w>w
map <Leader>rw :%s/\s\+$//<cr>:w<cr>
map <Leader>snc :tabe ~/.vim/snippets/scss.snippets<cr>
map <Leader>snj :tabe ~/.vim/snippets/javascript.snippets<cr>
map <Leader>snm :tabe ~/.vim/snippets/markdown.snippets<cr>
map <Leader>snr :tabe ~/.vim/bundle/vim-snippets/snippets/ruby.snippets<cr>
map <Leader>so :so %<cr>
map <Leader>sq j<c-v>}klllcs<esc>:wq<cr>
map <Leader>ss ds)i <esc>:w<cr>
map <Leader>st :!ruby -Itest % -n "//"<left><left>
map <Leader>su :RSunittest
map <Leader>sv :RSview
map <Leader>u :Runittest<cr>
map <Leader>vc :RVcontroller<cr>
map <Leader>vf :RVfunctional<cr>
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>vim :tabe ~/rails_projects/lifelong-learning/programming/tools/vim/vimtutor.md<CR>
map <Leader>vu :RVunittest<CR>
map <Leader>vm :RVmodel<cr>
map <Leader>vv :RVview<cr>
map <Leader>w <C-w>w

" CtrlP mappings
nnoremap <leader><leader> <c-^>
nnoremap <leader>gv :CtrlP app/views<cr>
nnoremap <leader>gc :CtrlP app/controllers<cr>
nnoremap <leader>gf :CtrlP spec/factories<cr>
nnoremap <leader>gj :CtrlP app/assets/javascripts<cr>
nnoremap <leader>gz :CtrlP app/assets/stylesheets<cr>
nnoremap <leader>gm :CtrlP app/models<cr>
nnoremap <leader>gh :CtrlP app/helpers<cr>
nnoremap <leader>gl :CtrlP lib<cr>
nnoremap <leader>gs :CtrlP app/services<cr>
nnoremap <leader>gt :CtrlP spec<cr>
nnoremap <leader>gtr :CtrlP translations<cr>

" Rspec.vim mappings
let g:rspec_command = '!bundle exec spring rspec {spec}'
" let g:rspec_command = '!bundle exec rspec {spec}'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>tl :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>ts :call RunNearestSpec()<CR>

:nnoremap <CR> :nohlsearch<cr>

" Region expanding, vvvvv to expand character selections.
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR><CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR><cr>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

imap <C-l> :<Space>
map <C-s> <esc>:w!<CR>
imap <C-s> <esc>:w!<CR>
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Navigating across splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
set splitbelow
set splitright

set nocompatible
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set history=500                " keep 500 lines of command line history
set ruler                      " show the cursor position all the time
set showcmd                    " display incomplete commands
set autoindent
set showmatch
set wrap linebreak nolist
set backupdir=~/.tmp
set directory=~/.tmp           " Don't clutter my dirs up with swp and tmp files
set autoread
set wmh=0
set viminfo+=!
set guioptions-=T
set guifont=Triskweline_10:h10
set et
set sw=2
set smarttab
set noincsearch
set ignorecase smartcase
set laststatus=2               " Always show status line.
set relativenumber
set gdefault                   " assume the /g flag on :s substitutions to replace all matches in a line
set autoindent                 " always set autoindenting on
set background=dark
set eadirection=ver
set clipboard+=unnamed
set go+=a

" The most important thing. Use another regex engine which is ACTUALLY FASTER.
" https://stackoverflow.com/questions/19030290/syntax-highlighting-causes-terrible-lag-in-vim
set re=1

" Remove swap file (not sure if correct)
set backup 
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set backupskip=/tmp/*,/private/tmp/* 
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
set writebackup

" Set the tag file search order
set tags=./tags,tags;$HOME

" Use _ as a word-separator
" set iskeyword-=_

" Use Silver Searcher instead of grep
set grepprg=ag

" Get rid of the delay when hitting esc!
set noesckeys

" Make the omnicomplete text readable
:highlight PmenuSel ctermfg=black

" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;vendor/**;coverage/**;tmp/**;rdoc/**"

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Format xml files
au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null" 

set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.


let ruby_foldable_groups = '#' " Only fold comments (to ecnourage documentation)
" Code folding color is black
hi Folded ctermbg=016

" Disable Ex mode
map Q <Nop>

" Disable K looking stuff up
map K <Nop>

" When loading text files, wrap them and don't split up words.
au BufNewFile,BufRead *.txt setlocal lbr
au BufNewFile,BufRead *.txt setlocal nolist " Don't display whitespace
" Better? completion on command line
set wildmenu
" What to do when I press 'wildchar'. Worth tweaking to see what feels right.
set wildmode=list:full

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

" Turn on spell-checking in markdown and text.
au BufRead,BufNewFile *.md,*.txt setlocal spell
" Make md files recognizable as markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Make Ctrl-P plugin faster for git projects
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

" Let's be reasonable, shall we?
nmap k gk
nmap j gj

" Don't add the comment prefix when I hit enter or o/O on a comment line.
set formatoptions-=or

function! OpenJasmineSpecInBrowser()
  let filename = expand('%')
  "                  substitute(exprsson, pattern,            substitution,    flags)
  let url_fragment = substitute(filename, "spec/javascripts", "evergreen/run", "")
  let host_fragment = "http://localhost:3001/"
  let url = host_fragment . url_fragment
  silent exec "!open ~/bin/chrome" url
endfunction

" set statusline+=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

let g:CommandTMaxHeight=50
let g:CommandTMatchWindowAtTop=1

" Don't wait so long for the next keypress (particularly in ambigious leader
" situations.
set timeoutlen=500

" Remove trailing whitespace on save for ruby and Markdown files.
au BufWritePre *.rb :%s/\s\+$//e
au BufWritePre *.md :%s/\s\+$//e

" Set gutter background to black
highlight SignColumn ctermbg=black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <Leader>n :call RenameFile()<cr>

" Display extra whitespace
set list listchars=tab:»·,trail:·

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MULTIPURPOSE TAB KEY
" Indent if we're at the beginning of a line. Else, do completion.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif

  augroup END

endif " has("autocmd")

" Auto-corrections

iab teh the

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" CtrlP caching

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_follow_symlinks = 0

if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_custom_ignore = '\v[\/](tmp|node_modules|target|dist|daryllxd-db-backup|bower_components|public/api-docs/|client/bower_components/)|(\.(swp|ico|git|svn))$'
endif
