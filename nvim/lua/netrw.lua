-- Nerdtree like sidepanel
-- absolute width of netrw window
-- vim.g.netrw_winsize = -50

-- do not display info on the top of window
vim.g.netrw_banner = 1

-- Open file in new tab
vim.g.netrw_browse_split = 1

-- sort is affecting only: directories on the top, files below
-- vim.g.netrw_sort_sequence = '[\/]$,*'

-- Hide some of the files in explorer
vim.g.netrw_list_hide = '.*\\.swp$,.*\\.pyc$,^\\.git/$,^tags$,^\\.vagrant/$'

-- variable for use by ToggleNetrw function
vim.g.NetrwIsOpen = 0

-- Lexplore toggle function
ToggleNetrw = function()
  if vim.g.NetrwIsOpen == 1 then
    local i = vim.api.nvim_get_current_buf()
    while i >= 1 do
      if vim.bo.filetype == "netrw" then
        vim.cmd([[ silent exe "bwipeout " . ]] .. i )
      end
      i = i - 1
    end
    vim.g.NetrwIsOpen = 0
    vim.g.netrw_liststyle = 0
    vim.g.netrw_chgwin = -1
  else
    vim.g.NetrwIsOpen = 1
    vim.g.netrw_liststyle = 3
    vim.cmd([[silent Lexplore]])
  end
end

vim.api.nvim_set_keymap('n', '<F3>', ':lua ToggleNetrw()<cr><paste>', { noremap = true, silent = false })
