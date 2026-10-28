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

## Training Pause Menu Toggle

The module adds a **Frame Display** On/Off option to the Training Menu of the training pause menu.
It needs `jayframedisplay.lua` and `+system.def`, which IKEMEN only loads automatically from `external/mods`.

## Reading the Frame Meter

Each player has a row of cells, one cell per frame. The colour of a cell shows what that player was doing on that frame.
The config name is the colour's prefix in the [Configuration](#configuration) section (for example, `startup` sets `jayframedisplay_startupR/G/B`).

| Colour (default) | Config name | Meaning |
|---|---|---|
| Dark grey | `blank` | Nothing recorded for this frame. The defender's last stun cell is also cleared when the sequence ends: the defender can already guard on that frame, so dropping it makes the bar match the advantage. |
| Green | `startup` | Attacking, before the first hitbox comes out. Frames during a pause or superpause are not counted. |
| Red | `active` | The current animation frame has a hitbox (Clsn1) and the character is attacking. |
| Pink | `hpActive` | An active frame followed by more hitbox frames that played out during hitpause. This happens when a move keeps animating through hitpause (`AssertSpecial` with `animatehitpause`). Those frames don't get a cell of their own, so the bars stay aligned; the info text shows `+NF active in hitpause` instead. |
| Blue | `recovery` | After the active frames, without a hitbox, until the character returns to a neutral state. |
| Yellow | `idle` | Despite the name, this is the defender's hitstun or blockstun. |
| Cyan | `move` | Walking, running, dashing or backdashing. Also used while the character has a projectile on screen during an attack. |
| Magenta | `proj` | Currently unused. Projectile frames are shown in cyan. |

**Brighter and darker cells**

- A brighter cell marks the defender's first hitstun or blockstun frame, which is where the hit or block landed.
- The row holds `jayframedisplay_items` cells (80 by default). When a sequence fills the row, it wraps back to the left and the previous pass is darkened. New frames are drawn over it from the left, so the dimmed cells to the right are left over from the previous pass.

The brightness change is set by `jayframedisplay_bright` and `jayframedisplay_dark`.

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
map(jayframedisplay_offText169X) := 56;		# Offset X based on widescreen (text)
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

map(jayframedisplay_hpActiveR) := 256;		# Red color value for an "active" cell followed by active frames played during hitpause
map(jayframedisplay_hpActiveG) := 144;		# Green color value for an "active" cell followed by active frames played during hitpause
map(jayframedisplay_hpActiveB) := 176;		# Blue color value for an "active" cell followed by active frames played during hitpause

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