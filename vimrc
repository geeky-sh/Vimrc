" Hard-coded for Windows and cygwin.
" If not set to windows path, diffs cannot be displayed,
" possibly other errors exist but have not been discovered.
"if $SHELL =~ 'bin/fish'
"    set shell=/bin/sh
"endif
" The idea is, on Windows, that this shell is the default when starting
" so that git mergetool works (diff generation)
" Then, when vim is started, we can switch to cmd.exe so that other stuff
" works as well. :)
" TODO doesn't work
" set shell=c:\cygwin\bin\sh.exe

" ----------------
" Settings section
" ----------------
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
    " Enabling Windows shortcuts for gvim - Vim Tips Wiki
    " http://vim.wikia.com/wiki/Enabling_Windows_shortcuts_for_gvim
        set winaltkeys=no
    se cmdwinheight=2
    set incsearch
    set hlsearch


    " http://vim.wikia.com/wiki/Remove_swap_and_backup_files_from_your_working_directory
    set backupdir=~/vim-tmp/
    set directory=~/vim-tmp/
    " http://www.8t8.us/vim/vim.html
    set winminheight=0      " Allow windows to get fully squashed



    map <C-J> <C-W>
    map <C-K> <C-W>

" Add undo steps after each word.
" Really useful when quickly editing.
    imap <space> <c-g>u<c-v><space>
" Complete 'read last register (")' command by double ctrl+r
    cmap <c-r><c-r> <c-r>"
    imap <c-r><c-r> <c-r>"
