" Set makeprg and compiler
function! SetComp(comp, make)
  if !empty(a:comp)
    exec 'compiler '.a:comp
  endif
  if !empty(a:make)
    let &makeprg=a:make
  endif
endfunction
