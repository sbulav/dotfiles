local M = {}

M.search_dotfiles = function()
    require("telescope.builtin").find_files {
        prompt_title = "< Find dotfiles >",
        cwd = "$HOME/dotfiles/",
    }
end

M.search_plugins = function()
    require("telescope.builtin").find_files {
        prompt_title = "< Find nVim plugins >",
        cwd = "$HOME/dotfiles/nvim/lua/plugins/",
    }
end

M.search_in_cwd = function()
    require("telescope.builtin").find_files {
        prompt_title = "< Find in Current Directory >",
        cwd = vim.fn.expand "%:p:h",
    }
end

M.grep_in_cwd = function()
    require("telescope.builtin").live_grep {
        prompt_title = "< Grep in Current Directory >",
        cwd = vim.fn.expand "%:p:h",
    }
end

M.grep_in_git_root = function()
    require("telescope.builtin").live_grep {
        prompt_title = "< Grep in Current Directory >",
        cwd = Snacks.git.get_root(path),
    }
end

M.search_vimfiles = function()
    require("telescope.builtin").find_files {
        prompt_title = "< Find Vimfiles >",
        cwd = "$HOME/dotfiles/nvim",
    }
end

M.search_nixfiles = function()
    require("telescope.builtin").find_files {
        prompt_title = "< Find Nixfiles >",
        cwd = "$HOME/dotnix",
    }
end

return M
