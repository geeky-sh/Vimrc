if $SHELL =~ 'bin/fish'
    set shell=/bin/sh
endif

se nu
syntax on
set t_Co=256
"colorscheme desert256
se background=dark
"colorscheme solarized
colorscheme zenburn
set autoindent "teslti
set backspace=2
set expandtab
set tabstop=4
set shiftwidth=4
set nocompatible
set ruler
set scrolloff=1
set tildeop
"inoremap < <><ESC>i
set matchpairs=(:),{:},[:],<:>
set ignorecase
filetype plugin on
set sw=4 
set mouse=a
set autoread
set backspace=eol,start,indent
set fileencoding=utf-8
set quoteescape
" tällä voi avata uusia buffereita vaikka nykysessä on muutoksia
set hidden
" gvim haluaa spell checkata kaikki, otan sen pois
set nospell

" http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
set backupdir=~/.vim/backup//
set directory=~/.vim/backup//

"------1
"Seuraavat haettu http://www.8t8.us/vim/vim.html
"------
set winminheight=0      " Allow windows to get fully squashed


" Switch between windows, maximizing the current window
" lisätty 2011-04-29: ei maksimointia. toimii paremmin tabien kanssa

"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_
map <C-J> <C-W>
map <C-K> <C-W>
"------1 loppuu

inoremap <Nul> <C-x><C-o>
" ctrl+v inserts from x clipboard
" inoremap <C-v> <Esc>:r !xclip -out<CR>

" mini buffer explorer - plugin
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 


" lähde: http://vim.wikia.com/wiki/Using_vim_as_an_IDE_all_in_one
" --------------------
" ShowMarks
" --------------------
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1


" http://vim.wikia.com/wiki/Smart_mapping_for_tab_completion
function! CleverTab()
  if pumvisible()
    return "\<C-N>"
  endif
  if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
    return "\<Tab>"
  elseif exists('&omnifunc') && &omnifunc != ''
    return "\<C-X>\<C-O>"
  else
    return "\<C-N>"
  endif
endfunction
inoremap <Tab> <C-R>=CleverTab()<CR>


" http://vim.wikia.com/wiki/Omni_completion_popup_menu
highlight Pmenu ctermbg=238 gui=bold


" http://vim.wikia.com/wiki/Omni_completion
set ofu=syntaxcomplete#Complete

"always use command editing window
"nnoremap : q:i
"nnoremap / q/i
"nnoremap ? q?i

se cmdwinheight=2
se incsearch

" indenting xml
" http://uucode.com/blog/2005/06/15/indenting-xml-in-vim/ 
map <F2> <Esc>:1,$!xmllint --format -<CR>


" vim git plugins
" http://www.osnews.com/story/21556/Using_Git_with_Vim
set laststatus=2 " Enables the status line at the bottom of Vim
set statusline=%{fugitive#statusline()}

" tätä tarvii tuo git plugin ja oikeastaan wiki plugin myös
let mapleader=","

" tämä määrittää kaikki wikit joita käytän vimwikin kanssa
let g:vimwiki_list = [
    \{'path': '~/vimwiki/', 'path_html': '~/vimwiki/html/'}]

" http://code.google.com/p/vimwiki/wiki/TagList4Vimwiki
let tlist_vimwiki_settings = 'wiki;h:Headers'

" Repeat last command and put cursor at start of change
" http://vim.wikia.com/wiki/VimTip1142
nmap . .`[

" auttaa wikin editoimisessa
" asettaa oikean syntaksivärityksen
nmap <Leader>1 :se syntax=mediawiki<CR>
" lisää otsikkotaso
nmap <leader>+ I=<esc>A=<esc>
" poista otsikkotaso
nmap <leader>- 0x$x

" http://projects.haskell.org/haskellmode-vim/
filetype indent on
" use ghc functionality for haskell files
au Bufenter *.hs compiler ghc

" configure browser for haskell_doc.vim
let g:haddock_browser = "/usr/bin/firefox"

" http://www.vim.org/scripts/download_script.php?src_id=7407
let g:haskell_indent_if = 0
let g:haskell_indent_case = 0

imap <C-g> <C-g>u
"iunmap <C-g>S
"iunmap <C-g><C-S>

" fugitive
nmap <leader>gs :Gstatus<enter>
nmap <leader>gd :Gdiff<enter>
nmap <leader>gc :Gcommit<enter>
nmap <leader>gl :gitv<enter>
" these help with navigating gitlog in fugitive
nmap <f1> :cprevious<enter>
nmap <f2> :cnext<enter>

" vimdiff navigation helpers based on these:
" Welcome to Puneet’s World » Usefull vimdiff commands to view diff and merge
" http://puneetworld.com/archives/48
nmap <F3> dp
nmap <F4> do
nmap <F7> [czz
nmap <F8> ]czz


" gitv plugin:
" 4.2 Open Horizontal
"
" This is the default layout to use in browser mode. If set to 0 then browser
" mode will open in a vertical split. If set to 1 then browser mode will open
" in
" a horizontal split. If set to 'auto' then browser mode will open in a
" vertical
" split unless the content fits better in a horizontal split, in which case it
" will open horizontally.
"
" The commit browser width and height is automatically sized to best fit the
" content in all modes and settings.
let g:Gitv_OpenHorizontal = 1