" Wordwise Ctrl-Y in insert mode - Vim Tips Wiki
" http://vim.wikia.com/wiki/Wordwise_Ctrl-Y_in_insert_mode
"
inoremap <expr> <c-y> matchstr(getline(line('.')-1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')
inoremap <expr> <c-e> matchstr(getline(line('.')+1), '\%' . virtcol('.') . 'v\%(\k\+\\|.\)')

" camelcasemotion.vim
    " To avoid losing the (rarely used) |,| mapping (which repeats latest f, t, F or
    " T in opposite direction), you can remap it to ,,: >
    nnoremap ,, ,
    xnoremap ,, ,
    onoremap ,, ,
    " Fix <leader>w wait time
    " Due to AlignMaps mapping ,w=
    " TODO doesn't work since key isn't bound yet when sourcing .vimrc.
    " It's bound later, not sure where. Maybe autoload/ dir.
    " unmap <leader>w=
    " easier camel case usage with Alt
    " TODO doesn't work on virtual terminal vim
    " map <leader><e> <leader>e
    " map <leader><b> <leader>b
    " map <leader><w> <leader>w

inoremap <Nul> <C-x><C-o>
" ctrl+v inserts from x clipboard
" inoremap <C-v> <Esc>:r !xclip -out<CR>

" mini buffer explorer - plugin
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1 

" ------------------------------
" Neocomplcache
" ------------------------------
    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
    
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <s-TAB> <c-p>
    imap <a-e>     <Plug>(neocomplcache_snippets_expand)
    smap <a-e>     <Plug>(neocomplcache_snippets_expand)
    " Edit with alt+E
    " alt+e is in use by AlignMaps
    nmap <a-E>     :NeoComplCacheEditSnippets<enter>
    inoremap <expr><a-g>     neocomplcache#undo_completion()
    inoremap <expr><a-l>     neocomplcache#complete_common_string()
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><a-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><a-y>  neocomplcache#close_popup()
    " inoremap <expr><a-e>  neocomplcache#cancel_popup()
    " imap <tab>   <c-n>
    " imap <s-tab> <c-p>
    " neocomplcache - Ultimate auto completion system for Vim : vim online
    " http://www.vim.org/scripts/script.php?script_id=2620
    let g:neocomplcache_enable_at_startup = 1
    " When a capital letter is included in input, neocomplcache does
    " not ignore the upper- and lowercase.
    let g:neocomplcache_enable_smart_case = 1
    " Whether to select the first element or not
    let g:neocomplcache_enable_auto_select = 0
    " When you input a capital letter, this variable controls
    " whether neocomplcache takes an ambiguous searching as an end
    " of the words in it. For example, neocomplcache come to
    " match it with ArgumentsException when you input it with AE.
    let g:neocomplcache_enable_camel_case_completion = 1
    " When you input _, this variable controls whether
    " neocomplcache takes an ambiguous searching as an end of the
    " words in it.  For example, neocomplcache come to match it
    " with "public_html" when you input it with "p_h".
    let g:neocomplcache_enable_underbar_completion = 1
    " This variable controls whether neocomplcache accept wild
    " card character '*' for input-saving.
    let g:neocomplcache_enable_wildcard = 1

" lähde: http://vim.wikia.com/wiki/Using_vim_as_an_IDE_all_in_one
" --------------------
" ShowMarks
" --------------------
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let g:showmarks_enable = 1

" http://vim.wikia.com/wiki/Omni_completion_popup_menu
highlight Pmenu ctermbg=238 gui=bold


" http://vim.wikia.com/wiki/Omni_completion
set ofu=syntaxcomplete#Complete

"always use command editing window
"nnoremap : q:i
"nnoremap / q/i
"nnoremap ? q?i

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
" Welcome to Puneet¿s World » Usefull vimdiff commands to view diff and merge
" http://puneetworld.com/archives/48
map <F3> :diffput<enter>
map <F4> :diffget<enter>
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

" TagList plugin
nmap <c-t> :TlistToggle<enter>

" Folding : http://vim.wikia.com/wiki/Syntax-based_folding, see comment by
" Ostrygen au FileType cs
au FileType cs set foldmethod=indent

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

" Error using the :GDiff command of fugitive.vim using gvim for windows and
" msys git 1.7.0.2 - Stack Overflow
" http://stackoverflow.com/questions/2932399/error-using-the-gdiff-command-of-fugitive-vim-using-gvim-for-windows-and-msys-g
set directory+=,~/tmp,$TMP
" for gvim on Windows
"set guifont=Consolas:h9:cANSI
set guifont="Monospace 9"

" downloaded .Net 4 source code and extracted it to a local folder. Then ran 
"     ctags --recurse -f csharptags --extra=+fq --fields=+ianmzS --c#-kinds=cimnp "C:\Documents and Settings\
"     Mika\Documents\RefSrc\Source\.Net\4.0\DEVDIV_TFS\Dev10\Releases\RTMRel\"
" That resulted in a file called csharptags. When this file is loaded as a tag
" file in Vim, I can search for existing words in the tag file.
" I can also complete words based on all tags.
"     set tags+=C:\projektit\csharptags
" This bit includes all tag files in the current directory
" Not sure if want.
" Kevin's Vim Tips and Tricks
" http://www.8t8.us/vim/vim.html
" Hard-coded project tag files:
    " eLogic
    set tags+=~/ekassatime/eLogic/tags;
    " eSoapApi
    set tags+=~/ekassatime/eSoapApi/tags;
" Removes tag completion from ctrl+n completion list.
" If this is not done, the completion will take very long to complete.
set complete=.,w,b,u,i
" Open tag search. Makes it possible to open the tag list in insert mode on a
" non-US keyboard.
imap <c-a> <c-x><c-]>

" Fugitive.vim - browsing the git object database
" http://vimcasts.org/episodes/fugitive-vim-browsing-the-git-object-database/
autocmd BufReadPost fugitive://* set bufhidden=delete

" 
map <a-t> :TBEMinimal<enter>
" For CamelCaseMotion plugin
"    map <a-e> <leader>e
"    map <a-w> <leader>w
"    map <a-b> <leader>b

" Set up c# building!
    "set makeprg=msbuild\ /nologo\ /v:Detailed\ /property:OutputPath=bin\Debug\ /property:GenerateFullPaths=true
    " GenerateFullPaths should help with vim's quickfix navigating
    " Configuration and Platform properties are required by msbuild on some
    " projects
    " set makeprg=C:/Windows/Microsoft.NET/Framework/v4.0.30319/msbuild.exe\ /nologo\ /v:q\ /property:OutputPath=bin\Debug\ /property:GenerateFullPaths=true
    " Vim :help makeprg says:
    " Note that a '|' must be escaped twice: once for ":set" and once for
	" the interpretation of a command.
    map <c-f8> :make<enter>
    set makeprg=/home/joose/bin/mdtool.build.errors.only.sh
    " (Black magic)
    " TODO probably doesn't work on terminal vim
    set errorformat=\ %#%f(%l\\\,%c):\ %m
    map <c-f8> :make<enter>
    " leader+j and leader+k to go down and up in the quickfix list
    " The idea is 'down' and 'up'
    map <leader>j :cnext<enter>
    map <leader>k :cprevious<enter>

" Use cygwin shell - Vim Tips Wiki
" http://vim.wikia.com/wiki/Use_cygwin_shell
"
	"******* current file directory commands WINDOWS **********************
	""%:p:h:8 gets the current file's directory and :8 is what puts it
	"into dos short form
	"
	""open explorer in the current file's directory
	map ,E :!start explorer %:p:h:8<CR>

	"open windows command prompt in the current file's directory
	"map ,c :!start cmd /k cd %:p:h:8<CR>
	"
	""open cygwin bash in the current file's directory
	map ,B :!start bash --login -i -c 'cd `cygpath "%:p:h:8"`;bash'<CR>

	"******* end current file directory commands WINDOWS ******************
	"
" XML Completion - Completion for XML files : vim online
" http://www.vim.org/scripts/script.php?script_id=1442
    " If g:xmlSubelements == "yes" (default "no"), completion of element names
    " is restricted on subelements of parent element.
    let g:xmlSubelements="yes"

" improved autoread for console vim
    source ~/.vim/autoread.vimscript
    let autoreadargs={'autoread':1} 
    execute WatchForChanges("*",autoreadargs) 

" YankRing
    " Vim already maintains a list of numbered registers containing the last
    " yanked item and the previous 9 deletes. These items can be referenced
    " using [register]p, so "0p will paste the last yank, "1p will paste the
    " last delete, "2p the 2nd last delete. For more information see
    " |quote_number|.
    " If you wish the YankRing to maintain these numbered registers so
    " the top 10 elements in the YankRing are in the numbered reqisters 0-9
    " you can put the following in your |vimrc| >
    let g:yankring_manage_numbered_reg = 1
	" Don't map the dot operator, since I have a better mapping for it.
	let g:yankring_map_dot=0
    " Show YankRing
    " in B since <c-y> is in use as scroll text down
    map <c-B> :YRShow<enter>
