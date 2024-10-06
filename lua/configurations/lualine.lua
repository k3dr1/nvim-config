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
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = {function() return "" end, 'mode'},
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

--local colors = {
--  blue   = '#80a0ff',
--  cyan   = '#79dac8',
--  black  = '#1e1e1e',
--  white  = '#c6c6c6',
--  red    = '#ff5189',
--  violet = '#d183e8',
--  grey   = '#303030',
--}
--
--local theme = {
--  normal = {
--    a = { fg = colors.black, bg = colors.violet },
--    b = { fg = colors.white, bg = colors.grey },
--    c = { fg = colors.black, bg = colors.black },
--  },
--
--  insert = { a = { fg = colors.black, bg = colors.blue } },
--  visual = { a = { fg = colors.black, bg = colors.cyan } },
--  replace = { a = { fg = colors.black, bg = colors.red } },
--
--  inactive = {
--    a = { fg = colors.white, bg = colors.black },
--    b = { fg = colors.white, bg = colors.black },
--    c = { fg = colors.black, bg = colors.black },
--  },
--}
--
--
--require('lualine').setup {
--  options = {
--    theme = theme,
--    component_separators = '|',
--    section_separators = { left = '', right = '' },
--  },
--  sections = {
--    lualine_a = {
--      { 'mode', separator = { left = '' }, right_padding = 2 },
--    },
--    lualine_b = { 'filename', 'branch' },
--    lualine_c = {},
--    lualine_x = {},
--    lualine_y = { 'filetype', 'progress' },
--    lualine_z = {
--      { 'location', separator = { right = '' }, left_padding = 2 },
--    },
--  },
--  inactive_sections = {
--    lualine_a = { 'filename' },
--    lualine_b = {},
--    lualine_c = {},
--    lualine_x = {},
--    lualine_y = {},
--    lualine_z = { 'location' },
--  },
--  tabline = {},
--  extensions = {},
--}
