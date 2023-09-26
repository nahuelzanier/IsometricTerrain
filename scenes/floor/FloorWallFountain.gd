extends KinematicBody2D

var iso_x
var iso_y
onready var tag = Tags.fl_fountain

func get_lifted(player): #called when player tries to lift the floor
	pass

func on_born(): #called when map manager replaces the tile
	pass

#TILES
func born_empty_tile(tile):
	CurrentMap.map_manager.replace(Tags.fl_water, tile.iso_x, tile.iso_y)

func born_water_tile(tile):
	pass

#WISPS
func moving_water_wisp(wisp):
	pass

func water_wisp_is_on(wisp):
	pass

func sleeping_wisp_is_on(wisp):
	pass
