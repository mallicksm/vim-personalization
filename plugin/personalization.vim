" personalization.vim: - Personalization Vim
" Maintainer: Soummya Mallick
" Version:    2.0
"

"gruvbox
if has("gui_running")
   colorscheme gruvbox
else
   colorscheme default
   set mouse=a
endif
set bg=dark
let g:gruvbox_contrast_dark = 'hard'

" Initial Essential
let mapleader = ','

" Autocmd on entring buffer
set path+=debug/**,compile/**,design/**,pal_ice/**,ptm_ice/**,~/dotfiles/**,~/.vim/**


" Essential sets
set expandtab
set hlsearch
set nobackup noswapfile   "disable ~ and .swp file backup feature
set foldmethod=marker
set linebreak formatoptions=1 showbreak=>>>
set ignorecase smartcase
set tabstop=3 shiftwidth=3
set nowrap
set wildignore+=*.a,*.o,.git,.svn*.tmp
set showcmd
set splitbelow splitright "Logical splitting
set vb t_vb= "No bells, no flashes

" Usefull Leader Maps
map <F7> gg=G<C-o><C-o>
nnoremap <leader>r  :e!<CR>
nnoremap <leader>n  <C-w>ww
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-t> :tabn<CR>
tnoremap <C-h> <C-w>h
tnoremap <C-l> <C-w>l
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
tnoremap <C-\> <C-w>:vert term ++close<CR>
tnoremap <leader><C-\> <C-w>:term ++close<CR>
nnoremap <leader><C-\> :term ++close<CR>
nnoremap <C-\> :vert term ++close<CR>
call submode#enter_with('vgrow/vshrink', 'n', '', '<leader>l', '<ESC>:vertical res -1<CR>')
call submode#enter_with('vgrow/vshrink', 'n', '', '<leader>h', '<ESC>:vertical res +1<CR>')
call submode#map('vgrow/vshrink', 'n', '', 'l', '<ESC>:vertical res -1<CR>')
call submode#map('vgrow/vshrink', 'n', '', 'h', '<ESC>:vertical res +1<CR>')
let g:submode_timeout = 0
let g:submode_keep_leaving_key = 1
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv
nnoremap <leader>q  <ESC>:q<CR>
nnoremap <leader>c  <ESC>:q<CR>
nnoremap <leader>x  :noh<CR>
nnoremap <leader>w  :set wrap!<CR>
nnoremap <leader>gf  viW<C-w>gf
nnoremap <leader>sf  viW<C-w>f
nnoremap <leader>vf :vertical wincmd f<CR>
nnoremap <leader>s  :source $MYVIMRC<CR>
nnoremap <expr> <leader><leader>c getline('.') =~# '^#' ? '0x' : '0i#<ESC>'
nnoremap j           gj
nnoremap k           gk
nnoremap >          >gv
nnoremap <          <gv
command! Difft NERDTreeClose | windo diffthis
command! Diffo NERDTreeToggle | diffoff!
inoremap jk <ESC>
let @f = expand('%:t')
let @g = expand('%:p')

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-tab>"

" Vimwiki Settings
let g:vimwiki_automatic_nested_syntaxes = 1
let g:vimwiki_dir_link = 'index'
let g:vimwiki_links_space_char = '_'
   " wiki
nmap <leader>ww <Plug>VimwikiIndex<CR>
nmap <leader>wi <Plug>VimwikiUISelect
nmap <leader>wd <Plug>VimwikiDeleteFile
nmap <leader>wr <Plug>VimwikiRenameFile
   " Diary
nmap <leader>dw <Plug>VimwikiDiaryIndex<CR>
nmap <leader>di <Plug>VimwikiDiaryIndex<CR>\w\i
nmap <leader>dn <Plug>VimwikiMakeDiaryNote<CR>
nmap <leader>dt <Plug>VimwikiMakeTomorrowDiaryNote<CR>
nmap <leader>dy <Plug>VimwikiMakeYesterdayDiaryNote<CR>
   " Vimwiki lists
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/work/'
let wiki_1.index = 'index'
let wiki_1.nested_syntaxes = {'python': 'python', 'c': 'cpp'}
let wiki_1.auto_toc = 1

let wiki_2 = {}
let wiki_2.path = '~/vimwiki/personal/'
let wiki_2.index = 'index'
let wiki_2.nested_syntaxes = {'python': 'python', 'c': 'cpp'}
let wiki_2.auto_toc = 1
let g:vimwiki_list = [wiki_1, wiki_2]

au bufenter * :call vimwiki#vars#init()
let g:vimwiki_sync_branch = "master"

" vim-signify
set updatetime=100
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_time = '_'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count        = 0
let g:signify_sign_show_text         = 1
nnoremap <leader>d  :SignifyDiff<CR>

" Nerdtree Settings
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>
let NERDTreeNodeDelimiter = "\t"
let g:NERDTreeWinSize=40
let NERDTreeIgnore=['\.svn$', '\.git$', '\.d$', '\.o$']
let NERDTreeBookmarksSort=1
let g:NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeGlyphReadOnly = "RO"
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['qel'] = s:aqua " sets the color of qel files to aqua
let g:NERDTreeExtensionHighlightColor['tcl'] = s:aqua
let g:NERDTreeExtensionHighlightColor['tdf'] = s:lightGreen
let g:NERDTreeExtensionHighlightColor['v'] = s:salmon
let g:NERDTreeExtensionHighlightColor['sv'] = s:salmon
let g:NERDTreeExtensionHighlightColor['svh'] = s:salmon
let g:NERDTreeExtensionHighlightColor['f'] = s:rspec_red
let g:NERDTreeExtensionHighlightColor['h'] = s:rspec_red
let g:NERDTreeExtensionHighlightColor['S'] = s:lightGreen
let g:NERDTreeExtensionHighlightColor['asm'] = s:orange

"indentLine
let g:indentLine_char = '┆'
nnoremap <leader>i :IndentLinesToggle<CR>

"AirlineTheme
let g:airline_theme='luna'
let g:airline_section_y=""
let g:airline#extensions#tabline#enabled = 1
