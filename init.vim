" NEOVIM CONFIG
"

let mapleader = " "
set t_Co=128


" ---------------------
" ------VIM-PLUG-----
" ---------------------
call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'itchyny/lightline.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'bronson/vim-trailing-whitespace'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'APZelos/blamer.nvim'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}

call plug#end()

"========================
" End vim plug ----------
"========================

" Enable Blamer
let g:blamer_enabled = 1

" Enable filetype plugins (nerdcommenter)
filetype plugin on

" Auto refresh buffers when file changes externally
set autoread

"" Set sweet current line underline
" set cursorline

" Relative numbers are useful and cool
set number relativenumber

" Themes
set termguicolors
" colorscheme base16-default-dark
" colorscheme gruvbox
colorscheme molokai
" Let colorscheme match original monokai bg color
" let g:molokai_original = 1

"Let jj escape out of insert mode
inoremap jj <ESC>

" Enable scrolling with mouse
" set mouse=a
" set ttymouse=sgr

" Remap homerow movement keys for colemak
" noremap n j
" noremap e k
" noremap i l
" Remap a few others as well to account for colemak
" noremap k n
" noremap f e
" noremap u i
" noremap l u

" enable powerline fonts
"let g:airline_powerline_fonts = 1

" gui options
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar

" close buffer
nmap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
" close all buffers
nmap <leader>D :bufdo bd<CR>

" Switch between buffers
" noremap <S-tab> :bp<CR>
" noremap <tab> :bn<CR>

" open a new tab with ctrl t
nnoremap <C-t> :tabnew<CR>

" cycle tabs left and right with ctrl
nnoremap <C-h> :tabp<CR>
nnoremap <C-l> :tabn<CR>

" move between splits with leader
nnoremap <leader>w <c-w>

" vim-trailing-whitespace
nnoremap <leader>f :FixWhitespace<CR>


" Allow vim-polyglot to load syntax files
syntax on

" ---------------------
" ------Tab behavior---
" ---------------------
" length of an actual \t character:
set tabstop=2
" length to use when editing text (eg. TAB and BS keys)
" (0 for ‘tabstop’, -1 for ‘shiftwidth’):
set softtabstop=-1
" length to use when shifting text (eg. <<, >> and == commands)
" (0 for ‘tabstop’):
set shiftwidth=0
" round indentation to multiples of 'shiftwidth' when shifting text
" (so that it behaves like Ctrl-D / Ctrl-T):
set shiftround
" if set, only insert spaces; otherwise insert \t and complete with spaces:
set expandtab

" Supertab - Overide default cycle through auto complete in reverse
let g:SuperTabDefaultCompletionType = "<c-n>"
" ---------------------
" --------COC----------
" ---------------------
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)

" COC Prettier settup
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>a  <Plug>(coc-format-selected)
nmap <leader>a  <Plug>(coc-format-selected)



" ---------------------
" ------GIT-GUTTER-----
" ---------------------
" For faster updates of Git Gutter
set updatetime=100

" Gutter colours
highlight clear SignColumn
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1


" ---------------------
" ------NERDTREE-------
" ---------------------
nnoremap <Leader>n :NERDTreeToggle<CR>

" ---------------------
" ----NERDCOMMENTER--__
" ---------------------
" add spacing to NERDCommenter
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left
let g:NERDDefaultAlign = 'left'
map <Leader>/ <Plug>NERDCommenterToggle

" ---------------------
" ------FZF/RIPGREP----
" ---------------------
nnoremap <leader>p :Files<CR>
nnoremap <leader>r :Rg


" ---------------------
" ------ACK/AG---------
" ---------------------

" Use ag for ack if you gots it
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" \a to Ack (search in files)
" nnoremap <leader>a :Ack

" Auto walk through previews
let g:ackpreview = 1


" ---------------------
" ------SYNTASTIC------
" ---------------------

" Disable 'assigned but unused variable' warnings
" let g:syntastic_quiet_messages = { "regex": 'assigned >

" Configure linters
" let g:syntastic_coffee_checkers = ['coffeelint']
" let g:syntastic_coffee_coffeelint_args = '--csv --file />
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_eslint_args = '-c /home/kix/P>
" let g:syntastic_sass_checkers = ['sasslint']
" let g:syntastic_scss_checkers = ['sasslint']
" let g:sass_lint_config = '/home/kix/Projects/thinkCERCA/>


" --------------------
" -------CTRL-P-------
" --------------------
" No file limit
" let g:ctrlp_max_files=0

" Use .gitignore/.hgignore files if present
" let g:ctrlp_user_command = {
"   \ 'types': {
"     \ 1: ['.git', 'cd %s && git ls-files --cached --excl>
"     \ 2: ['.hg', 'hg --cwd %s locate -I .'],
"     \ },
"   \ 'fallback': 'find %s -type f'
"   \ }


" --------------------
" ---RAINBOW-PARENS---
" --------------------
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces


" --------------------
" --------UNDO--------
" --------------------

set undofile
set undodir=$HOME/.vim/.undo

set undolevels=1000
set undoreload=10000
