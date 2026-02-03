# Shades of Purple for Neovim

A professional Neovim port of the popular [Shades of Purple](https://github.com/ahmadawais/shades-of-purple-vscode) VSCode theme.

<img width="495" height="459" alt="Screenshot 2026-02-03 at 6 01 15 PM" src="https://github.com/user-attachments/assets/c5d599dd-79ea-4808-86c2-436a064f5324" />
<img width="484" height="357" alt="Screenshot 2026-02-03 at 6 01 04 PM" src="https://github.com/user-attachments/assets/f1017e42-93b4-4fae-89a2-d10a356ee983" />

## Features

- 🎨 Complete color palette faithful to the original VS Code theme
- 🌳 Full Treesitter support
- 🔍 LSP semantic tokens highlighting
- 🔧 Support for popular plugins:
  - Telescope
  - NvimTree
  - Bufferline
  - Lualine
  - GitSigns
  - Which-Key
  - Noice
  - Flash
  - Copilot
  - Dashboard
  - Trouble
  - Notify

## Installation

### Using lazy.nvim

```lua
{
  dir = "necrogoru/shades-of-purple.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("shades-of-purple").setup()
  end,
}
```

### Using packer.nvim

```lua
use {
  "necrogoru/shades-of-purple.nvim",
  config = function()
    require("shades-of-purple").setup()
  end
}
```

## Usage

### Method 1: Lua API

```lua
require("shades-of-purple").setup()
```

### Method 2: Vim Command

```vim
colorscheme shades-of-purple
```

### Method 3: In your init.lua

```lua
vim.cmd.colorscheme("shades-of-purple")
```

## Color Palette

| Color | Hex | Usage |
|-------|-----|-------|
| Background | `#2D2B55` | Editor background |
| Background Dark | `#1E1E3F` | Sidebar, statusline |
| Foreground | `#FFFFFF` | Main text |
| Purple | `#B362FF` | Comments |
| Yellow | `#FAD000` | Functions, keywords |
| Orange | `#FF9D00` | Keywords, operators |
| Green | `#A5FF90` | Strings |
| Cyan | `#9EFFFF` | Types, identifiers |
| Pink | `#FF628C` | Constants |
| Red | `#EC3A37F5` | Errors |

## Customization

You can customize the theme by passing options to the setup function:

```lua
require("shades-of-purple").setup({
  -- Add your custom options here
})
```

## Tests
To run the tests, use the following command:

```bash
nvim --headless --noplugin -u tests/minimal_init.lua -c "PlenaryBustedDirectory tests/ {minimal_init = 'tests/minimal_init.lua'}"
```

## Credits

Original theme by [Ahmad Awais](https://github.com/ahmadawais)
- [Shades of Purple VSCode Theme](https://github.com/ahmadawais/shades-of-purple-vscode)

Neovim port created based on the original color scheme.

## License

This theme port follows the same spirit as the original Shades of Purple theme.
