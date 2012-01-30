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


" Neocomplcache stuff
    imap <tab> <c-n>
    imap <s-tab> <c-p>
    " snippet expansion key
    imap å <Plug>(neocomplcache_snippets_expand)
    let g:neocomplcache_enable_at_startup=1
    let g:neocomplcache_enable_smart_case=1
    let g:neocomplcache_enable_camel_case_completion=1
    let g:neocomplcache_enable_underbar_completion=1
    let g:neocomplcache_enable_ignore_case=1
    let g:neocomplcache_min_syntax_length=3
    let g:neocomplcache_min_keyword_length=3

" Switch between windows, maximizing the current window
" lisätty 2011-04-29: ei maksimointia. toimii paremmin tabien kanssa

"map <C-J> <C-W>j<C-W>_
"map <C-K> <C-W>k<C-W>_
map <C-J> <C-W>
map <C-K> <C-W>
"------1 loppuu

" c-y to copy rest of word above (instead of character)
" The same for c-e (downwards)
    inoremap <expr> <c-y> matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')
    inoremap <expr> <c-e> matchstr(getline(line('.')+1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')

" QuickFix navigation
    nmap <j> :cn<enter>
    nmap <k> :cprev<enter>

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

"iunmap <C-g>S
"iunmap <C-g><C-S>

nmap - g;
nmap + g,
nmap <f11> :set list!<enter>
nmap <f12> :set hlsearch!<enter>

" fugitive
nmap <leader>gs :Gstatus<enter>
nmap <leader>gd :Gdiff<enter>
nmap <leader>gc :Gcommit<enter>
nmap <leader>gl :gitv<enter>
nmap <leader>ga :Git commit --amend<enter>
nmap <leader>gD :Git diff --cached --color<enter>
" this inserts the last commit message
" % needs to be escaped, otherwise vim inserts its register %
" Note that no <enter> so user has the option of changing number of commits
nmap <leader>gh :r !git log --format=format:\%s -1

" vimdiff navigation helpers based on these:
" Welcome to Puneet’s World » Usefull vimdiff commands to view diff and merge
" http://puneetworld.com/archives/48
map <F3> :diffput<enter>
map <F4> :diffget<enter>
nmap <F7> [czz
nmap <F8> ]czz

" c-r c-r to read register " (last used register)
    imap <c-r><c-r> <c-r>"
    cmap <c-r><c-r> <c-r>"

" add undo points after every word.
" makes it more convenient to do undo on complicated code.
    imap <space> <c-g>u<c-v><space>

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

" TagList plugin
nmap <c-t> :TlistToggle<enter>

" ujihisa/neco-ghc - GitHub
" https://github.com/ujihisa/neco-ghc
" epic haskell completion
    let $PATH=$PATH.":/home/mika/.cabal/bin"

" Superior Haskell Interaction Mode
" SHIM
" vim-scripts/Superior-Haskell-Interaction-Mode-SHIM - GitHub
" https://github.com/vim-scripts/Superior-Haskell-Interaction-Mode-SHIM/
    autocmd FileType haskell nmap <f10> :GhciRange<CR>
    autocmd FileType haskell vmap <f10> :GhciRange<CR>
    autocmd FileType haskell nmap <f9> :GhciFile<CR>
    autocmd FileType haskell nmap <C-c><C-r> :GhciReload<CR>
    let g:shim_ghciTimeout=2

" YankRing
" Vim plugin for advanced clipboard history.
nmap <c-b> :YRShow<enter>


" Auto highlight current word when idle - Vim Tips Wiki
" http://vim.wikia.com/wiki/Auto_highlight_current_word_when_idle
    " Highlight all instances of word under cursor, when idle.
    " Useful when studying strange source code.
    " Type z/ to toggle highlighting on/off.
    nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
    function! AutoHighlightToggle()
      let @/ = ''
      if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
      else
        augroup auto_highlight
          au!
          au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=500
        echo 'Highlight current word: ON'
        return 1
      endif
    endfunction
