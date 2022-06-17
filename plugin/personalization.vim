" personalization.vim: - Personalization Vim
" Maintainer: Soummya Mallick
" Version:    3.0
"
if has("gui_running")
   colorscheme gruvbox
else
   colorscheme gruvbox
   set mouse=a
endif
set bg=dark
let g:gruvbox_contrast_dark = 'hard'

" Initial Essential
let mapleader = ','

" Essential sets
set path+=debug/**,compile/**,design/**,pal_ice/**,ptm_ice/**,~/dotfiles/**,~/.vim/**
set expandtab
set hlsearch incsearch
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
set number
if v:version > 800
set signcolumn=yes "no jumping
endif
set list
set listchars=tab:▸\ ,trail:·
hi SpecialKey ctermfg=66 guifg=#649A9A
set scrolloff=8
set sidescrolloff=8
"set clipboard^=unnamed,unnamedplus
set clipboard=unnamedplus
set timeoutlen=400

" ==============================================================================
" Usefull Leader Maps
" ==============================================================================
" minor irritants
nnoremap <leader><space> :nohlsearch<CR>
nnoremap j gj
nnoremap k gk
inoremap jk <ESC>
nnoremap <leader>w  :set wrap!<CR>
nnoremap <leader>r  :call FullRefresh()<CR>
nnoremap <leader>gf viW<C-w>gf                "tab <cword>
nnoremap <leader>sf viW<C-w>f                 "split <cword>
nnoremap <leader>vf :vertical wincmd f<CR>    "vertical split <cword> (wincmd f is equivalent to <C-W>)
nnoremap <leader>q  <ESC>:q<CR>
map <F7> gg=G<C-o><C-o>                       "format current file

" Toggle list
nnoremap <leader><leader>l :set list!<CR>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv
nnoremap > >gv
nnoremap < <gv

" Add ;/, to EOL
nnoremap ;; A;<ESC>
nnoremap ,, A,<ESC>

" Move text up/down
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv

" Split creation
nnoremap <leader>\| :vsplit<CR>
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>
nnoremap <leader>_ :split<CR>
if v:version > 800
tnoremap <C-t> <C-w>:tabnew<CR>
tnoremap <leader>- <C-w>:term ++close<CR>
tnoremap <leader>_ <C-w>:term ++close<CR>
tnoremap <leader>\| <C-w>:vert term ++close<CR>
tnoremap <leader>\ <C-w>:vert term ++close<CR>
nnoremap <leader><leader>\| :vert term ++close<CR>
nnoremap <leader><leader>\ :vert term ++close<CR>
nnoremap <leader><leader>- :term ++close<CR>
nnoremap <leader><leader>_ :term ++close<CR>
endif

" Easier split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
if v:version > 800
tnoremap <C-h> <C-w>h
tnoremap <C-l> <C-w>l
tnoremap <C-j> <C-w>j
tnoremap <C-k> <C-w>k
endif

" vim tabs
nnoremap <C-t> :tabnew<CR>
nnoremap <leader>1 :tabnext 1<CR>
nnoremap <leader>2 :tabnext 2<CR>
nnoremap <leader>3 :tabnext 3<CR>
nnoremap <leader>4 :tabnext 4<CR>
nnoremap <leader>5 :tabnext 5<CR>

" expand %% to files directory
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Change to the folder of the current file
nnoremap <silent> <leader>cd :cd %:p:h<CR>:pwd<CR>

" usefull variables
let @f = expand('%:t')
let @g = expand('%:p')
let @d = expand('%:p:h')
" ==============================================================================
" Keyboard split resize (Uses vim-submode)
" ==============================================================================
let g:submode_timeout = 0
let g:submode_keep_leaving_key = 1
call submode#enter_with('vgrow/vshrink', 'n', '', '<leader>l', '<ESC>:vertical res -3<CR>')
call submode#enter_with('vgrow/vshrink', 'n', '', '<leader>h', '<ESC>:vertical res +3<CR>')
call submode#enter_with('vgrow/vshrink', 'n', '', '<leader>j', '<ESC>:res -1<CR>')
call submode#enter_with('vgrow/vshrink', 'n', '', '<leader>k', '<ESC>:res +1<CR>')
call        submode#map('vgrow/vshrink', 'n', '',         'l', '<ESC>:vertical res -3<CR>')
call        submode#map('vgrow/vshrink', 'n', '',         'h', '<ESC>:vertical res +3<CR>')
call        submode#map('vgrow/vshrink', 'n', '',         'j', '<ESC>:res -1<CR>')
call        submode#map('vgrow/vshrink', 'n', '',         'k', '<ESC>:res +1<CR>')

" ==============================================================================
" floaterm
" ==============================================================================
let g:floaterm_wintype = 'float'
let g:floaterm_width = 0.6
let g:floaterm_height = 0.6
let g:floaterm_position = 'topleft'
let g:floaterm_autolose = 2

nnoremap <leader><leader>gdb :FloatermNew --width=0.35 --height=0.8 --title=gdb gdb -tui<CR>
nnoremap         <leader>ra  :FloatermNew --title=ranger                        ranger<CR>
nnoremap         <leader>f   :FloatermNew --title=explorer                      bash -i -c ,f<Bar>exit 0<CR>
nnoremap         <leader>py  :FloatermNew --title=python                        python<CR>

" ==============================================================================
" Browse pdf
" ==============================================================================
let g:Pdf2Txt = 'pdftotext -nopgbrk -layout -q -eol unix %:p:S -'
augroup Pdf2Txt | au!
    autocmd BufReadCmd *.pdf execute expandcmd('silent read ++edit !'..g:Pdf2Txt)
    autocmd BufReadCmd *.pdf 1delete_
    autocmd BufReadCmd *.pdf setfiletype text
    autocmd BufReadCmd *.pdf setlocal buftype=nowrite
augroup end

" ==============================================================================
" Convinience Commands
" ==============================================================================
command! Filename execute ":echo expand('%:p')"
command! Vimrc    execute ":edit $MYVIMRC"
command! Config   execute expandcmd(":edit "..g:personal_vimrc)
command! Reload   execute "source $MYVIMRC"
command! Cdfile   execute "cd ".@d

" ==============================================================================
" FZF
" ==============================================================================
nnoremap <silent> <leader>gb         :BCommits<CR>|          "use this, much better than gf
nnoremap <silent> <Leader>rg         :Rg .<Bar> fzf -print0<CR>
nnoremap <silent> <leader>gh         :Commits<CR>
nnoremap <silent> <leader>F          :GFiles<CR>
nnoremap <silent> <leader>b          :Buffers<CR>
nnoremap          <leader>s          :echo ',:,/    - Files,Commands,Searches'<Bar>History
nnoremap <silent> <leader><leader>c  :Commands<CR>
nnoremap <silent> <leader><leader>m  :Maps<CR>

" ==============================================================================
" Fugitive
" ==============================================================================
"Auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" ==============================================================================
" UltiSnips
" ==============================================================================
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsListSnippets="<c-tab>"

" ==============================================================================
" vim-signify
" ==============================================================================
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '-'
let g:signify_sign_delete_first_time = '_'
let g:signify_sign_change            = '~'
let g:signify_sign_show_count        = 1

" Faster sign updates on CursorHold/CursorHold
set updatetime=100
nnoremap <leader>d  :SignifyDiff<CR>

" hunk jumping
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)

" ==============================================================================
" vim-sneak
" ==============================================================================
highlight Sneak guifg=black guibg=red ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow

" ==============================================================================
" Nerdtree Settings
" ==============================================================================
"see icons
"let g:NERDTreeDirArrowExpandable = '▸'
"let g:NERDTreeDirArrowCollapsible = '▾'
"let NERDTreeNodeDelimiter = "\u00a0"        " non-breaking space icon issue, git icons
"let g:NERDTreeGitStatusPorcelainVersion = 1 " if not latest git

nnoremap <expr> <leader>e g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nmap <leader>nf :NERDTreeFind<CR>
let g:NERDTreeWinSize=45
let g:NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.svn$', '\.git$', '\.d$', '\.o$', '\.nfs.*']
let NERDTreeBookmarksSort=1
let NERDTreeShowLineNumbers=1
let NERDTreeAutoDeleteBuffer=1
let NERDTreeMinimalUI = 1

call NERDTreeAddKeyMap({
   \ 'key': 'yy',
   \ 'callback': 'NERDTreeYankFullPath',
   \ 'quickhelpText': 'put full path of current node into the default register' })

function! NERDTreeYankFullPath()
   let n = g:NERDTreeFileNode.GetSelected()
   if n != {}
      call setreg('"', n.path.str())
   endif
   call nerdtree#echo("Node full path yanked!")
endfunction

function FullRefresh()
   :e!
   :NERDTreeRefreshRoot
   :NERDTreeFind
endfunction

" ==============================================================================
" nerdtree-git-plugin
" ==============================================================================
let g:NERDTreeGitStatusShowClean = 0 " shows ✔ when clean

" ==============================================================================
" vim-devicons
" ==============================================================================
set encoding=utf-8

" ==============================================================================
" vim-nerdtree-syntax-highlight
" ==============================================================================
" Disable unmatched folder and file icons having the same color as their labels
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

" Highlight full name (not only icons).
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

let s:brown       = "905532"
let s:aqua        =  "3AFFDB"
let s:blue        = "689FB6"
let s:darkBlue    = "44788E"
let s:purple      = "834F79"
let s:lightPurple = "834F79"
let s:red         = "AE403F"
let s:beige       = "F5C06F"
let s:yellow      = "F09F17"
let s:orange      = "D4843E"
let s:darkOrange  = "F16529"
let s:pink        = "CB6F6F"
let s:salmon      = "EE6E73"
let s:green       = "8FAA54"
let s:lightGreen  = "31B53E"
let s:white       = "FFFFFF"
let s:rspec_red   = 'FE405F'
let s:git_orange  = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['qel'] = s:aqua
let g:NERDTreeExtensionHighlightColor['tcl'] = s:aqua
let g:NERDTreeExtensionHighlightColor['tdf'] = s:lightGreen
let g:NERDTreeExtensionHighlightColor['v'] = s:blue
let g:NERDTreeExtensionHighlightColor['sv'] = s:blue
let g:NERDTreeExtensionHighlightColor['vhd'] = s:blue
let g:NERDTreeExtensionHighlightColor['cpp'] = s:blue
let g:NERDTreeExtensionHighlightColor['c'] = s:blue
let g:NERDTreeExtensionHighlightColor['asm'] = s:blue
let g:NERDTreeExtensionHighlightColor['S'] = s:blue
let g:NERDTreeExtensionHighlightColor['svh'] = s:salmon
let g:NERDTreeExtensionHighlightColor['vh'] = s:salmon
let g:NERDTreeExtensionHighlightColor['h'] = s:salmon
let g:NERDTreeExtensionHighlightColor['f'] = s:rspec_red
let g:NERDTreeExtensionHighlightColor['svcf'] = s:rspec_red
let g:NERDTreeExtensionHighlightColor['log'] = s:brown
let g:NERDTreeExtensionHighlightColor['sh'] = s:lightGreen
let g:NERDTreePatternMatchHighlightColor = {}                        " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['Makefile.*'] = s:rspec_red " sets the color for file pattern Makefile.*
let g:NERDTreePatternMatchHighlightColor['\.git.*'] = s:git_orange   " sets the color for file pattern .git*

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue    " sets the color for files that did not match any rule

" ==============================================================================
"indentLine
" ==============================================================================
let g:indentLine_char = '|'
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', '.*\.pdf']
nnoremap <leader>ii :IndentLinesToggle<CR>

" ==============================================================================
"AirlineTheme
" ==============================================================================
let g:airline_powerline_fonts = 1
let g:airline_theme='luna'
let g:airline_section_y=""
let g:airline#extensions#tabline#enabled = 1

" ==============================================================================
" Vimwiki Settings
" ==============================================================================
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
"let wiki_1.auto_export = 1     "export html

let wiki_2 = {}
let wiki_2.path = '~/vimwiki/personal/'
let wiki_2.index = 'index'
let wiki_2.nested_syntaxes = {'python': 'python', 'c': 'cpp'}
let wiki_2.auto_toc = 1
"let wiki_2.auto_export = 1     "export html
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
