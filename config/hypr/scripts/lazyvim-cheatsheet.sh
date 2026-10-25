#!/usr/bin/env bash

# LazyVim Quick Reference Cheat Sheet
# Formatted for JaKooLit's Rofi Keybinds Theme

read -r -d '' CHEATSHEET <<'EOF'
Key:	Description:	Command / Context:
ESC	close this app	
-- NAVIGATION & MODES --		
h / j / k / l	Left / Down / Up / Right	Normal Mode Motion
w / b	Word forward / backward	Normal Mode Motion
0 / $	Start / End of line	Normal Mode Motion
gg / G	First / Last line of file	Normal Mode Motion
i / ESC	Enter Insert Mode / Normal Mode	Mode Switch
v / V	Visual Selection (character / line)	Mode Switch

-- EDITING --		
u / CTRL r	Undo / Redo	Edit Action
dd / yy / p	Cut line / Copy line / Paste	Edit Action
dw / cw	Delete word / Change word	Edit Action
ci" / ci(	Change inside quotes / parentheses	Edit Action
gcc	Toggle line comment	Edit Action
<Space> c f	Format current file / buffer	LSP Format

-- FILES & SEARCH --		
<Space> <Space>	Find files in project	Fuzzy Finder
<Space> e	Toggle file tree explorer	Neo-tree
<Space> f r	Search recent files	Fuzzy Finder
<Space> /	Search text across project	Grep Search
/	Search inside current file	In-file Search
n / N	Next / Previous search match	Search Navigation

-- BUFFERS & WINDOWS --		
[b / ]b	Previous / Next tab (buffer)	Buffer Switch
<Space> b d	Close current buffer	Buffer Action
<Space> | / -	Split window Vertically / Horizontally	Window Split
CTRL h/j/k/l	Switch split pane focus	Window Navigation
<Space> w d	Close current split pane	Window Action

-- SYSTEM & TERMINAL --		
<Space> f s	Save file	:w
:q	Quit current window	:q
<Space> q q	Quit all (Exit Neovim)	:qa!
<Space> f t	Toggle embedded terminal	Terminal
<Space> g g	Open LazyGit overlay	Git
EOF

# Use JaKooLit's custom keybinds rofi theme for the full-screen layout
echo "$CHEATSHEET" | rofi -dmenu -i -p "LazyVim Quick Cheat Sheet" -config ~/.config/rofi/config-keybinds.rasi
