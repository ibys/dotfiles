set updatetime=100
set history=1000
set nocompatible

au BufNewFile,BufRead *.pc setf esqlc
au BufNewFile,BufRead Make.defines* setf make

call plug#begin('~/.vim/plugged')

  " appearance
  set t_Co=256
  set background=dark
  "colorschemes
  Plug 'gilgigilgil/anderson.vim'
  Plug 'ayu-theme/ayu-vim'
  Plug 'ajmwagar/vim-deus'
  Plug 'morhetz/gruvbox'

  let g:gruvbox_bold = 1
  let g:gruvbox_italic = 1
  let g:gruvbox_underline = 1
  let g:gruvbox_contrast_dark = 'hard'
  augroup colorscheme_override
    autocmd!
    autocmd ColorScheme gruvbox hi CursorLine   ctermbg=Black
    "autocmd ColorScheme gruvbox hi CursorLineNr ctermbg=Black
    autocmd ColorScheme gruvbox hi LineNr       ctermbg=237
  augroup END

  " :FZF + <C-T> to open files in new tabs
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " let g:fzf_preview_window = ['down:50%', '?']
  let g:fzf_layout = { 'down': '60%' }
  let g:fzf_command_prefix = 'FZF'
  " reference: https://github.com/nicknisi/dotfiles/blob/master/config/nvim/init.vim
  nnoremap <silent> <C-o>      :FZF! %:p:h<CR>
  nnoremap <silent> <leader>fb :FZFBuffers<CR>
  nnoremap <silent> <leader>fr :call Fzfrg(expand('<cword>'), 1)<CR>
  nnoremap <silent> <leader>fw :FZFWindows<CR>
  nnoremap <silent> <leader>fm :FZFMaps<CR>
  nnoremap <silent> <leader>fl :FZFLines<CR>
  nnoremap <silent> <leader>ft :FZFTags<CR>

  function! Fzfrg(query, fullscreen)
    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case --iglob !"tags" -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang FZFRG call Fzfrg(<q-args>, <bang>0)

  " status line
  Plug 'vim-airline/vim-airline'
  Plug 'direnv/direnv.vim'
  Plug 'editorconfig/editorconfig-vim'
  let NERDTreeShowHidden=1
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'majutsushi/tagbar'
  Plug 'mhinz/vim-signify'
  " Plug 'justinmk/vim-syntax-extra'
  Plug 'sheerun/vim-polyglot'
  Plug 'w0rp/ale'
  let g:airline#extensions#ale#enabled = 1

  let g:ale_enabled = 1
  let g:ale_completion_enabled = 1
  let g:ale_completion_autoimport = 1
  set omnifunc=ale#completion#OmniFunc
      let g:ale_completion_symbols = {
          \ 'text': '',
          \ 'method': '',
          \ 'function': '',
          \ 'constructor': '',
          \ 'field': '',
          \ 'variable': '',
          \ 'class': '',
          \ 'interface': '',
          \ 'module': '',
          \ 'property': '',
          \ 'unit': 'v',
          \ 'value': 'v',
          \ 'enum': 't',
          \ 'keyword': 'v',
          \ 'snippet': 'v',
          \ 'color': 'v',
          \ 'file': 'v',
          \ 'reference': 'v',
          \ 'folder':'v',
          \ 'enum_member': 'm',
          \ 'constant': 'm',
          \ 'struct': 't',
          \ 'event': 'v',
          \ 'operator': 'f',
          \ 'type_parameter': 'p',
          \ '<default>': 'v'
          \ }
  let g:ale_sig_column_always = 0
  let g:ale_set_highlights = 1

  let g:ale_sign_error = "E"
  let g:ale_sign_warning = "W"
  "let g:ale_statusline_format = ['XXH  %d','W  %d','OK']
  "show warning/error
  let g:ale_echo_msg_error_str = "E"
  let g:ale_echo_msg_warning_str = "W"
  let g:ale_echo_msg_format = '[%linter%] %s [%serverity%]'
  "linting after save
  let g:ale_lint_on_text_changed = "never"
  let g:ale_lint_on_insert_leave = 1
  let g:ale_lint_on_enter = 1
  let g:ale_hover_to_preview = 0
  let g:ale_cursor_detail = 0
  let g:ale_c_clangd_executable = "/home/ibys/clangd_12.0.0/bin/clangd"
  let g:ale_linters = {
        \'c':['clangd'],
        \'esqlc':['clangd'],
        \'c++':['clang'],
        \}
  let g:ale_fixers = {'c': []}
  "previous warning/error
  nnoremap <leader>ap <Plug>(ale_previous_wrap)
  "previous warning/error
  nnoremap <leader>an <Plug>(ale_next_wrap)
  nnoremap <leader>ae :ALEEnable<CR>
  "Toggle linting
  nnoremap <leader>at :ALEToggle<CR>
  "show detail info
  nnoremap <leader>ad :ALEDetail<CR>

  let g:ycm_filetype_blacklist = { 'log': 1 }
  let g:ycm_filetype_whitelist = {
        \  'c': 1,
        \  'cpp': 1,
        \  'esqlc': 1,
        \  'vim': 1,
        \  'sh': 1,
        \  'bash': 1,
        \  'zsh': 1,
        \  'java': 1,
        \  'python': 1,
        \  'go': 1,
        \  '*': 1
        \ }
"  let g:ycm_semantic_triggers =  {
"        \   'c,esqlc,cpp': ['->', '.'],
"        \   'go,java,python': ['.']
"        \ }
  let g:ycm_confirm_extra_conf = 0
  "let g:ycm_key_invoke_completion = '<A-Right>'
  let g:ycm_collect_identifiers_from_tags_files = 1
  "let g:ycm_enable_diagnostic_signs = 0
  "let g:ycm_enable_diagnostic_highlighting = 0
  "Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 ./install.py --clangd-completer --go-completer --java-completer' }
  " Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

  " Always load the vim-devicons as the very last one.
  Plug 'ryanoasis/vim-devicons'

