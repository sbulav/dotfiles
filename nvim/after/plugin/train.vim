" Automatically Trigger Train each 50 sec
augroup auto_show_train
    au!
    setlocal updatetime=50000
    autocmd CursorHold * if &l:buftype !=# 'help' | execute 'normal zx' | endif
augroup end
