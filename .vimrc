" This needs to be the very first line to make
" menu items in gvim to be in the correct encoding
"set langmenu=uk_UA.cp1251
"lan mes uk_UA.cp1251
set nocompatible
set encoding=utf-8
" set termguicolors
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

call plug#begin('~/.vim/plugged')

"/ File browsing
"Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'

"/ Search and replace
Plug 'rking/ag.vim'
" Plug 'skwp/greplace.vim'
" Plug 'brooth/far.vim'
Plug 'dkprice/vim-easygrep'

"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
"Plug 'garbas/vim-snipmate'

"/ Faster editing tools
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/loremipsum'

"/ Autocompletion
Plug 'Valloric/YouCompleteMe'
"Plug 'ervandew/supertab'           "Made the choice to use YouCompleteMe

"/ ale
" asynchronous lint engine for show errors/warnings in the gutter
Plug 'w0rp/ale'
Plug 'ngmy/vim-rubocop'

"/ Syntax support
Plug 'kchmck/vim-coffee-script'
Plug 'noc7c9/vim-iced-coffee-script'
Plug 'digitaltoad/vim-pug'
Plug 'wavded/vim-stylus'
Plug 'slim-template/vim-slim'

"/ Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

"/ Rspec
Plug 'thoughtbot/vim-rspec'

"/ Vim status line with git branch support through vim-fugitive
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"/ Quick comment
Plug 'scrooloose/nerdcommenter'

"/ Seamless moving between vim and tmux panels
Plug 'christoomey/vim-tmux-navigator'

"/ Dispatch for starting tests in another window
" Plug 'tpope/vim-dispatch'

"/ Trying to run specs with Tslime
Plug 'jgdavey/tslime.vim'

"/ Gruvbox theme
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'

"/ File icons
Plug 'ryanoasis/vim-devicons'

"/ File icons highlight
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

call plug#end()

syntax enable
"set listchars+=space:␣
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
set list
set lcs+=space:·
let mapleader = ',' "Swaps default backspace leader with comma
set number	    "Let's activate line numbers
set complete=.,w,b,u 	"Set desired autocompletion options

"---------Switching between modes-----------"
" Switch to normal mode by double ;;
"nmap ;; <esc>
imap ;; <esc>
vmap ;; <esc>
"
"---------Inserting new line without entering the insert mode-----------"
nmap <S-Enter> O<esc>
nmap <cr> o<esc>

"---------Ignored files and folders---------"
set wildignore+=*\\tmp\\*,*\\node_modules\\*,*.swp,*.zip,*.exe  " Windows

"---------Visuals-------"
"set t_Co=256
" colorscheme Tomorrow-Night-Eighties
"colorscheme elflor
" colorscheme gruvbox
" let g:onedark_termcolors=256
" let g:onedark_termcolors=16
colorscheme onedark
"/higlight line length more than 80 chars
set cc=80
" set term=screen-256color
"set guifont=Fira_Mono_for_Powerline:h11
"set guifont=Fira_Code:h11
set guioptions-=e
"set macligatures

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

" Set indentation
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab
set smartindent

" Set folding
set foldmethod=indent
set nofoldenable

" Custom padding from the left
"hi LineNr guibg=bg
"hi LineNr ctermbg=bg
"set foldcolumn=2
"hi foldcolumn guibg=bg
"hi foldcolumn ctermbg=bg

"hi vertsplit ctermfg=white ctermbg=bg

"hi LineNr guibg=lightgrey

"---------Search---------"
set hlsearch
set incsearch
set ignorecase smartcase                "For case-insensitive search

"---------Split Management---------"
set splitbelow
set splitright


nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-h> <C-w><C-h>
nmap <C-l> <C-w><C-l>

"---------Mappings---------"

" Make it easy to edit the Vimrc file.
nmap <Leader>ev :tabedit $MYVIMRC<cr>

"Add simple highlight remover"
nmap <Leader><space> :nohlsearch<cr>

"Map NERDTree easier to toggle"
"set balloondelay=1
"setlocal balloonexpr=
"set noballooneval
nmap <S-tab> :NERDTreeToggle<cr>

"Map CtrlPBufTag to open"
nmap <c-R> :CtrlPBufTag<cr>

"Map CtrlPMRUFiles"
nmap <c-E> :CtrlPMRUFiles<cr>

"Map ,f to show ctags search"
nmap <Leader>f :tag<space>

" Show hidden files
let NERDTreeShowHidden=1

