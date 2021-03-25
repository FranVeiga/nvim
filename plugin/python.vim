set breakindent
nmap ,! i#! /usr/bin/python3<CR><CR><ESC>

augroup python
    autocmd!
    autocmd FileType python nmap <leader>fx :5sp<cr>:terminal python3 %<cr>
augroup END
