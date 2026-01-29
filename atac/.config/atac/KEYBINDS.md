# ATAC Vim Keybindings

## Navigation

| Key | Action |
|-----|--------|
| `h` | Move left |
| `j` | Move down |
| `k` | Move up |
| `l` | Move right |
| `Esc` | Go back |
| `Enter` | Select |

Arrow keys available as alternatives.

## Main Menu

| Key | Action |
|-----|--------|
| `q` | Exit |
| `h` | Unselect request |
| `l` | Expand collection |
| `Ctrl-Up` | Move request up |
| `Ctrl-Down` | Move request down |
| `Shift-E` | Next environment |
| `Ctrl-e` | Environment editor |
| `Shift-C` | Cookies |
| `Shift-L` | Logs |
| `Ctrl-h` | Help |

## Request

| Key | Action |
|-----|--------|
| `Space` | Send request |
| `Ctrl-Enter` | Send request (alt) |
| `u` | Change URL |
| `m` | Change method |
| `s` | Request settings |
| `v` | Toggle view (params/results) |
| `Ctrl-e` | Export request |

## Tab Navigation

| Key | Action |
|-----|--------|
| `]` | Next param tab |
| `[` | Previous param tab |
| `}` | Next result tab |
| `{` | Previous result tab |

## Param Tabs

| Key | Action |
|-----|--------|
| `a` | Change auth method |
| `b` | Change body content type |
| `Shift-M` | Change WebSocket message type |

## Result Tabs

| Key | Action |
|-----|--------|
| `h/j/k/l` | Scroll |
| `y` | Yank response |

## List & Table Actions

| Key | Action |
|-----|--------|
| `n` | Create |
| `d` | Delete |
| `r` | Rename |
| `t` | Toggle |
| `y` | Duplicate |
| `Enter` | Edit |

## Text Input

| Key | Action |
|-----|--------|
| `Enter` | Confirm |
| `Esc` | Cancel |
| `Delete` | Delete backward |
| `Backspace` | Delete forward |
| `Left/Right` | Move cursor |
| `Home/End` | Line start/end |

## Text Areas (Request Body)

Uses `VimEmulation` mode with full vim keybindings:
- Normal mode: `hjkl`, `w`, `b`, `0`, `$`, `gg`, `G`
- Insert mode: `i`, `a`, `o`, `O`
- Visual mode: `v`
- Commands: `dd`, `yy`, `p`, `u`, `Ctrl-r`
- Search: `/`, `?`, `n`, `N`