" Bind ctags -R with meaningful excludings
" nmap <Leader>ct :!ctags -R --exclude .git --exclude log --exclude public --exclude tmp --exclude node_modules<cr>
nmap <Leader>ct :!ctags -R --exclude .git --exclude log --exclude public --exclude tmp<cr>
" it could be worth to also have the above started on comitting using git hook

"---------Plugins--------------"
"/
"/ CtrlP
"/
let g:ctrlp_custom_ignore = 'node_modules\DS_Store\|git'
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30,results:30'
" the next is used to autoreload newly added files
" i.e. with the help of Rails generators
" no need to press F5
let g:ctrlp_use_caching=0

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0
"Change +/~ toggle dir content to arrows
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'

"/
"/ Ag.vim
"/
let g:ag_working_path_mode="r"

"/
"/ Gsearch
"/
" set grepprg=ag
" let g:grep_cmd_opts = '--line-number'

"/
"/ Vim-Easygrep
"/
let g:EasyGrepCommand="ag"
" set grepprg=ag\ --nocolor\ --nogroup\ --column

"/
"/ YouCompleteMe
"/
let g:ycm_min_num_of_chars_for_completion = 2

"/
"/ EasyMotion
"/
"nmap <c-;> <Plug>(easymotion-s)
nmap <Leader>s <Plug>(easymotion-s)
hi EasyMotionTarget ctermbg=yellow ctermfg=black
"hi EasyMotionTarget guibg=yellow guifg=black
"hi link EasyMotionTarget ErrorMsg

"/
" Multiple cursors
"/
"let g:multi_cursor_next_kye='<C-d>'
let g:multi_cursor_prev_key='<C-z>'
"let g:multi_cursor_skip_key='<C-x>'
"let g:multi_cursor_quit_key='<C-;>'

"/
" Ale
"/
hi clear SignColumn
"Symbols for showing errors/warning are typed like
"<Ctrl-Q>u<4 unicode symbols>, these are 2326, 25cf, 25b6
"⌦ ● ▶

"let g:ale_sign_column_always=1
"let g:ale_set_loclist=1
"let g:ale_set_quickfix=1
"let g:ale_open_list=1
nmap <silent> <A-k> <Plug>(ale_previous_wrap)
nmap <silent> <A-j> <Plug>(ale_next_wrap)
"let g:ale_sign_error = '⨉'
let g:ale_sign_error = '●'
"let g:ale_sign_error = '⌦'
"let g:ale_sign_warning = '⚠'
let g:ale_sign_warning = '▶'
"let g:ale_statusline_format=['⨉ %d', '⚠ %d', 'ok']
let g:ale_statusline_format=['● %d', '▶ %d', 'ok']
"/
" RuboCop
"/
nmap <Leader>r :RuboCop<cr>
"let g:vimrubocop_config = '%USERPROFILE%/rubocop.yml'

"/
" RSpec.vim mappings
"/
nmap <Leader>tt :call RunCurrentSpecFile()<cr>
nmap <Leader>ts :call RunNearestSpec()<cr>
nmap <Leader>tl :call RunLastSpec()<cr>
nmap <Leader>ta :call RunAllSpecs()<cr>

"/
" Dispatch mappings
"/
" let g:rspec_command = "Dispatch rspec {spec}"
let g:rspec_command = 'call Send_to_Tmux("rspec {spec}\n")'

"/
" LightLine
"/
set laststatus=2
let g:lightline = {
  \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

"/
" Vim-Airline
"/
" let g:airline_theme='onedark'
let g:airline_theme='badwolf'
" let g:airline_theme='gruvbox'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1

function! AirlineInit()
  let g:airline_section_b = airline#section#create(['branch', ' ', 'hunks'])
  let g:airline_symbols.branch = ''
  let g:airline_section_z = airline#section#create(['%3p%% ', ' %l', 'maxlinenr', ' : %c', ' '])
endfunction
autocmd VimEnter * call AirlineInit()

"/
" NerdCommenter
"/
" Add one space after comment symbol
let g:NERDSpaceDelims = 1

"/
" Vim-devicons
"/
let g:WebDevIconsNerdTreeAfterGlyphPadding=' '
"let g:WebDevIconsUnicodeDecorateFolderNodes=1
"let g:DevIconsEnableFolderOpenClose=1

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
" let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
let g:WebDevIconsUnicodeDecorateFolderNodesDefaultSymbol = ''
" let g:DevIconsDefaultFolderOpenSymbol = ''
let g:DevIconsDefaultFolderOpenSymbol = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['haml'] = ''

"suggesed plugin https://github.com/tiagofumo/vim-nerdtree-syntax-highlight
" really slooooooows down nerdtree
"so the rest of configuration lines for vim-devicons coloring are taken from
" https://github.com/ryanoasis/vim-devicons/issues/158 by zeorin and his config
" https://github.com/zeorin/dotfiles/blob/e01cebf/.vimrc#L864-L900

if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif
augroup devicons
  autocmd!
  autocmd FileType nerdtree setlocal nolist
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\]" contained conceal containedin=ALL
  autocmd FileType nerdtree syntax match hideBracketsInNerdTree "\[" contained conceal containedin=ALL
  autocmd FileType nerdtree setlocal conceallevel=3
  autocmd FileType nerdtree setlocal concealcursor=nvic
