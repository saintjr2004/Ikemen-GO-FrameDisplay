-- FRAME DISPLAY by jay_ts
-- Training pause menu toggle. The item is declared in +system.def.

local off = 0

menu.t_itemname.framedisplay = function(t, item, cursorPosY, moveTxt, sec)
	if getInput(-1, sec.menu.add.key) or getInput(-1, sec.menu.subtract.key) then
		off = 1 - off
		sndPlay(motif.Snd, sec.cursor.move.snd[1], sec.cursor.move.snd[2])
		t.items[item].vardisplay = menu.f_vardisplay('framedisplay')
	end
	return true
end

menu.t_vardisplay.framedisplay = function()
	return off == 1 and 'Off' or 'On'
end

-- Read by jayframedisplay.zss
hook.add('loop#training', 'jayframedisplay', function()
	for p = 1, 8 do
		if player(p) then mapSet('jayframedisplay_menuoff', off) end
	end
end)

-- Place the item above the Training Menu's Back (modules load before the menus are built)
local order = motif.pause_menu.training_pause_menu.menu.itemname_order
for i = #order, 1, -1 do
	if order[i] == 'menutraining_framedisplay' then table.remove(order, i) end
end
local pos = #order + 1
for i, v in ipairs(order) do
	if v == 'menutraining_back' then pos = i break end
end
table.insert(order, pos, 'menutraining_framedisplay')