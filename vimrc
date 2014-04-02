" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

" snipMate so I won't cry now
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

" Stuff I installed
Bundle 'The-NERD-Commenter'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-expand-region'
Bundle 'thoughtbot/vim-rspec'
Bundle 'jgdavey/tslime.vim'
Bundle 'godlygeek/tabular'

" Frontend
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'christoomey/vim-tmux-navigator'

" Ben's Stuff
Bundle 'ervandew/supertab'
Bundle 'kchmck/vim-coffee-script'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'wincent/Command-T'
Bundle 'koron/nyancat-vim'
Bundle 'elixir-lang/vim-elixir'

" nelstrom's plugin depends on kana's
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Clojure
Bundle 'tpope/vim-foreplay'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'

" colors
Bundle 'nanotech/jellybeans.vim'
colorscheme jellybeans

" ================
" ruby stuff
" ================
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

map <Leader>ac :sp app/controllers/application_controller.rb<cr>
vmap <Leader>b :<c-u>!git blame <c-r>=expand("%:p") <cr> \| sed -n <c-r>=line("'<") <cr>,<c-r>=line("'>") <cr>p <cr>
map <Leader>bb :!bundle install<cr>
nmap <Leader>bi :source ~/.vimrc<cr>:BundleInstall<cr>
vmap <Leader>bed "td?describe<cr>obed<tab><esc>"tpkdd/end<cr>o<esc>:nohl<cr>
map <Leader>bp <cr>binding.pry<esc>:w<cr>
map <Leader>cc :!cucumber --drb %<cr>
map <Leader>cu :tabularize /\|<cr>
map <Leader>co ggvg"*y
map <Leader>cc :Rjcollection client/
map <Leader>cj :Rjspec client/
map <Leader>cm :Rjmodel client/
map <Leader>ct :Rtemplate client/
map <Leader>cv :Rjview client/
map <Leader>d odebugger<cr>puts 'debugger'<esc>:w<cr>
map <Leader>dr :e ~/dropbox<cr>
map <Leader>f :vsp spec/factories.rb<cr>
map <Leader>fix :cnoremap % %<cr>
map <Leader>gac :gcommit -m -a ""<left>
map <Leader>gc :gcommit -m ""<left>
map <Leader>gw :!git add . && git commit -m 'wip' && git push<cr>
map <Leader>g :tabe Gemfile<cr>
map <Leader>i mmgg=g`m<cr>
map <Leader>j :commandt app/assets/javascripts<cr>client/
map <Leader>m :Rmodel 
map <Leader>nn :sp ~/rails_projects/lifelong-learning/coding-notes.md<CR>
map <Leader>oo :tabe ~/rails_projects/lifelong-learning/<CR>
map <Leader>p :set paste<cr>o<esc>"*]p:set nopaste<cr>
map <Leader>q :q<cr>
map <Leader>r :vsp config/routes.rb<cr>
map <Leader>ra :%s/
map <Leader>rd :!bundle exec rspec % --format documentation<cr>
map <Leader>rf :commandtflush<cr>:commandt<cr>
map <Leader>rs :vsp <c-r>#<cr><c-w>w
map <Leader>rt q:?!ruby<cr><cr>
map <Leader>rw :%s/\s\+$//<cr>:w<cr>
map <Leader>sc :sp db/schema.rb<cr>
map <Leader>sg :sp<cr>:grep 
map <Leader>sj :call openjasminespecinbrowser()<cr>
map <Leader>sm :RSmodel 
map <Leader>sp yss<p>
map <Leader>snc :tabe ~/.vim/snippets/scss.snippets<cr>
map <Leader>snm :tabe ~/.vim/snippets/markdown.snippets<cr>
map <Leader>snr :tabe ~/.vim/snippets/ruby.snippets<cr>
map <Leader>so :so %<cr>
map <Leader>sq j<c-v>}klllcs<esc>:wq<cr>
map <Leader>ss ds)i <esc>:w<cr>
map <Leader>st :!ruby -Itest % -n "//"<left><left>
map <Leader>su :RSunittest 
map <Leader>sv :RSview 
map <Leader>to :w<cr>:call RunCurrentLineInTest()<CR>
map <Leader>y :!rspec --drb %<cr>
map <Leader>u :Runittest<cr>
map <Leader>vc :RVcontroller<cr>
map <Leader>vf :RVfunctional<cr>
map <Leader>va :tabe ~/.dotfiles/zsh/aliases <CR>
map <Leader>vg :vsp<cr>:grep 
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>vim :tabe ~/rails_projects/lifelong-learning/programming/tools/vim/vimtutor.md<CR>
map <Leader>vz :tabe ~/.zshrc<CR>
map <Leader>vu :RVunittest<CR>
map <Leader>vm :RVmodel<cr>
map <Leader>vv :RVview<cr>
map <Leader>w <C-w>w
map <Leader>x :exec getline(".")<cr>

" Rspec.vim mappings
let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>tl :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>ts :call RunNearestSpec()<CR>

" CtrlP to O since I use it a lot
nnoremap <Leader>o :CtrlP<CR>
:nnoremap <CR> :nohlsearch<cr>

" Region expanding, vvvvv to expand character selections.
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=expand("%:p:h") . '/'<CR><CR>
map <Leader>s :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>v :vnew <C-R>=expand("%:p:h") . '/'<CR>

imap <C-l> :<Space>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <C-t> <esc>:tabnew<CR>
map <C-x> <C-w>c
map <C-n> :cn<CR>
map <C-p> :cp<CR>

" Navigating across splits
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
set clipboard=unnamed

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

set nofoldenable " Say no to code folding...

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

" Merge a tab into a split in the previous window
function! MergeTabs()
  if tabpagenr() == 1
    return
  endif
  let bufferName = bufname("%")
  if tabpagenr("$") == tabpagenr()
    close!
  else
    close!
    tabprev
  endif
  split
  execute "buffer " . bufferName
endfunction

nmap <C-W>u :call MergeTabs()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!bin/cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!bin/rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!bin/rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <Tab> <C-P>

" Let's be reasonable, shall we?
nmap k gk
nmap j gj


" Set up some useful Rails.vim bindings for working with Backbone.js
autocmd User Rails Rnavcommand template    app/assets/templates               -glob=**/*  -suffix=.jst.ejs
autocmd User Rails Rnavcommand jmodel      app/assets/javascripts/models      -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jview       app/assets/javascripts/views       -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jcollection app/assets/javascripts/collections -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jrouter     app/assets/javascripts/routers     -glob=**/*  -suffix=.coffee
autocmd User Rails Rnavcommand jspec       spec/javascripts                   -glob=**/*  -suffix=.coffee

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

" Don't go past 100 chars on levelup:
autocmd BufNewFile,BufRead /Users/ben/code/levelup/*.rb set colorcolumn=100

" Remove trailing whitespace on save for ruby files.
au BufWritePre *.rb :%s/\s\+$//e

function! OpenFactoryFile()
  if filereadable("test/factories.rb")
    execute ":sp test/factories.rb"
  else
    execute ":sp spec/factories.rb"
  end
endfunction

" Set gutter background to black
highlight SignColumn ctermbg=black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

" ========================================================================
" End of things set by me.
" ========================================================================

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
