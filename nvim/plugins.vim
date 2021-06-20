" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

""" PLUGINS 
call plug#begin('~/.config/nvim/autoload/plugged')
    Plug 'OmniSharp/omnisharp-vim'
    Plug 'RRethy/vim-illuminate'
    Plug 'SirVer/ultisnips'
    Plug 'dense-analysis/ale'
    Plug 'itchyny/lightline.vim'
    Plug 'mattn/emmet-vim'
    Plug 'mhinz/vim-startify'
    Plug 'morhetz/gruvbox'    
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'reconquest/vim-pythonx'
    Plug 'scrooloose/NERDTree'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-surround'
    Plug 'wellle/targets.vim'
call plug#end()

" Coc-nvim
set hidden
set nobackup
set nowritebackup
set updatetime=300
set shortmess+=c
" useful: coc-omnisharp, coc-pyright, coc-pairs

" set signcolumn=yes
inoremap <silent><expr> <NUL> coc#refresh()
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-l> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" NERDTree
map <C-o> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeGitStatusWithFlags = 1

" Gruvbox
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_hls_cursor = 'orange'
let g:gruvbox_vert_split = 'bg1'
let g:gruvbox_sign_column = 'bg1'
colorscheme gruvbox
set background=dark

" Emmet-vim - https://github.com/mattn/emmet-vim
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','
autocmd FileType html,css,php EmmetInstall

" LightLine - https://github.com/itchyny/lightline.vim
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'deus',
      \ }

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" vim-Startify https://www.chrisatmachine.com/Neovim/11-startify/
let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]
let g:startify_bookmarks = [
            \ { 'p': '~/.config/nvim/plugins.vim' },
            \ { 'i': '~/.config/nvim/init.vim' },
            \ { 'c': '~/.config/i3/config' },
            \ { 'z': '~/.zshrc' },
            \ '~/Desktop/Projects',
            \ '~/Desktop/UK/MFF-Stuff',
            \ ]
" let g:startify_session_autoload = 1
" let g:startify_session_persistence = 1
let g:startify_enable_special = 0
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | endif

" nvim-colorizer - https://github.com/norcalli/nvim-colorizer.lua
" in init
"

" Omnisharp
" let g:OmniSharp_server_use_mono = 1
let g:OmniSharp_popup_mappings = {
\ 'sigNext': '<C-n>',
\ 'sigPrev': '<C-p>',
\ 'lineDown': ['<C-e>', 'j'],
\ 'lineUp': ['<C-y>', 'k']
\}

let g:OmniSharp_popup_mappings.close = '<Esc>'
let g:OmniSharp_popup_position = 'center'
" let g:OmniSharp_popup_options = {
"   \ 'winhl': 'Normal:NormalFloat'
"   \}

augroup omnisharp_commands
    autocmd!

    autocmd FileType cs nnoremap <C-x> :lnext<CR>
    autocmd FileType cs nnoremap <C-p> :lprev<CR>
    " Show type information automatically when the cursor stops moving
    " autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()

    autocmd FileType cs nnoremap <buffer> osgd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> osgd :OmniSharpGotoDefinition<CR>

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> osgd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>osfi :OmniSharpFindImplementations<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>oscc :OmniSharpGlobalCodeCheck<CR>

    " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
    autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
augroup END

let g:ale_linters = { 'cs': ['OmniSharp'] }
" let g:ale_linters_explicit = 1

let g:startify_custom_header = [
\ '',
\ '    __/\\\\\_____/\\\___________________________________________________________________________        ',
\ '     _\/\\\\\\___\/\\\___________________________________________________________________________       ',
\ '      _\/\\\/\\\__\/\\\_________________________________________________/\\\______________________      ',
\ '       _\/\\\//\\\_\/\\\______/\\\\\\\\_______/\\\\\______/\\\____/\\\__\///______/\\\\\__/\\\\\___     ',
\ '        _\/\\\\//\\\\/\\\____/\\\/////\\\____/\\\///\\\___\//\\\__/\\\____/\\\___/\\\///\\\\\///\\\_    ',
\ '         _\/\\\_\//\\\/\\\___/\\\\\\\\\\\____/\\\__\//\\\___\//\\\/\\\____\/\\\__\/\\\_\//\\\__\/\\\_   ',
\ '          _\/\\\__\//\\\\\\__\//\\///////____\//\\\__/\\\_____\//\\\\\_____\/\\\__\/\\\__\/\\\__\/\\\_  ',
\ '           _\/\\\___\//\\\\\___\//\\\\\\\\\\___\///\\\\\/_______\//\\\______\/\\\__\/\\\__\/\\\__\/\\\_ ',
\ '            _\///_____\/////_____\//////////______\/////__________\///_______\///___\///___\///___\///__',
\ '']

" \ '     ___      ___                                                   ',
" \ '     `MM\     `M"                               68b                 ',
" \ '      MMM\     M                                Y89                 ',
" \ '      M\MM\    M   ____     _____   ____    ___ ___ ___  __    __   ',
" \ '      M \MM\   M  6MMMMb   6MMMMMb  `MM(    )M" `MM `MM 6MMb  6MMb  ',
" \ '      M  \MM\  M 6M"  `Mb 6M"   `Mb  `Mb    d"   MM  MM69 `MM69 `Mb ',
" \ '      M   \MM\ M MM    MM MM     MM   YM.  ,P    MM  MM"   MM"   MM ',
" \ '      M    \MM\M MMMMMMMM MM     MM    MM  M     MM  MM    MM    MM ',
" \ '      M     \MMM MM       MM     MM    `Mbd"     MM  MM    MM    MM ',
" \ '      M      \MM YM    d9 YM.   ,M9     YMP      MM  MM    MM    MM ',
" \ '     _M_      \M  YMMMM9   YMMMMM9       M      _MM__MM_  _MM_  _MM_',
" \ '']
