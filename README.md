# Frame Display Module for IKEMEN GO

This is a module for the IKEMEN GO engine that shows a frame meter that contains
various important information like attack durations, advantage frames, blockstring
gaps, wake-up advantage and more.

## Installation

Extract the `jayframedisplay` folder directly into the folder you wish to store it in.
It's recommended you place it in `external/mods` since it is a module.

You will need to make edits to your current IKEMEN config.ini file to "enable" the module.

Under `[Common]`, add `jayframedisplay.zss` to your `States` files and `jayframedisplay.def` to your `Fx` files.

Example with the files stored in `external/mods`:

```
[Common]
...
States  = data/functions.zss, data/action.zss, data/dizzy.zss, data/guardbreak.zss, data/score.zss, data/system.zss, data/tag.zss, data/training.zss, external/mods/jayframedisplay/jayframedisplay.zss
Fx      = data/gofx/gofx.def, external/mods/jayframedisplay/jayframedisplay.def
```

## Configuration

Within `jayframedisplay.zss`, you have several configuration options to tweak the display of the cells and the text information.
Because IKEMEN supports both 4:3 and 16:9 resolutions in the same build, there are visual config options for both resolutions, but if you
are intending to only use one resolution for, say, a fullgame, you can simply ignore the unused resolution options.

```
# ==================================
# CONFIG
# ==================================

map(jayframedisplay_enable) := 1;			# Enable frame display (0 = off, 1 = on)

map(jayframedisplay_p1StartPosX) := 40;		# P1 start X position of the cells
map(jayframedisplay_p1StartPosY) := 190;	# P1 start Y position of the cells
map(jayframedisplay_p2StartPosX) := 40;		# P2 start X position of the cells
map(jayframedisplay_p2StartPosY) := 195;	# P2 start Y position of the cells

map(jayframedisplay_offCell169X) := 57;		# Offset X based on widescreen (cells)
map(jayframedisplay_offCell169Y) := 20;		# Offset Y based on widescreen (cells)
map(jayframedisplay_offText169X) := 90;		# Offset X based on widescreen (text)
map(jayframedisplay_offText169Y) := 20;		# Offset Y based on widescreen (text)

map(jayframedisplay_spacing) := 3;			# Spacing between each cell
map(jayframedisplay_scale) := 0.75;			# Scaling of each cell
map(jayframedisplay_sprPriority) := 20;		# SprPriority of each cell
map(jayframedisplay_onTop) := 1;			# OnTop of each cell

map(jayframedisplay_items) := 80;			# Total amount of cells to draw (max 256)
map(jayframedisplay_dark) := -100;			# Darkening constant on cells
map(jayframedisplay_bright) := 90;			# Brightening constant on cells

map(jayframedisplay_blankR) := 32;			# Red color value for a "blank" cell
map(jayframedisplay_blankG) := 32;			# Green color value for a "blank" cell
map(jayframedisplay_blankB) := 32;			# Blue color value for a "blank" cell

map(jayframedisplay_startupR) := 32;		# Red color value for a "startup" cell
map(jayframedisplay_startupG) := 216;		# Green color value for a "startup" cell
map(jayframedisplay_startupB) := 32;		# Blue color value for a "startup" cell

map(jayframedisplay_activeR) := 256;		# Red color value for an "active" cell
map(jayframedisplay_activeG) := 32;			# Green color value for an "active" cell
map(jayframedisplay_activeB) := 32;			# Blue color value for an "active" cell

map(jayframedisplay_recoveryR) := 72;		# Red color value for a "recovery" cell
map(jayframedisplay_recoveryG) := 32;		# Green color value for a "recovery" cell
map(jayframedisplay_recoveryB) := 256;		# Blue color value for a "recovery" cell

map(jayframedisplay_idleR) := 256;			# Red color value for an "idle" cell
map(jayframedisplay_idleG) := 216;			# Green color value for an "idle" cell
map(jayframedisplay_idleB) := 32;			# Blue color value for an "idle" cell

map(jayframedisplay_moveR) := 0;			# Red color value for a "move" cell
map(jayframedisplay_moveG) := 225;			# Green color value for a "move" cell
map(jayframedisplay_moveB) := 200;			# Blue color value for a "move" cell

map(jayframedisplay_projR) := 256;			# Red color value for a "proj" cell
map(jayframedisplay_projG) := 64;			# Green color value for a "proj" cell
map(jayframedisplay_projB) := 216;			# Blue color value for a "proj" cell

map(jayframedisplay_p1TextPosX) := 39;		# P1 X position for the info text
map(jayframedisplay_p1TextPosY) := 186;		# P1 Y position for the info text
map(jayframedisplay_p2TextPosX) := 39;		# P2 X position for the info text
map(jayframedisplay_p2TextPosY) := 202;		# P2 Y position for the info text

map(jayframedisplay_textFont) := -1;		# Font for the info text
map(jayframedisplay_textBank) := -1;		# Bank for the info text
map(jayframedisplay_textAlign) := 1;		# Alignment for the info text
map(jayframedisplay_textScale) := 0.333;	# Scale for the info text
map(jayframedisplay_textLayer) := 1;		# Layer for the info text

map(jayframedisplay_textPlusR) := 128;		# Red value for the info text (+oB)
map(jayframedisplay_textPlusG) := 256;		# Green value for the info text (+oB)
map(jayframedisplay_textPlusB) := 128;		# Blue for the info text (+oB)

map(jayframedisplay_textMinusR) := 256;		# Red value for the info text (-oB)
map(jayframedisplay_textMinusG) := 176;		# Green value for the info text (-oB)
map(jayframedisplay_textMinusB) := 176;		# Blue value for the info text (-oB)

# ==================================
```