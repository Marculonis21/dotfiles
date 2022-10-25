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
    Plug 'honza/vim-snippets'
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
    Plug 'lervag/vimtex'

    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()

" do not close the preview tab when switching to other buffers
let g:mkdp_auto_close = 0

" commentary
autocmd BufNewFile,BufRead *.map set ft=map syntax=vim
autocmd FileType map setlocal commentstring=#%s 

" useful: coc-pairs, coc-pyright, coc-vimtex, coc-json
" for c# -> use csharp-ls -> need coc config setup

" set signcolumn=yes
" autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
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
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'files',     'header': ['   Files']            },
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
let g:startify_enable_special = 0
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | endif

" Latex
let g:tex_flavor='latex'
" let g:vimtex_view_general_viewer='acrordrdc'
let g:vimtex_view_general_viewer='evince'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

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
let g:ale_linters_explicit = 1

" vim markdown
" disable header folding
let g:vim_markdown_folding_disabled = 1
" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0
" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1
" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

" markdown preview
let g:mkdp_theme = 'dark'

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
