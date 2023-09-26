extends Area2D

onready var dest_position = position
var tile_tag

func _ready():
	$TerrainTimer.start()
	var isoPos = Global._pos_to_iso(position)
	var on_tile = CurrentMap.map[isoPos.y][isoPos.x]
	tile_tag = on_tile.tag

func _process(delta):
	position = dest_position
	var isoPos = Global._pos_to_iso(position)
	var on_tile = CurrentMap.map[isoPos.y][isoPos.x]
	tile_tag = on_tile.tag
	if tile_tag == Tags.fl_empty:
		$Shadow.hide()
		$ShadowFar.show()
	else:
		$ShadowFar.hide()
		$Shadow.show()

func turn_into_water_wisp():
	CurrentMap.map_manager.replace_entity(self, Tags.et_water_wisp)

func _on_TerrainTimer_timeout():
	var isoPos = Global._pos_to_iso(position)
	var on_tile = CurrentMap.map[isoPos.y][isoPos.x]
	on_tile.sleeping_wisp_is_on(self)

func move_away_from_each_other():
	print("something")
	randomize()
	var pool = [-2,-1,0,1,2]
	pool.shuffle()
	var iso_pos = Global._pos_to_iso(position)
	dest_position = Global._iso_to_pos(iso_pos.x+pool[randi()%5], iso_pos.y+pool[randi()%5])

func _on_Wisp_area_entered(area):
	move_away_from_each_other()
