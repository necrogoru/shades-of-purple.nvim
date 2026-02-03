---@class Palette
local ret = {
  -- Base colors
  bg = "#2D2B55",
  bg_dark = "#1E1E3F",
  bg_darker = "#1F1F41",
  bg_lighter = "#28284E",
  fg = "#FFFFFF",
  fg_dark = "#A599E9",
  fg_darker = "#CEC5FF",

  -- Accent colors
  purple = "#B362FF",
  purple_bright = "#AD70FC",
  purple_dark = "#5D37F0",
  purple_lighter = "#FB94FF",

  yellow = "#FAD000",
  yellow_light = "#FFEE80",

  orange = "#FF9D00",
  orange_light = "#FFB454",
  orange_dark = "#FF7200",

  green = "#3AD900",
  green_light = "#A5FF90",
  green_bright = "#92FC79",
  green_dark = "#35AD68",

  cyan = "#9EFFFF",
  cyan_light = "#80FCFF",
  cyan_dark = "#80FFBB",

  red = "#EC3A37",
  red_light = "#F16E6B",

  pink = "#FF628C",
  pink_bright = "#FF2C70",

  blue = "#7857FE",
  blue_bright = "#6943FF",

  -- UI colors
  border = "#1E1E3F",
  border_highlight = "#25254B",
  selection = "#4D4570",
  selection_inactive = "#3A3A5A",
  search = "#4D4570",
  match = "#4D4570",

  -- Editor specific
  line_highlight = "#1F1F41",
  line_number = "#A599E9",
  cursor = "#FAD000",
  whitespace = "#6B6B9F",
  indent_guide = "#A599E9",
  indent_guide_active = "#A599E9",

  -- Git colors
  git_add = "#3AD900",
  git_change = "#FAD000",
  git_delete = "#EC3A37",
  git_ignore = "#A599E9",

  -- Diagnostic colors
  error = "#EC3A37",
  warning = "#FAD000",
  info = "#9EFFFF",
  hint = "#A599E9",

  -- Special
  none = "NONE",
}

return ret
