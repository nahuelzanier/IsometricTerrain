extends Node

var iso_x
var iso_y
onready var tag = Tags.fl_fountain
export (PackedScene) var block #The block that is created when floor is lifted

func get_lifted(player): #called when player tries to lift the floor
	pass

func on_born(): #called when map manager replaces the tile
	pass

#TILES
func born_empty_tile(tile): #called when an empty tile is born next to it
	pass

func born_water_tile(tile): #called when a water tile is born next to it
	pass

#WISPS
func moving_water_wisp(wisp): #what happens when a water wisp is trying to move into it
	pass

func water_wisp_is_on(wisp): #what happens to a water wisp when exposed to the tile
	pass

func sleeping_wisp_is_on(wisp): #what happens to a sleeping wisp exposed to the tile
	pass
