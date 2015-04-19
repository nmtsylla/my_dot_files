vnoremap < <gv
vnoremap > >gv

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

let mapleader = ","

set bs=2     " make backspace behave like normal again show git diff in window split when commiting
autocmd FileType gitcommit DiffGitCached | wincmd p

" replace autocomplete from C-n to Tab
function! SuperTab()
	if (strpart(getline('.'),col('.')-2,1)=~'^\W\?$')
		return "\<Tab>"
	else
		return "\<C-n>"
	endif
endfunction
imap <Tab> <C-R>=SuperTab()<CR>

"resize split when window is resized
au VimResized * exe "normal! \<c-w>="

"save file on focus lost
au FocusLost * :wa

"map ; to : they'll have the same behaviour 
nnoremap ; :

"quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" Quick quit command
noremap <Leader>l :quit<CR>  " Quit current window
noremap <Leader>L :qa!<CR>   " Quit all windows

" map sort function to a key
vnoremap <Leader>s :sort<CR>

"
" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase


" " Disable stupid backup and swap files - they trigger too many events
" " for file system watchers
set nobackup
set nowritebackup
set noswapfile

" Pathogen load
filetype off
" mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
"

call pathogen#infect()
call pathogen#helptags()

"filetype plugin indent on
"syntax on

" #######################################################################
" 
"                       PYTHON IDE SETUP
"
" #####################################################################"

"
" Settings for vim-powerline
" " cd ~/.vim/bundle
" " git clone git://github.com/Lokaltog/vim-powerline.git
set laststatus=2
"
"
" Settings for ctrlp
" " cd ~/.vim/bundle
" " git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
"
"
" Settings for python-mode
" " Note: I'm no longer using this. Leave this commented out
" " and uncomment the part about jedi-vim instead
" " cd ~/.vim/bundle
" " git clone https://github.com/klen/python-mode
"map <Leader>g :call RopeGotoDefinition()<CR>
"let ropevim_enable_shortcuts = 1
"let g:pymode_rope_goto_def_newwin = "vnew"
"let g:pymode_rope_extended_complete = 1
"let g:pymode_breakpoint = 0
"let g:pymode_syntax = 1
"let g:pymode_syntax_builtin_objs = 0
"let g:pymode_syntax_builtin_funcs = 0
"map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"
" Settings for jedi-vim
" " cd ~/.vim/bundle
" " git clone git://github.com/davidhalter/jedi-vim.git
" " cd ~/.vim/bundle/ && git clone --recursive https://github.com/davidhalter/jedi-vim.git
"
let g:jedi#usages_command = "<leader>z"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>
"
" " Better navigating through omnicomplete option list
" " See
" import ipdb; ipdb.set_trace() # BREAKPOINT
" http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
     if pumvisible()
         if a:action == 'j'
             return "\<C-N>"
        elseif a:action == 'k'
             return "\<C-P>"
         endif
     endif
     return a:action
endfunction
"
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>
"
"
" " Python folding
" " mkdir -p ~/.vim/ftplugin
" " wget -O ~/.vim/ftplugin/python_editing.vim
" http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable


"colorscheme badwolf
" Make the gutters darker than the background.
"let g:badwolf_darkgutter = 1

"" Turn off HTML link underlining
"let g:badwolf_html_link_underline = 0

" Turn on CSS properties highlighting
"let g:badwolf_css_props_highlight = 1



map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h


syntax on                           " syntax highlighing
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview



nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>
" " buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>



set foldmethod=indent
set foldlevel=99


map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
let g:pep8_map='<leader>8'

set completeopt=menuone,longest,preview
map <leader>n :NERDTreeToggle<CR>
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
nmap <leader>a <Esc>:Ack!
                



