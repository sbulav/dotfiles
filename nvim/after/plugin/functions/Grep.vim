" https://gist.github.com/romainl/56f0c28ef953ffc157f36cc495947ab3
" Execute grep in a subshell to avoid annoying confirmation screens
function! Grep(args)
    let args = split(a:args, ' ')
    return system(join([&grepprg, shellescape(args[0]), len(args) > 1 ? join(args[1:-1], ' ') : ''], ' '))
endfunction

" Command to populate quickfix with Grep function results
command! -nargs=+ -complete=file_in_path -bar Grep  cgetexpr Grep(<q-args>)
command! -nargs=+ -complete=file_in_path -bar LGrep lgetexpr Grep(<q-args>)

" Open quickfix automatically if there are valid entries
augroup quickfix
    autocmd!
    autocmd QuickFixCmdPost cgetexpr cwindow
    autocmd QuickFixCmdPost lgetexpr lwindow
augroup END
