" personalization.vim: - Personalization Vim
" Maintainer: Soummya Mallick
" Version:    2.0
"

"gruvbox
if has("gui_running")
   colorscheme gruvbox
else
   colorscheme darkblue
   set mouse=a
endif
set bg=dark
let g:gruvbox_contrast_dark = 'hard'

" Initial Essential
let mapleader = ','

" Autocmd on entring buffer
"autocmd BufEnter * silent! lcd %:p:h
set path+=debug/**,compile/**,design/**,pal_ice/**,ptm_ice/**


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
nnoremap <leader>r  :e!<cr>
nnoremap <leader>n  <C-w>ww
nnoremap <leader>h  <C-w>h
nnoremap <leader>l  <C-w>l
nnoremap <leader>j  <C-w>j
nnoremap <leader>k  <C-w>k
nnoremap <S-h>  <C-w>h
nnoremap <S-l>  <C-w>l
nnoremap <S-j>  <C-w>j
nnoremap <S-k>  <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <leader>q  <ESC>:q<cr>
nnoremap <leader>x  <ESC>:wq<cr>
nnoremap <leader>w  :set wrap!<CR>
nnoremap <leader>gf  viW<C-w>gf
nnoremap <leader>sf  viW<C-w>f
nnoremap <leader>vf :vertical wincmd f<CR>
nnoremap <leader>s  :source $MYVIMRC<CR>
vnoremap //          y/<C-R>"<CR>
nnoremap j           gj
nnoremap k           gk
nnoremap >          >gv
nnoremap <          <gv
command! Difft NERDTreeClose | windo diffthis
command! Diffo NERDTreeToggle | diffoff!
nnoremap <leader>d  :Difft<CR>
nnoremap <leader>dd :Diffo<CR>
let @f = expand('%:t')
let @g = expand('%:p')

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-tab>"

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
