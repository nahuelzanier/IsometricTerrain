extends KinematicBody2D

var iso_x
var iso_y
onready var tag = Tags.fl_empty
export (PackedScene) var block

func get_lifted(player): #called when player tries to lift the floor
	var new_floor_tag = player.lift_position.block.unlift
	var new_block = block.instance()
	var grab = player.grab_coords()
	player.grab_block(new_block)
	CurrentMap.map_manager.replace(new_floor_tag, grab.x, grab.y)

func on_born(): #called when map manager replaces the tile
	for i in [1, -1]:
		CurrentMap.map[iso_y][iso_x + i].born_empty_tile(self)
		CurrentMap.map[iso_y + i][iso_x].born_empty_tile(self)

#TILES
func born_empty_tile(tile):
	pass

func born_water_tile(tile):
	CurrentMap.map_manager.replace(Tags.fl_water, iso_x, iso_y)

#WISPS
func moving_water_wisp(wisp):
	pass	

func water_wisp_is_on(wisp):
	if wisp.tile_tag != tag:
		wisp.tile_tag = tag
		wisp.try_to_move()
	else:
		wisp.go_to_sleep()

func sleeping_wisp_is_on(wisp):
	wisp.tile_tag = tag
