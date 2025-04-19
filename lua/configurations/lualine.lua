-- Not used yet but might add to the config at some point
local function japanize(s)
    local english_to_japanese = {
        ["NORMAL"] = "マルコマ",
        ["INSERT"] = "",
        ["VISUAL"] = "ビジュアル",
        ["V - LINE"] = "V - 列",
        ["V - BLOCK"] = "V - ブロック",
        ["V - REPLACE"] = "V - REPLACE",
        ["O - PENDING"] = "",
        ["S - LINE"] = "",
        ["S - BLOCK"] = "",
        ["TERMINAL"] = "端末",
        ["SELECT"] = "",
        ["REPLACE"] = "",
        ["COMMAND"] = "コマンド",
        ["EX"] = "実行",
        ["MORE"] = "余計",
        ["CONFIRM"] = "",
        ["SHELL"] = "",
    }
    if english_to_japanese[s] ~= "" then
        return english_to_japanese[s]
    else
        return s
    end
end


require('lualine').setup {
    options = {
        icons_enabled = true,
        --theme = 'vscode',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            -- statusline = {"oil"},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { function() return "" end, 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename', { 'filesize', fmt = function(s) return "[" .. s .. "]" end } },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location', }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
