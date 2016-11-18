execute pathogen#infect()
syntax enable
set t_Co=256
colorscheme darcula
filetype plugin indent on

" Set soft-tab (4 spaces) for all files, and soft-tab (2 spaces) for html 
autocmd FileType * setlocal softtabstop=4 shiftwidth=4 expandtab
autocmd FileType html setlocal tabstop=2 shiftwidth=2 noexpandtab

" Set hard tab for make files
autocmd FileType make setlocal noexpandtab

nmap <silent> <C-t> :tabnew<CR>
nmap <silent> <C-F4> :tabclose<CR>
imap <silent> <C-t> <esc><C-t>
imap <silent> <C-F4> <esc><C-F4>

" To open files in the same directory as the current file
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,vs :vsplit <C-R>=expand("%:p:h") . "/" <CR>

" Open NERDTree automatically if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree automatically when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Map CTRL+N to open/close NERDTree
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window left open is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" To open a list of numbered buffers and choose a buffer by number or name
nnoremap <F5> :buffers<CR>:buffer<Space>

" To be able to use <Tab> to show a useful list of buffers
set wildchar=<Tab> wildmenu wildmode=full
