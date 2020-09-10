" Terraform
augroup vimmic_hcl_comments
    au BufNewFile,BufRead *.tf set filetype=terraform
    autocmd FileType terraform setlocal commentstring=#\ %s
augroup END
