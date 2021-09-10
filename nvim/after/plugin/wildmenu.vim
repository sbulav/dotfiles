" Autocompletion
"""""""""""""""""""""""""""""""""""""""
" Wildmenu completion : exclude some files
set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn " Version Controls
set wildignore+=*.aux,*.out,*.toc " Latex Indermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " Binary Imgs
set wildignore+=*.tar,*.tar.gz,*.xz " Archives
set wildignore+=*.rpm,*.pkg, " Packages
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled Object files
set wildignore+=*.spl " Compiled speolling world list
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.DS_Store " OSX SHIT
set wildignore+=*.luac " Lua byte code
set wildignore+=migrations " Django migrations
set wildignore+=*.pyc " Python Object codes
set wildignore+=*.orig " Merge resolution files
set wildignore+=*.class " java/scala class files
set wildignore+=*/target/* " sbt target dires `,`. You can use space
                           " in your local
" set completeopt=menu,longest
set completeopt=menu,menuone,noselect
" automatically open and close the popup menu / preview window
" augroup vimmic_popup_menu
"     autocmd CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
" augroup END
