local M = {}

M.search_dotfiles = function() 
    require("telescope.builtin").find_files({
        prompt_title = "< Find dotfiles >",
        cwd = "$HOME/dotfiles/",
    })
end

M.search_vimfiles = function() 
    require("telescope.builtin").find_files({
        prompt_title = "< Find Vimfiles >",
        cwd = "$HOME/dotfiles/nvim",
    })
end

return M
