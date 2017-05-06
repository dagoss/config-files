set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'chrisbra/csv.vim'
Plugin 'othree/html5.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'tomasr/molokai'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kchmck/vim-coffee-script'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'henrik/vim-indexed-search'
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'plasticboy/vim-markdown'
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-surround'
Plugin 'aperezdc/vim-template'
Plugin 'airblade/vim-gitgutter'
Plugin 'dag/vim-fish'
Plugin 'dagoss/vim-pug'
call vundle#end()            " required
filetype plugin indent on    " required

set laststatus=2
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

set enc=utf-8
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set t_Co=256

map 0 ^
map <leader>tnew :tabnew<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabmove<cr>
" use left/right for switching buffers
map <right> <ESC>:bn<RETURN>
map <left> <ESC>:bp<RETURN>
inoremap jj <ESC>
nnoremap j gj
nnoremap k gk
" space will toggle folds
nnoremap <space> za
" use semi-colon for commands
noremap ; :

runtime macros/matchit.vim
syntax enable
set wrap
set linebreak "wraps at word level, not character level
set tabstop=2
set shiftwidth=2
set expandtab
set textwidth=9999
set nobackup
set nowb
set noswapfile
set hlsearch
set wildmenu
set hidden " allow changing buffers without saving
"set cursorline
set cursorcolumn
highlight LineNr ctermfg=grey
set number
set spell
set ai "Auto indent
set si "Smart intend
set incsearch "search while typing
set smarttab
set showmatch
set lazyredraw
" set ignorecase
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set scrolloff=5 "Scroll off
set ruler
set cmdheight=2
set nobackup
set background=dark
colorscheme molokai

function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	en
	return ''
endfunction

iabbrev speciment specimen
iabbrev Speciment Specimen

" associate a filetype with docbook and txt files
au BufNewFile,BufRead *.docbook setlocal ft=xml
au BufNewFile,BufRead *.txt setlocal ft=markdown
au BufRead,BufNewFile *.scss set filetype=scss.css

" vim-json
"if v:version >= 700
"	try
"		let g:vim_json_syntax_conceal = 0
"	catch
"	endtry
"endif

" vim-markdown
if v:version >= 700
	try
		let g:vim_markdown_folding_disabled = 1
		let g:vim_markdown_frontmatter = 1
		" next command assumes pencil plugin is installed
		autocmd FileType md SoftPencil
	catch
	endtry
endif



" for syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" for templates
let g:templates_no_autocmd = 1

" vim-airline
if v:version >= 700
	try
		let g:airline#extensions#tabline#enabled = 1
		let g:airline_section_b = '%{strftime("%c")}'
		let g:airline_section_y = 'BN: %{bufnr("%")}'
	catch
	endtry
endif
