extends Area2D

onready var dest_position = position #to stop it from moving
var tile_tag

func _ready():
	$TerrainTimer.start()
	var isoPos = Global._pos_to_iso(position)
	var on_tile = CurrentMap.map[isoPos.y][isoPos.x]
	tile_tag = on_tile.tag  #determines the current tile tag

func _process(delta):
	position = dest_position

func go_to_sleep():
	CurrentMap.map_manager.replace_entity(self, Tags.et_wisp)

func _on_TerrainTimer_timeout():
	var isoPos = Global._pos_to_iso(position)
	var on_tile = CurrentMap.map[isoPos.y][isoPos.x]
	on_tile.template_wisp_is_on(self)

func move_away_from_each_other(mult):
	pass

func _on_WispTemplate_area_entered(area):
	pass
