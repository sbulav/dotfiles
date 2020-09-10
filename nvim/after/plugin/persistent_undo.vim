" Persistent undo
"""""""""""""""""""""""""""""
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/.local/share/nvim/persisted_undo/')    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif    " point Vim to the defined undo directory.
    let &undodir = target_path    " finally, enable undo persistence.
    set undofile
endif
