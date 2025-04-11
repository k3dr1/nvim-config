require("fzf-lua").setup(
    {
        fzf_colors = {
            -- "fg" as the first element of the table 
            -- here means grab the foreground of the highlight group
            -- ["fg+"] =    { "fg", "Title", },
            ["pointer"] ={ "bg", "CursorLine", },
            ["bg+"] = {"bg", "CursorLine"},
            ["gutter"] = "-1",
        },
        winopts = {
            width = 0.90,
            height = 0.90,
            border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
            backdrop = 100,
            preview = {
                border = { '┌', '─', '┐', '│', '┘', '─', '└', '│' },
                layout = "vertical",
                vertical = "up:50%",
            }
        },
        keymap = {
            builtin = {
                true,
                ["<C-d>"] = "preview-page-down",
                ["<C-u>"] = "preview-page-up",
            },
            fzf = {
                true,
                ["ctrl-d"] = "preview-page-down",
                ["ctrl-u"] = "preview-page-up",
                ["ctrl-q"] = "select-all+accept",
            },
        },
    }
)
