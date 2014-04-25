" Stolen from Ben Orenstein, Gary Bernhardt, Drew Neil, others

" ========================================================================
" Vundle stuff
" ========================================================================
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle (required)!
Bundle 'gmarik/vundle'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-commentary'
Bundle 'kien/ctrlp.vim'
Bundle 'terryma/vim-expand-region'
Bundle 'christoomey/vim-titlecase'
Bundle 'thoughtbot/vim-rspec'
Bundle 'jgdavey/tslime.vim'
Bundle 'godlygeek/tabular'
Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'

" Frontend
Bundle 'othree/html5.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'cakebaker/scss-syntax.vim'
Bundle "pangloss/vim-javascript"
Bundle 'kchmck/vim-coffee-script'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-haml'
Bundle 'christoomey/vim-tmux-navigator'

Bundle 'ervandew/supertab'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-unimpaired'
Bundle 'vim-ruby/vim-ruby'
Bundle 'wincent/Command-T'
Bundle 'koron/nyancat-vim'

" nelstrom's plugin depends on kana's
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'

" Other languages
Bundle 'tpope/vim-foreplay'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'elixir-lang/vim-elixir'

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

    vmap <Leader>b :<c-u>!git blame <c-r>=expand("%:p") <cr> \| sed -n <c-r>=line("'<") <cr>,<c-r>=line("'>") <cr>p <cr>
    nmap <Leader>bi :source ~/.vimrc<cr>:BundleInstall<cr>
    vmap <Leader>bed "td?describe<cr>obed<tab><esc>"tpkdd/end<cr>o<esc>:nohl<cr>
    map <Leader>bp <cr>binding.pry<esc>:w<cr>
    map <Leader>cu :tabularize /\|<cr>
    map <Leader>co ggvg"*y
    map <Leader>cc :Rjcollection client/
    map <Leader>cj :Rjspec client/
    map <Leader>cm :Rjmodel client/
    map <Leader>ct :Rtemplate client/
    map <Leader>cv :Rjview client/
    map <Leader>d odebugger<cr>puts 'debugger'<esc>:w<cr>
    map <Leader>f :e spec/factories.rb<cr>
    map <Leader>ge :tabe Gemfile<cr>
    map <Leader>i mmgg=G`m 
    map <Leader>m :Rmodel 
    map <Leader>nn :sp ~/rails_projects/lifelong-learning/coding-notes.md<CR>
    map <Leader>o :CtrlP<CR>
    map <Leader>oo :tabe ~/rails_projects/lifelong-learning/<CR>
    map <Leader>p :set paste<cr>o<esc>"*]p:set nopaste<cr>
    map <Leader>q :q<cr>
    map <Leader>r :e config/routes.rb<cr>
    map <Leader>ra :%s/
    map <Leader>rs :vsp <c-r>#<cr><c-w>w
    map <Leader>rw :%s/\s\+$//<cr>:w<cr>
    map <Leader>sc :sp db/schema.rb<cr>
    map <Leader>sg :sp<cr>:grep 
    map <Leader>sj :call openjasminespecinbrowser()<cr>
    map <Leader>sm :RSmodel 
    map <Leader>snc :tabe ~/.vim/snippets/scss.snippets<cr>
    map <Leader>snj :tabe ~/.vim/snippets/javascript.snippets<cr>
    map <Leader>snm :tabe ~/.vim/snippets/markdown.snippets<cr>
    map <Leader>snr :tabe ~/.vim/snippets/ruby.snippets<cr>
    map <Leader>so :so %<cr>
    map <Leader>sp :e spec/spec_helper.rb<cr>
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
    nnoremap <leader>gj :CtrlP app/assets/javascripts<cr>
    nnoremap <leader>gm :CtrlP app/models<cr>
    nnoremap <leader>gh :CtrlP app/helpers<cr>
    nnoremap <leader>gl :CtrlP lib<cr>
    nnoremap <leader>gs :CtrlP app/assets/stylesheets<cr>
    nnoremap <leader>gt :CtrlP spec<cr>

    " Rspec.vim mappings
    let g:rspec_command = 'call Send_to_Tmux("spring rspec {spec}\n")'
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

    " Make hamlc files recognizable as haml
    au BufRead,BufNewFile *.hamlc set filetype=haml

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
