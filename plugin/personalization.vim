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
set relativenumber
set encoding=utf-8

" Usefull Leader Maps
function FullRefresh()
   :e!
   :NERDTreeRefreshRoot
endfunction

map <F7> gg=G<C-o><C-o>                        "format current file
nnoremap <leader>r  :call FullRefresh()<CR>
nnoremap <leader>n  <C-w>ww
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-t> :tabnew<CR>
nnoremap <leader>\| :vsplit<CR>
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>
nnoremap <leader>_ :split<CR>
nnoremap <leader>1 :tabnext 1<CR>
nnoremap <leader>2 :tabnext 2<CR>
nnoremap <leader>3 :tabnext 3<CR>
nnoremap <leader>4 :tabnext 4<CR>
nnoremap <leader>5 :tabnext 5<CR>
if v:version > 800
   tnoremap <C-h> <C-w>h
   tnoremap <C-l> <C-w>l
   tnoremap <C-j> <C-w>j
   tnoremap <C-k> <C-w>k
   tnoremap <C-t> <C-w>:tabnew<CR>
   tnoremap <leader>- <C-w>:term ++close<CR>
   tnoremap <leader>_ <C-w>:term ++close<CR>
   tnoremap <leader>\| <C-w>:vert term ++close<CR>
   tnoremap <leader>\ <C-w>:vert term ++close<CR>
endif
nnoremap <leader><leader>\| :vert term ++close<CR>
nnoremap <leader><leader>\ :vert term ++close<CR>
nnoremap <leader><leader>- :term ++close<CR>
nnoremap <leader><leader>_ :term ++close<CR>
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
let wiki_1.auto_export = 1

let wiki_2 = {}
let wiki_2.path = '~/vimwiki/personal/'
let wiki_2.index = 'index'
let wiki_2.nested_syntaxes = {'python': 'python', 'c': 'cpp'}
let wiki_2.auto_toc = 1
let g:vimwiki_list = [wiki_1, wiki_2]

function! VimwikiLinkHandler(link)
   " Use Vim to open external files with the 'vfile:' scheme.  E.g.:
   "   1) [[vfile:~/Code/PythonProject/abc123.py]]
   "   2) [[vfile:./|Wiki Home]]
   let link = a:link
   if link =~# '^vfile:'
      let link = link[1:]
   else
      return 0
   endif
   let link_infos = vimwiki#base#resolve_link(link)
   if link_infos.filename == ''
      echomsg 'Vimwiki Error: Unable to resolve link!'
      return 0
   else
" Open in same window
"     execute '! open -a ' . '"Google Chrome" ' . '-g ' . fnameescape(link_infos.filename)
" Open in new window
      execute '! open -na "Google Chrome" --args --new-window ' . fnameescape(link_infos.filename)
      return 1
   endif
endfunction
au bufenter * :call vimwiki#vars#init()
let g:vimwiki_sync_branch = "master"
let g:vimwiki_hl_headers = 1
let g:vimwiki_listsyms = '✗○◐●✓'


" vim-signify
set updatetime=100
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_time = '_'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count        = 0
let g:signify_sign_show_text         = 1
nnoremap <leader>d  :SignifyDiff<CR>
" vim-sneak
highlight Sneak guifg=black guibg=red ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

" Ranger explorer
nnoremap <silent><leader>E :RangerOpenCurrentDir<CR>

" Nerdtree Settings
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>nf :NERDTreeFind<CR>
"see icons
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeNodeDelimiter = "\u00a0"        "non-breaking space
let g:NERDTreeWinSize=40
let NERDTreeIgnore=['\.svn$', '\.git$', '\.d$', '\.o$']
let NERDTreeBookmarksSort=1
let g:NERDTreeShowBookmarks=1
let NERDTreeShowLineNumbers=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI = 1
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
let g:indentLine_char = '|'
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*']
nnoremap <leader>i :IndentLinesToggle<CR>

"AirlineTheme
let g:airline_theme='luna'
let g:airline_section_y=""
let g:airline#extensions#tabline#enabled = 1
