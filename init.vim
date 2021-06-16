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
Plug 'liuchengxu/vim-which-key'
Plug 'preservim/nerdtree'
Plug 'yegappan/mru'
Plug 'junegunn/fzf'

call plug#end()

" ===========================
" Plugins config
" ===========================

augroup NERDtree
    autocmd!

    " Start NERDTree and put the cursor back in the other window.
    autocmd VimEnter * NERDTree | wincmd p

    " Start NERDTree. If a file is specified, move the cursor to its window.
    " autocmd StdinReadPre * let s:std_in=1
    " autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

    " Exit Vim if NERDTree is the only window left.
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " If it is a man page, close nerdtree
    autocmd VimEnter * if &ft == 'man' | NERDTreeToggle | endif
    " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
    autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

augroup END

let NERDTreeShowHidden = 1
nnoremap <silent> <M-e> :NERDTreeToggle<cr>





" ===========================
" Colorscheme
" ===========================

set background=dark
" let g:tokyonight_enable_italic = 1
" let g:tokyonight_style = 'night'
" let g:tokyonight_transparent_background = 1
if exists('g:neovide')
    colorscheme nord
else 
    colorscheme nord
endif



" GUI font
set guifont=Fira\ Code:h14
let s:fontsize = 14

function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  execute "set guifont=Fira\\ Code:h" . s:fontsize
endfunction

" In normal mode, pressing ctrl+/- increases the font
noremap <C-=> :call AdjustFontSize(1)<CR>
noremap <C--> :call AdjustFontSize(-1)<CR>

" In insert mode, pressing ctrl+/- decreases the font
inoremap <C-+> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C--> <Esc>:call AdjustFontSize(-1)<CR>a

" normal mode shortcut
imap kk <ESC>
nnoremap j gj
nnoremap k gk
nnoremap <C-/> :noh<cr>

" visual indent made better
vnoremap > >gv
vnoremap < <gv

" function to insert a custom tag
function! InsertTag(tag)
    execute "normal i<" . a:tag . "></" . a:tag . ">\<Esc>bbl"
    execute "startinsert"
endfunction
nmap <leader>it <ESC>:call InsertTag(input(""))<cr>

" alt+j and alt+k to move a line up or down
" Uses l(line) register to do so
nnoremap <M-j> "ldd"lpqlq
nnoremap <M-k> "ldd2k"lpqlq


" =======================================
"" leader keybinds
" =======================================

" which-key plugin
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>


" file explorer
nmap <leader>. :edit .<CR>

noremap <leader>fs :w<cr>

noremap <leader>fS :wq<cr>

noremap <leader>fq :q!<cr>


" Vim
noremap <leader>qr :source $MYVIMRC<cr>

noremap <leader>qq :qa<cr>

noremap <leader>qQ :qa!<cr>


" window movement
noremap <leader>wj <C-w>j
noremap <leader>wk <C-w>k
noremap <leader>wl <C-w>l
noremap <leader>wh <C-w>h
" closing windows
noremap <silent> <leader>wc <C-W>c
" opening splits
noremap <silent> <leader>wv :vs<CR>
noremap <silent> <leader>ws :sp<CR>
" resizing splits
noremap <silent> <leader>w+ :res +2<CR>
noremap <silent> <leader>w- :res -2<CR>
noremap <silent> <leader>w< :vert res -10<CR>
noremap <silent> <leader>w> :vert res +10<CR>

" resizing splits (also)
nnoremap <silent> <M-C-k> :res +2<CR>
nnoremap <silent> <M-C-j> :res -2<CR>
nnoremap <silent> <M-h> :vert res -5<CR>
nnoremap <silent> <M-l> :vert res +5<CR>


" tabs
noremap <silent> <leader><TAB>n :tabnew<cr>
noremap <silent> <leader><TAB>c :tabclose<cr>


" buffers
nnoremap <silent> <leader>bl :ls<cr>
nnoremap <silent> <leader>bp :bp<cr>
nnoremap <silent> <leader>bn :bn<cr>
nnoremap <silent> <leader>bc :bdel<cr>
nnoremap <silent> <leader>bk :bdel!<cr>
nnoremap <leader>bb :ls<cr>:b<space>


" =========================
" Terminal mappings
" =========================

tnoremap <silent> <esc> <c-\><c-n>
