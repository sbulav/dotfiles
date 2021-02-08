local map = require('utils').map

-- URL handling
if vim.fn.has("mac") == 1 then
  map[''].gx = {'<Cmd>call jobstart(["open", expand("<cfile>")], {"detach": v:true})<CR>'}
elseif vim.fn.has("unix") == 1 then
  map[''].gx = {'<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>'}
else
  map[''].gx = {'<Cmd>lua print("Error: gx is not supported on this OS!")<CR>'}
end
