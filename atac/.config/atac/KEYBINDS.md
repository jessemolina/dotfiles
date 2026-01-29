# ATAC Vim Keybindings Cheatsheet

## Navigation
| Key | Action |
|-----|--------|
| `h` | Move left |
| `j` | Move down |
| `k` | Move up |
| `l` | Move right |
| `Up/Down/Left/Right` | Alternative navigation |
| `Esc` | Go back / Cancel |
| `Enter` | Select / Confirm |

## Main Menu (Collections List)
| Key | Action |
|-----|--------|
| `q` | Exit ATAC |
| `h` | Unselect request |
| `l` | Expand collection |
| `Ctrl-Up` | Move request up |
| `Ctrl-Down` | Move request down |

## Environment & Views
| Key | Action |
|-----|--------|
| `Shift-E` | Next environment |
| `Ctrl-e` | Display environment editor |
| `Shift-C` | Display cookies |
| `Shift-L` | Display logs |
| `v` | Next view (parameter ↔ result) |
| `Ctrl-h` | Display help |

## Request Management
| Key | Action |
|-----|--------|
| `Space` | Send request |
| `Ctrl-Enter` | Alternative send request |
| `u` | Change URL |
| `m` | Change method |
| `s` | Request settings |
| `Ctrl-e` | Export request |

## Tab Navigation
| Key | Action |
|-----|--------|
| `Tab` | Next parameter tab (Query, Headers, Body, Auth) |
| `Shift-Tab` | Previous parameter tab |
| `Ctrl-Tab` | Next result tab (Response, Headers, Cookies) |
| `Ctrl-Shift-Tab` | Previous result tab |

## Text Input Fields
| Key | Action |
|-----|--------|
| `Enter` | Confirm |
| `Esc` | Cancel |
| `Delete` | Delete backward |
| `Backspace` | Delete forward |
| `Left/Right` | Move cursor |
| `Home/End` | Line start/end |

## Text Areas (Request Body) - Vim Mode
**Note:** Text areas use `VimEmulation` mode with full vim keybindings including:
- Normal mode navigation (`hjkl`, `w`, `b`, `0`, `$`, `gg`, `G`)
- Insert mode (`i`, `a`, `o`, `O`)
- Visual mode (`v`)
- Editing commands (`dd`, `yy`, `p`, `u`, `Ctrl-r`)
- Search (`/`, `?`, `n`, `N`)

## List & Table Actions
| Key | Action |
|-----|--------|
| `n` | Create element |
| `d` | Delete element |
| `Enter` | Edit element |
| `r` | Rename element |
| `t` | Toggle element |
| `y` | Duplicate element |

## Result Tabs
| Key | Action |
|-----|--------|
| `k/j` | Scroll up/down |
| `h/l` | Scroll left/right |
| `y` | Yank current result tab |

## Authentication & Body
| Key | Action |
|-----|--------|
| `a` | Change auth method |
| `b` | Change body content type |
| `Shift-M` | Change WebSocket message type |

---
*Press `Ctrl-h` from anywhere in ATAC to see contextual help*