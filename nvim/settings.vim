let g:mapleader = ","

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set number
set tw=79
set relativenumber
set pumheight=10                        " Makes popup menu smaller
set ruler              			        " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right 
set t_Co=256                            " Support 256 colors
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set smartindent                         " Makes indenting smart
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
set autoindent                          " Good auto indent
" set laststatus=0                        " Always display the status line
set background=dark                     " tell vim what the background color looks like
set hlsearch
set incsearch
set ignorecase
set smartcase
" set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else

" Mouse and backspace
set mouse=a
set bs=2

set noswapfile
set nowritebackup
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set history=700
set undolevels=700

set colorcolumn=80
highlight ColorColumn ctermbg=233

set termguicolors

" au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
autocmd! bufwritepost $MYVIMRC source %
