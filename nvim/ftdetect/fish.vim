" Fish scripts
augroup vimmic_fish_filetype
    au BufNewFile,BufRead *.fish set filetype=fish commentstring=#%s
augroup END
