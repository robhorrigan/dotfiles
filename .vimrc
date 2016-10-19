" Shortcuts to edit vimrc/zshrc and load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Save session in VIM to reopen previous windows
nnoremap <leader>s :mksession<CR>

" Pathogen.vim
call pathogen#infect()

" Enable line numbers
set number

" Set numbering width
set numberwidth=5

" Show command in bottom bar
set showcmd

" Color scheme
colorscheme badwolf
set background=dark
set encoding=utf-8

" Enable syntax processing
syntax enable

" Number of visual spaces per TAB
set tabstop=2

" Number of spaces in tab when editing
set softtabstop=2

" Set TABs as spaces
set expandtab

" Highlight current line
set cursorline

" Load filetype-specific indent files
filetype indent on

" Visual autocomplete for command menu
set wildmenu

" Redraw only when we neet to
set lazyredraw

" Highlight matching [{()}]
set showmatch

" Search as characters are entered
set incsearch

" Highlight search matches
set hlsearch

" Turn off search highlight with <space>
nnoremap <leader><space> :nohlsearch<CR>

" Enable folding
set foldenable

" Set fold default
set foldlevelstart=10

" Set fold nest max
set foldnestmax=10

" <space> open/close fold
nnoremap <space> za

" Fold based on indent level
set foldmethod=indent

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Disable ^/$
nnoremap ^ <nop>
nnoremap $ <nop>

" Highlight last inserted text on command
nnoremap gV `[v`]

" Leader is comma
let mapleader=","

" toggle Gundo
nnoremap <leader>u :GundoToggle<CR>

" Open ag.vim for Silver Searcher (format: :Ag [options] {pattern} [{directory}])
nnoremap <leader>a :Ag

" CtrlP for file searching
set runtimepath^=~/.vim/bundle/ctrlp.vim

" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Tmux mode - allow cursor change
"if exists('$TMUX')
"  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Exc>\\"
"  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Exc>\\"
"else
"  let &t_SI = "\<Esc>50;CursorShape=1\x7"
"  let &t_EI = "\<Esc>50;CursorShape=0\x7"
"endif

" Auto configs
augroup configgroup
  autocmd!
  autocmd VimEnter * highlight clear SignColumn
  autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
            \:call <SID>StripTrailingWhitespaces()
  autocmd FileType ruby setlocal tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2
  autocmd FileType ruby setlocal softtabstop=2
  autocmd FileType ruby setlocal commentstring=#\ %s
  autocmd FileType python setlocal commentstring=#\ %s
  autocmd BufEnter *.cls setlocal filetype=java
  autocmd BufEnter *.zsh-theme setlocal filetype=zsh
  autocmd BufEnter Makefile setlocal noexpandtab
  autocmd BufEnter *.sh setlocal tabstop=2
  autocmd BufEnter *.sh setlocal shiftwidth=2
  autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Moves Vim backup file to /tmp (http://dougblack.io/words/a-good-vimrc.html)
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" toggle between number and relativenumber
function! ToggleNumber()
  if(&relativenumber == 1)
    set norelativenumber
    set number
  else
    set relativenumber
  endif
endfunc

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
  " save last search & cursor position
  let _s=@/
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  let @/=_s
  call cursor(l, c)
endfunction
