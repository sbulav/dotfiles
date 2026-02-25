return {
    -- "l-lin/jira.nvim",
    dir = "~/git_priv/jira.nvim",

    event = "VeryLazy",
    dependencies = {
        "folke/snacks.nvim",
        "MeanderingProgrammer/render-markdown.nvim", -- optional
    },
    cmd = { "JiraIssues", "JiraEpic", "JiraStartWorkingOn" },
    opts = {
        layout = {
            issues = { preset = "telescope", reverse = true },
            epic_issues = { preset = "telescope", reverse = true },
            epics = { preset = "telescope", reverse = true, layout = { max_width = 120 } },
            actions = { preset = "telescope", reverse = true, layout = { max_width = 150 } },
            sprints = { preset = "telescope", reverse = true, layout = { max_width = 150 } },
        },
        debug = false,
        cache = {
            enabled = true,
            cache_ttl = 300,
        },
        cli = {
            epic_filter_method = "epic_link",
            -- Configuration for fetching current sprint issues
            issues = {
                args = { "sprint", "list", "--current" },
                columns = { "type", "key", "assignee", "status", "summary", "labels" },
                filters = { "-s~closed" },
                order_by = "status",
                -- Prefill search prompt, e.g. add your name to pre-filter your assigned issues
                prefill_search = "",
            },
            -- Configuration for listing epics
            epics = {
                args = { "issue", "list", "--type", "Epic", "-a", "s.bulavintsev" },
                columns = { "key", "summary", "status" },
                filters = { "-s~done", "-s~closed" },
                order_by = "created",
                prefill_search = "",
            },

            -- Configuration for fetching issues within an epic
            epic_issues = {
                args = { "issue", "list" },
                columns = { "type", "key", "assignee", "status", "summary", "labels" },
                filters = { "-s~done", "-s~closed" },
                order_by = "status",
                prefill_search = "",
            },
        },
        action = {
            create = {
                default_fields = {
                    Project = vim.env.JIRA_PROJECT_KEY or "TPL",
                    Type = "Task",
                    Assignee = vim.env.JIRA_ASSIGNEE or vim.env.JIRA_USER or "",
                    Components = "K8s & RnD",
                    Labels = "k8s",
                },
                available_components = {
                    "K8s for Internal IT",
                    "K8s & RnD",
                    "Vault \\ Keycloak",
                },
                template = [[
Необходимо:
Полезную информацию можно найти здесь:
* 
h2. Критерий принятия:
* 1
* 2
* 3
]],
            },
        },
    },
}
