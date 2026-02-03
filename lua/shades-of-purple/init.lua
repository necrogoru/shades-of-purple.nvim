local M = {}

-- Load color palette
local colors = require("shades-of-purple.colors")

-- Theme setup function
function M.setup(opts)
  opts = opts or {}

  -- Reset highlights
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.o.termguicolors = true
  vim.g.colors_name = "shades-of-purple"

  M.load(opts)
end

-- Load all highlight groups
function M.load(opts)
  local c = colors

  local highlights = {
    -- Editor highlights
    Normal = { fg = c.fg, bg = c.bg },
    NormalFloat = { fg = c.fg, bg = c.bg_dark },
    NormalNC = { fg = c.fg, bg = c.bg },

    -- Cursor
    Cursor = { fg = c.bg, bg = c.cursor },
    CursorLine = { bg = c.line_highlight },
    CursorColumn = { bg = c.line_highlight },
    CursorLineNr = { fg = c.yellow, bg = c.line_highlight, bold = true },
    LineNr = { fg = c.line_number },

    -- Visual selection
    Visual = { bg = c.selection, fg = c.fg },
    VisualNOS = { bg = c.selection, fg = c.fg },

    -- Search
    Search = { bg = c.search, fg = c.yellow },
    IncSearch = { bg = c.search, fg = c.yellow, bold = true },
    CurSearch = { bg = c.search, fg = c.yellow, bold = true },

    -- UI Elements
    SignColumn = { fg = c.line_number, bg = c.bg_lighter },
    FoldColumn = { fg = c.fg_dark, bg = c.bg },
    Folded = { fg = c.fg_dark, bg = c.bg_darker },
    VertSplit = { fg = c.border },
    WinSeparator = { fg = c.border },
    ColorColumn = { bg = c.line_highlight },

    -- Statusline
    StatusLine = { fg = c.fg_dark, bg = c.bg_dark },
    StatusLineNC = { fg = c.fg_dark, bg = c.bg_dark },

    -- Tabline
    TabLine = { fg = c.fg_dark, bg = c.bg },
    TabLineFill = { bg = c.bg },
    TabLineSel = { fg = c.fg, bg = c.bg_dark },

    -- Popups and menus
    Pmenu = { fg = c.fg_dark, bg = c.bg_darker },
    PmenuSel = { fg = c.fg, bg = c.bg },
    PmenuSbar = { bg = c.bg_darker },
    PmenuThumb = { bg = c.fg_dark },

    -- Messages
    ErrorMsg = { fg = c.error },
    WarningMsg = { fg = c.warning },
    ModeMsg = { fg = c.fg },
    MoreMsg = { fg = c.cyan },
    Question = { fg = c.cyan },

    -- Diff
    DiffAdd = { bg = "#1a3a1a" },
    DiffChange = { bg = "#3a3a1a" },
    DiffDelete = { bg = "#3a1a1a", fg = c.red },
    DiffText = { bg = "#3a3a1a" },

    -- Spell
    SpellBad = { sp = c.error, undercurl = true },
    SpellCap = { sp = c.warning, undercurl = true },
    SpellLocal = { sp = c.info, undercurl = true },
    SpellRare = { sp = c.hint, undercurl = true },

    -- Whitespace
    Whitespace = { fg = c.whitespace },
    NonText = { fg = c.whitespace },
    SpecialKey = { fg = c.whitespace },

    -- Syntax highlighting
    Comment = { fg = c.purple, italic = true },

    Constant = { fg = c.pink },
    String = { fg = c.green_light },
    Character = { fg = c.green_bright },
    Number = { fg = c.pink },
    Boolean = { fg = c.pink },
    Float = { fg = c.pink },

    Identifier = { fg = c.cyan },
    Function = { fg = c.yellow },

    Statement = { fg = c.orange, italic = true },
    Conditional = { fg = c.orange, italic = true },
    Repeat = { fg = c.orange, italic = true },
    Label = { fg = c.orange },
    Operator = { fg = c.orange },
    Keyword = { fg = c.orange, italic = true },
    Exception = { fg = c.orange, italic = true },

    PreProc = { fg = c.yellow },
    Include = { fg = c.orange },
    Define = { fg = c.orange },
    Macro = { fg = c.yellow },
    PreCondit = { fg = c.orange },

    Type = { fg = c.cyan },
    StorageClass = { fg = c.purple_lighter, italic = true },
    Structure = { fg = c.cyan },
    Typedef = { fg = c.cyan },

    Special = { fg = c.yellow_light },
    SpecialChar = { fg = c.yellow_light },
    Tag = { fg = c.cyan },
    Delimiter = { fg = c.fg },
    SpecialComment = { fg = c.purple, italic = true },
    Debug = { fg = c.red },

    Underlined = { underline = true },
    Ignore = { fg = c.fg_dark },
    Error = { fg = c.error },
    Todo = { fg = c.yellow, bg = c.bg, bold = true },

    -- Treesitter highlights
    ["@variable"] = { fg = c.fg },
    ["@variable.builtin"] = { fg = c.purple_lighter, italic = true },
    ["@variable.parameter"] = { fg = c.cyan },
    ["@variable.member"] = { fg = c.yellow_light },

    ["@constant"] = { fg = c.pink },
    ["@constant.builtin"] = { fg = c.pink },
    ["@constant.macro"] = { fg = c.pink },

    ["@module"] = { fg = c.cyan },
    ["@label"] = { fg = c.orange },

    ["@string"] = { fg = c.green_light },
    ["@string.escape"] = { fg = c.yellow_light },
    ["@string.regexp"] = { fg = c.purple_lighter },
    ["@string.special"] = { fg = c.green_bright },

    ["@character"] = { fg = c.green_bright },
    ["@number"] = { fg = c.pink },
    ["@boolean"] = { fg = c.pink },
    ["@float"] = { fg = c.pink },

    ["@function"] = { fg = c.yellow },
    ["@function.builtin"] = { fg = c.orange },
    ["@function.macro"] = { fg = c.yellow },
    ["@function.method"] = { fg = c.yellow },

    ["@constructor"] = { fg = c.cyan },
    ["@operator"] = { fg = c.orange },

    ["@keyword"] = { fg = c.orange, italic = true },
    ["@keyword.function"] = { fg = c.purple_lighter, italic = true },
    ["@keyword.operator"] = { fg = c.orange, italic = true },
    ["@keyword.return"] = { fg = c.orange, italic = true },
    ["@keyword.conditional"] = { fg = c.orange, italic = true },
    ["@keyword.repeat"] = { fg = c.orange, italic = true },
    ["@keyword.import"] = { fg = c.orange, italic = true },
    ["@keyword.exception"] = { fg = c.orange, italic = true },

    ["@type"] = { fg = c.cyan },
    ["@type.builtin"] = { fg = c.purple_lighter, italic = true },
    ["@type.qualifier"] = { fg = c.orange, italic = true },

    ["@attribute"] = { fg = c.yellow, italic = true },
    ["@property"] = { fg = c.yellow_light },

    ["@comment"] = { fg = c.purple, italic = true },
    ["@comment.documentation"] = { fg = c.purple, italic = true },

    ["@punctuation.delimiter"] = { fg = c.fg },
    ["@punctuation.bracket"] = { fg = c.fg },
    ["@punctuation.special"] = { fg = c.yellow_light },

    ["@tag"] = { fg = c.cyan },
    ["@tag.attribute"] = { fg = c.yellow },
    ["@tag.delimiter"] = { fg = c.cyan },

    ["@markup.strong"] = { bold = true },
    ["@markup.italic"] = { italic = true },
    ["@markup.underline"] = { underline = true },
    ["@markup.strike"] = { strikethrough = true },
    ["@markup.heading"] = { fg = c.yellow, bold = true },
    ["@markup.link"] = { fg = c.purple, underline = true },
    ["@markup.link.url"] = { fg = c.fg_dark },
    ["@markup.raw"] = { fg = c.cyan },
    ["@markup.list"] = { fg = c.yellow },
    ["@markup.quote"] = { fg = c.fg_dark, italic = true },

    -- LSP semantic tokens
    ["@lsp.type.class"] = { fg = c.cyan },
    ["@lsp.type.decorator"] = { fg = c.yellow },
    ["@lsp.type.enum"] = { fg = c.cyan },
    ["@lsp.type.enumMember"] = { fg = c.pink },
    ["@lsp.type.function"] = { fg = c.yellow },
    ["@lsp.type.interface"] = { fg = c.cyan },
    ["@lsp.type.macro"] = { fg = c.yellow },
    ["@lsp.type.method"] = { fg = c.yellow },
    ["@lsp.type.namespace"] = { fg = c.cyan },
    ["@lsp.type.parameter"] = { fg = c.cyan },
    ["@lsp.type.property"] = { fg = c.yellow_light },
    ["@lsp.type.struct"] = { fg = c.cyan },
    ["@lsp.type.type"] = { fg = c.cyan },
    ["@lsp.type.typeParameter"] = { fg = c.cyan },
    ["@lsp.type.variable"] = { fg = c.fg },

    -- LSP diagnostics
    DiagnosticError = { fg = c.error },
    DiagnosticWarn = { fg = c.warning },
    DiagnosticInfo = { fg = c.info },
    DiagnosticHint = { fg = c.hint },

    DiagnosticUnderlineError = { sp = c.error, undercurl = true },
    DiagnosticUnderlineWarn = { sp = c.warning, undercurl = true },
    DiagnosticUnderlineInfo = { sp = c.info, undercurl = true },
    DiagnosticUnderlineHint = { sp = c.hint, undercurl = true },

    DiagnosticVirtualTextError = { fg = c.error },
    DiagnosticVirtualTextWarn = { fg = c.warning },
    DiagnosticVirtualTextInfo = { fg = c.info },
    DiagnosticVirtualTextHint = { fg = c.hint },

    -- Git signs
    GitSignsAdd = { fg = c.git_add },
    GitSignsChange = { fg = c.git_change },
    GitSignsDelete = { fg = c.git_delete },

    -- Telescope
    TelescopeBorder = { fg = c.border },
    TelescopePromptBorder = { fg = c.border },
    TelescopeResultsBorder = { fg = c.border },
    TelescopePreviewBorder = { fg = c.border },
    TelescopeSelection = { fg = c.fg, bg = c.bg },
    TelescopeSelectionCaret = { fg = c.yellow },
    TelescopeMatching = { fg = c.yellow },
    TelescopePromptPrefix = { fg = c.yellow },

    -- NvimTree
    NvimTreeFolderIcon = { fg = c.yellow },
    NvimTreeFolderName = { fg = c.fg_dark },
    NvimTreeOpenedFolderName = { fg = c.fg, bold = true },
    NvimTreeRootFolder = { fg = c.purple, bold = true },
    NvimTreeGitDirty = { fg = c.git_change },
    NvimTreeGitNew = { fg = c.git_add },
    NvimTreeGitDeleted = { fg = c.git_delete },
    NvimTreeSpecialFile = { fg = c.yellow },
    NvimTreeIndentMarker = { fg = c.indent_guide },

    -- Bufferline
    BufferLineFill = { bg = c.bg },
    BufferLineBackground = { fg = c.fg_dark, bg = c.bg },
    BufferLineBuffer = { fg = c.fg_dark, bg = c.bg },
    BufferLineBufferSelected = { fg = c.fg, bg = c.bg_dark, bold = true },
    BufferLineBufferVisible = { fg = c.fg_dark, bg = c.bg },
    BufferLineTab = { fg = c.fg_dark, bg = c.bg },
    BufferLineTabSelected = { fg = c.fg, bg = c.bg_dark },
    BufferLineModified = { fg = c.git_change },
    BufferLineModifiedSelected = { fg = c.git_change, bg = c.bg_dark },

    -- Lualine
    LualineNormal = { fg = c.fg, bg = c.bg_dark },
    LualineInsert = { fg = c.bg, bg = c.green },
    LualineVisual = { fg = c.bg, bg = c.purple },
    LualineReplace = { fg = c.bg, bg = c.red },
    LualineCommand = { fg = c.bg, bg = c.yellow },

    -- Indent Blankline
    IblIndent = { fg = c.indent_guide },
    IblScope = { fg = c.indent_guide_active },

    -- Which Key
    WhichKey = { fg = c.yellow },
    WhichKeyGroup = { fg = c.cyan },
    WhichKeyDesc = { fg = c.fg },
    WhichKeySeparator = { fg = c.fg_dark },
    WhichKeyFloat = { bg = c.bg_dark },

    -- Noice
    NoicePopup = { bg = c.bg_dark },
    NoicePopupBorder = { fg = c.border },
    NoiceCmdlinePopup = { bg = c.bg_dark },
    NoiceCmdlinePopupBorder = { fg = c.border },

    -- Flash
    FlashLabel = { fg = c.bg, bg = c.yellow, bold = true },
    FlashMatch = { fg = c.yellow },
    FlashCurrent = { fg = c.orange },

    -- Copilot
    CopilotSuggestion = { fg = c.fg_dark, italic = true },

    -- Dashboard
    DashboardShortCut = { fg = c.yellow },
    DashboardHeader = { fg = c.purple },
    DashboardCenter = { fg = c.cyan },
    DashboardFooter = { fg = c.fg_dark, italic = true },

    -- Trouble
    TroubleText = { fg = c.fg },
    TroubleSource = { fg = c.fg_dark },
    TroubleCode = { fg = c.cyan },

    -- Notify
    NotifyERRORBorder = { fg = c.error },
    NotifyWARNBorder = { fg = c.warning },
    NotifyINFOBorder = { fg = c.info },
    NotifyDEBUGBorder = { fg = c.hint },
    NotifyTRACEBorder = { fg = c.purple },
    NotifyERRORIcon = { fg = c.error },
    NotifyWARNIcon = { fg = c.warning },
    NotifyINFOIcon = { fg = c.info },
    NotifyDEBUGIcon = { fg = c.hint },
    NotifyTRACEIcon = { fg = c.purple },
    NotifyERRORTitle = { fg = c.error },
    NotifyWARNTitle = { fg = c.warning },
    NotifyINFOTitle = { fg = c.info },
    NotifyDEBUGTitle = { fg = c.hint },
    NotifyTRACETitle = { fg = c.purple },
  }

  -- Apply highlights
  for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

-- Load the theme
function M.colorscheme()
  M.setup()
end

return M
