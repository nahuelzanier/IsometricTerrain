extends Area2D

onready var dest_position = position
var tile_tag

func _ready():
	$MoveTimer.start()
	$TerrainTimer.start()
	var isoPos = Global._pos_to_iso(position)
	var on_tile = CurrentMap.map[isoPos.y][isoPos.x]
	tile_tag = on_tile.tag

func _process(delta):
	position = dest_position

func try_to_move():
	var iso_pos = Global._pos_to_iso(position)
	var x = iso_pos.x
	var y = iso_pos.y
	var positions = [[x+1,y],[x-1,y],[x,y+1],[x,y-1]]
	randomize()
	positions.shuffle()
	for pair in positions:
		CurrentMap.map[pair[1]][pair[0]].moving_water_wisp(self)

func move(iso_x, iso_y):
	dest_position = Global._iso_to_pos(iso_x, iso_y)

func _on_Timer_timeout():
	try_to_move()

func go_to_sleep():
	CurrentMap.map_manager.replace_entity(self, Tags.et_wisp)

func _on_TerrainTimer_timeout():
	var isoPos = Global._pos_to_iso(position)
	var on_tile = CurrentMap.map[isoPos.y][isoPos.x]
	on_tile.water_wisp_is_on(self)

func move_away_from_each_other(mult):
	pass

func _on_WaterWisp_area_entered(area):
	try_to_move()