call plug#end()

" encoding
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  "set fileencodings=ucs-bom,utf-8,big5,utf-16,gb2312,gbk,gb18030,euc-jp,euc-kr,latin1
  set fileencodings=ucs-bom,utf-8,big5,gb2312,gbk,gb18030,euc-jp,euc-kr,latin1
endif

colorscheme gruvbox

set showmatch                    " Show matching brackets when closing it
set matchtime=2                  " Matching brackets highlight duration (200ms)
set scrolloff=5                  " Start to scroll when reaching lines before the edge
" set viminfo='20,\"50
set smartcase
set showcmd
set showtabline=2                " Show tab line (always)
set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*.a,*~,*.pyc,*.class,.*.swp
set laststatus=2

set number                       " Show line number
set relativenumber
set cursorline

set ignorecase
set smartcase
set incsearch
set hlsearch

if has("syntax")
  syntax enable
endif

set tabstop=4
set autoindent
set smartindent
filetype plugin on
filetype indent on

set wrap
set wrapmargin=8 " wrap lines when coming within n characters from side
set linebreak    " set soft wrapping
set showbreak=↪️
set shell=$SHELL

" toggle invisible characters
set list
" set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮,space:⋅
set listchars=tab:→\ ,trail:⋅,extends:❯,precedes:❮,space:⋅

abbr funciton function

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#fnamemod = ':p:.'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#buffer_idx_format = {
      \ '0': '0 ', '1': '1 ', '2': '2 ', '3': '3 ',
      \ '4': '4 ', '5': '5 ', '6': '6 ', '7': '7 ',
      \ '8': '8 ', '9': '9 '
      \}
let g:airline#extensions#tabline#tabtitle_formatter = 'MyTabTitleFormatter'
function MyTabTitleFormatter(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let bufnr = buflist[winnr - 1]
  let winid = win_getid(winnr, a:n)
  let title = fnamemodify(bufname(bufnr), ":t")

  if empty(title)
    if getqflist({'qfbufnr' : 0}).qfbufnr == bufnr
      let title = '[Quickfix List]'
    elseif winid && getloclist(winid, {'qfbufnr' : 0}).qfbufnr == bufnr
      let title = '[Location List]'
    else
      let title = '[No Name]'
    endif
  endif

  return title
endfunction

let g:airline#extensions#fzf#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 2
let g:airline#extensions#whitespace#checks = [ 'indent', 'trailing', 'conflicts' ]
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <A-1> <Plug>AirlineSelectTab1
nmap <A-2> <Plug>AirlineSelectTab2
nmap <A-3> <Plug>AirlineSelectTab3
nmap <A-4> <Plug>AirlineSelectTab4
nmap <A-5> <Plug>AirlineSelectTab5
nmap <A-6> <Plug>AirlineSelectTab6
nmap <A-7> <Plug>AirlineSelectTab7
nmap <A-8> <Plug>AirlineSelectTab8
nmap <A-9> <Plug>AirlineSelectTab9
nmap <A-h> <Plug>AirlineSelectPrevTab
nmap <A-l> <Plug>AirlineSelectNextTab

set timeoutlen=300
exec "set <A-1>=\e1"
exec "set <A-2>=\e2"
exec "set <A-3>=\e3"
exec "set <A-4>=\e4"
exec "set <A-5>=\e5"
exec "set <A-6>=\e6"
exec "set <A-7>=\e7"
exec "set <A-8>=\e8"
exec "set <A-9>=\e9"
exec "set <A-h>=\eh"
exec "set <A-l>=\el"
exec "set <A-j>=\ej"
exec "set <A-k>=\ek"
exec "set <A-m>=\em"
exec "set <A-n>=\en"
exec "set <A-p>=\ep"
exec "set <A-t>=\et"

nnoremap <F12>     :ALEGoToDefinition<CR>
nnoremap <A-j>     :m .+1<CR>==
nnoremap <A-k>     :m .-2<CR>==
inoremap <A-j>     <Esc>:m .+1<CR>==gi
inoremap <A-k>     <Esc>:m .-2<CR>==gi
nnoremap <space>   :set hlsearch! hlsearch?<CR>
nnoremap <leader>w :w!<CR>
nnoremap <leader>q :q!<CR>
nnoremap <A-t>     :TagbarToggle<CR>
nnoremap <A-n>     :NERDTreeToggle %:p:h<CR>
nnoremap <A-m>     :call SwitchMouseMode()<CR>
nnoremap <A-p>     :call SwitchPlainMode()<CR>

" Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

function SwitchMouseMode()
  if (&mouse == "a")
    let &mouse = ""
    echo "Mouse disabled."
  else
    let &mouse = "a"
    echo "Mouse enabled."
  endif
endfunction

function SwitchPlainMode()
  if (&number == 1)
    set nonumber
    set norelativenumber
    set nolist
    let &showbreak = ""
    SignifyDisable
    echo "Plain mode on"
  else
    set number
    set relativenumber
    set list
    set showbreak=↪
    SignifyEnable
    echo "Plain mode off"
  endif
endfunction

" go to last cursor position after reopening a file
if has("autocmd")
  augroup go_to_last_cursor_pos
  autocmd!
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  augroup END
endif

"set path+=$ORACLE_HOME/sdk/include
"set path+=/usr/lib/gcc/x86_64-linux-gnu/9/include
"let &path=&path.",".&currFilepath."/**;source"
"let &path=&path.",".expand("%:p:h")."/**;**/source"
"set path+=$SRC_PATH/**
"set tags+=$TAG_FILE
