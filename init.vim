set nocompatible
filetype plugin indent on
syntax on

" Set leader key
let mapleader = " "


call plug#begin('~/.config/nvim/plugged')

Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-commentary'
Plug 'flazz/vim-colorschemes'

call plug#end()


" Colorscheme configurations
let g:gruvbox_transparent_bg=1
colorscheme gruvbox
set background=dark
" let g:tokyonight_enable_italic = 1
" let g:tokyonight_style = 'night'
" let g:tokyonight_transparent_background = 1

" normal mode shortcut
imap kk <ESC>
nnoremap j gj
nnoremap k gk
nnoremap <C-/> :noh<cr>

" use ,t on insert mode to insert a tag (doesn't work on normal mode)
function! InsertTag(tag)
    execute "normal i<" . a:tag . "></" . a:tag . ">\<Esc>bbl"
    execute "startinsert"
endfunction
imap ,t <ESC>:call InsertTag(input(""))<cr>


"" leader keybinds

" file explorer
nmap <leader>. :edit .<CR>

noremap <leader>fs :w<cr>
noremap <leader>fS :wq<cr>
noremap <leader>fq :q!<cr>

" Vim
noremap <leader>qr :source $MYVIMRC<cr>
noremap <leader>qq :q<cr>
noremap <leader>qQ :q!<cr>


" comment keybind
noremap <leader>ic <ESC>0i#<SPACE><ESC>

" window movement
noremap <leader>wj <C-w>j
noremap <leader>wk <C-w>k
noremap <leader>wl <C-w>l
noremap <leader>wh <C-w>h
" closing windows
noremap <leader>wc <C-W>c
" opening splits
noremap <leader>wv :vs<CR>
noremap <leader>ws :sp<CR>
" resizing splits
noremap <leader>w+ :res +2<CR>
noremap <leader>w- :res -2<CR>
noremap <leader>w< :vert res -10<CR>
noremap <leader>w> :vert res +10<CR>


" tabs
noremap <leader><TAB>n :tabnew<cr>
noremap <leader><TAB>c :tabclose<cr>

