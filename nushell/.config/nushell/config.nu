let base00 = "#1e1e2e" # Default Background
let base01 = "#313244" # Lighter Background (Used for status bars, line number, folding marks)
let base02 = "#45475a" # Selection Background
let base03 = "#585b70" # Comments, Invisibles, Line Highlighting
let base04 = "#bac2de" # Dark Foreground (Used for status bars)
let base05 = "#cdd6f4" # Default Foreground, Caret, Delimiters, Operators
let base06 = "#f5e0dc" # Light Foreground (Not often used)
let base07 = "#f2cdcd" # Light Background (Not often used)
let base08 = "#f38ba8" # Variables, XML Tags, Markup Link Text, Markup Lists, Diff Deleted
let base09 = "#fab387" # Integers, Boolean, Constants, XML Attributes, Markup Link Url
let base0a = "#f9e2af" # Classes, Markup Bold, Search Text Background
let base0b = "#a6e3a1" # Strings, Inherited Class, Markup Code, Diff Inserted
let base0c = "#94e2d5" # Support, Regular Expressions, Escape Characters, Markup Quotes
let base0d = "#89b4fa" # Functions, Methods, Attribute IDs, Headings
let base0e = "#cba6f7" # Keywords, Storage, Selector, Markup Italic, Diff Changed
let base0f = "#f2cdcd" # Deprecated, Opening/Closing Embedded Language Tags, e.g. <?php ?>

let base16_theme = {
    separator: $base03
    leading_trailing_space_bg: $base04
    header: $base0b
    date: $base0e
    filesize: $base0d
    row_index: $base0c
    bool: $base08
    int: $base0b
    duration: $base08
    range: $base08
    float: $base08
    string: $base04
    nothing: $base08
    binary: $base08
    cellpath: $base08
    hints: dark_gray

    # shape_garbage: { fg: $base07 bg: $base08 attr: b} # base16 white on red
    # but i like the regular white on red for parse errors
    shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
    shape_bool: $base0d
    shape_int: { fg: $base0e attr: b}
    shape_float: { fg: $base0e attr: b}
    shape_range: { fg: $base0a attr: b}
    shape_internalcall: { fg: $base0c attr: b}
    shape_external: $base0c
    shape_externalarg: { fg: $base0b attr: b}
    shape_literal: $base0d
    shape_operator: $base0a
    shape_signature: { fg: $base0b attr: b}
    shape_string: $base0b
    shape_filepath: $base0d
    shape_globpattern: { fg: $base0d attr: b}
    shape_variable: $base0e
    shape_flag: { fg: $base0d attr: b}
    shape_custom: {attr: b}
}

$env.config = {
  buffer_editor: 'nvim',
  edit_mode: 'vi',
  show_banner: false, 
  color_config: $base16_theme,
  table: {
    mode: light
  }
}

use ~/.cache/starship/init.nu

alias k = kubectl 
alias d = docker
alias k = kubectl
alias nv = nvim
alias zj = zellij

alias stow = stow -vt ~
alias lab = cd ~/lab/ 
alias jm = cd ~/lab/github/jessemolina/