augroup END

let g:sol = {
			\"gui": {
				\"base03": "#002b36",
				\"base02": "#073642",
				\"base01": "#586e75",
				\"base00": "#657b83",
				\"base0": "#839496",
				\"base1": "#93a1a1",
				\"base2": "#eee8d5",
				\"base3": "#fdf6e3",
				\"yellow": "#b58900",
				\"orange": "#cb4b16",
				\"red": "#dc322f",
				\"magenta": "#d33682",
				\"violet": "#6c71c4",
				\"blue": "#268bd2",
				\"cyan": "#2aa198",
				\"green": "#719e07"
			\},
			\"cterm": {
				\"base03": 8,
				\"base02": 0,
				\"base01": 10,
				\"base00": 11,
				\"base0": 12,
				\"base1": 14,
				\"base2": 7,
				\"base3": 15,
				\"yellow": 3,
				\"orange": 9,
				\"red": 1,
				\"magenta": 5,
				\"violet": 13,
				\"blue": 4,
				\"cyan": 6,
				\"green": 2
			\}
\}

function! DeviconsColors(config)
  let colors = keys(a:config)
  augroup devicons_colors
    autocmd!
    for color in colors
      if color == 'normal'
        exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
          \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
          \ 'else | '.
          \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
          \ 'endif'
      elseif color == 'emphasize'
        exec 'autocmd FileType nerdtree,startify if &background == ''dark'' | '.
          \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base1.' ctermfg='.g:sol.cterm.base1.' | '.
          \ 'else | '.
          \ 'highlight devicons_'.color.' guifg='.g:sol.gui.base01.' ctermfg='.g:sol.cterm.base01.' | '.
          \ 'endif'
      else
        exec 'autocmd FileType nerdtree,startify highlight devicons_'.color.' guifg='.g:sol.gui[color].' ctermfg='.g:sol.cterm[color]
      endif
      exec 'autocmd FileType nerdtree,startify syntax match devicons_'.color.' /\v'.join(a:config[color], '|').'/ containedin=ALL'
    endfor
  augroup END
endfunction
" \'normal': ['', '', '', '', ''],
let g:devicons_colors = {
  \'normal': ['', ''],
  \'emphasize': ['', '', '', '', '', '', '', '', '', '', ''],
  \'yellow': ['', '', ''],
  \'orange': ['', '', '', 'λ', '', '', ''],
  \'red': ['', '', '', '', '', '', '', '', ''],
  \'magenta': [''],
  \'violet': ['', '', '', ''],
  \'blue': ['', '', '', '', '', '', '', '', '', '', '', '', ''],
  \'cyan': ['', '', '', ''],
  \'green': ['', '', '', '']
\}
call DeviconsColors(g:devicons_colors)

"---------Auto-Commands---------"
" Automatically source the Vimrc file on save.
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END

" Notes and Tips
" - Press 'zz' to instantly center the line where the cursor is located.
" - Press 'Ctrl+]' to go to the method's under the cursor definition
" - Press 'Ctrl+^' to go to the previous cursor position
"
" folding shortcuts
" zo -> open fold under cursor
" zO -> open all folds under cursor
" zc -> close...
" zC -> close all ...
" za -> toggle open/close
" zA -> toggle all open/close under cursor
" zm -> increase fold level by 1
" zM -> close all open folds
" zr -> decrease fold level by 1
" zR -> decrease fold level to 0 (all folds open)
"
" ctags quick access
" Ctrl+] -> go to method/class definition under cursor
" Ctrl+6 -> go to the previous cursor position after that

" toggle case
" ~ -> on visually selected toggles case or toggles current character
" U -> on visually selected makes it uppercase
" u -> lower case
" 3~ -> toggles case of the next 3 chars
" g~3w -> toggles next 3 words
" g~iw -> toggles current(inside) word
" gUU -> current line to uppercase, same as VU
" guu -> current line to lowercase, same as Vu
