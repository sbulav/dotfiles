return {
    "sbulav/jira-oil.nvim",
    -- dir = "/home/sab/git_priv/jira-oil.nvim",
    -- Load on demand via keymaps
    keys = {
        {
            "<leader>jj",
            function()
                require("jira-oil").open "all"
            end,
            desc = "JiraOil: all",
        },
        {
            "<leader>js",
            function()
                require("jira-oil").open "sprint"
            end,
            desc = "JiraOil: sprint",
        },
        {
            "<leader>jc",
            function()
                require("jira-oil.scratch").open_new()
            end,
            desc = "JiraOil: create issue",
        },
    },
    config = function()
        require("jira-oil").setup {
            defaults = {
                project = "TPL",
                -- assignee defaults to vim.env.JIRA_USER or vim.env.JIRA_ASSIGNEE or ""
            },
            -- Optional: set this only if your Jira stores Epic link in a custom field.
            -- epic_field = "customfield_12311",
            create = {
                available_components = {
                    "K8s for Internal IT",
                    "K8s & RnD",
                    "Vault \\ Keycloak",
                },
            },
            cli = {
                issues = {
                    team_jql = "assignee in membersOf('Технический департамент :: Команда K8S')",
                    status_jql = "status!=Closed",
                },
                epics = {
                    args = { "issue", "list", "--type", "Epic", "-a", "s.bulavintsev" },
                    columns = { "key", "summary", "status" },
                    filters = { "-s~done", "-s~closed" },
                    order_by = "created",
                    prefill_search = "",
                },
                epic_issues = {
                    args = { "issue", "list" },
                    columns = { "type", "key", "assignee", "status", "summary", "labels" },
                    filters = { "-s~done", "-s~closed" },
                    order_by = "status",
                    prefill_search = "",
                },
            },
        }
    end,
}
