local tabnine = prequire "cmp_tabnine.config"
if not tabnine then
    return
end

tabnine:setup {
    max_lines = 1000,
    max_num_results = 20,
    sort = true,
    run_on_every_keystroke = true,
    snippet_placeholder = "..",
}
