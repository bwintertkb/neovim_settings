require("godbolt").setup({
    languages = {
        rust = { compiler = "r1900", options = {
			userArguments = "-C opt-level=3 -C codegen-units=1 -C target-cpu=native"
		}, ask = false },
        -- any_additional_filetype = { compiler = ..., options = ... },
    },
    auto_cleanup = true, -- remove highlights and autocommands on buffer close
    highlight = {
        cursor = "Visual", -- `cursor = false` to disable
        -- values in this table can be:
        -- 1. existing highlight group
        -- 2. hex color string starting with #
        static = { "#222222", "#333333", "#444444", "#555555", "#444444", "#333333" },
        -- `static = false` to disable
    },
    -- `highlight = false` to disable highlights
    quickfix = {
        enable = false, -- whether to populate the quickfix list in case of errors
        auto_open = false -- whether to open the quickfix list in case of errors
    },
    url = "https://godbolt.org" -- can be changed to a different godbolt instance
})
