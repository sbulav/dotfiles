" Automatically Trigger Train each 10 sec
augroup auto_highlight
    au!
    setlocal updatetime=10000
    autocmd CursorHold * execute 'normal zx'
augroup end
