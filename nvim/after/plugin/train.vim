" Automatically Trigger Train each 10 sec
augroup auto_show_train
    au!
    setlocal updatetime=10000
    autocmd CursorHold * if &l:buftype !=# 'help' | execute 'normal zx' | endif
augroup end
