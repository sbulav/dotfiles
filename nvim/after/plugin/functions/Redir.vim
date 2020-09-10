" Redirect the output of a Vim or external command into a scratch buffer
function! Redir(cmd)
    for win in range(1, winnr('$'))
        if getwinvar(win, 'scratch')
            execute win . 'windo close'
        endif
    endfor
    if a:cmd =~ '^!'
        let cmd = a:cmd =~' %' ? substitute(a:cmd, ' %', ' ' . expand('%:p'), '') : a:cmd
        let output = system(matchstr(cmd, '^!\zs.*'))
    else
        redir => output
        execute a:cmd
        redir END
    endif
    vnew
    let w:scratch = 1
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
    call setline(1, split(output, "\n"))
endfunction

command! -nargs=1 -complete=command Redir silent call Redir(<q-args>)
