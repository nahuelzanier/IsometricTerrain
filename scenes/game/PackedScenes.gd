extends Node2D

export (PackedScene) var wallBase
export (PackedScene) var floorDefault
export (PackedScene) var floorEmpty
export (PackedScene) var waterFloor
export (PackedScene) var fountainFloor

export (PackedScene) var wall
export (PackedScene) var player
export (PackedScene) var wispBase
export (PackedScene) var wispWater

var tile_dict = {}
var entities_dict = {}

func _ready():
	tile_dict[Tags.fl_wall] = wallBase
	tile_dict[Tags.fl_default] = floorDefault
	tile_dict[Tags.fl_empty] = floorEmpty
	tile_dict[Tags.fl_water] = waterFloor
	tile_dict[Tags.fl_fountain] = fountainFloor
	entities_dict[Tags.et_wall] = wall
	entities_dict[Tags.et_player] = player
	entities_dict[Tags.et_wisp] = wispBase
	entities_dict[Tags.et_water_wisp] = wispWater

func generate_floor_tile(tile, x, y):
	var new_floor = tile_dict[tile].instance()
	new_floor.iso_x = x
	new_floor.iso_y = y
	Global.move_to_coordinates(new_floor, x, y)
	return new_floor

func generate_player(x, y):
	var new_player = entities_dict[Tags.et_player].instance()
	Global.move_to_coordinates(new_player, x, y)
	return new_player

func generate_entity(entity, x, y):
	var new_entity = entities_dict[entity].instance()
	Global.move_to_coordinates(new_entity, x, y)
	return new_entity
