extends Node2D

onready var floor_map = $"../Map/Floor"
onready var entities = $"../Map/Entities"
onready var packed_scenes = $MapGenerator/PackedScenes

func _ready():
	CurrentMap.map_manager = self

func get_tile(vector2):
	return CurrentMap.map[vector2.y][vector2.x]

func replace(tile_name, x, y):
	if x<CurrentMap.map.size() && y<CurrentMap.map.size() && x>=0 && y>=0:
		CurrentMap.map[y][x].queue_free()
		var new_tile = packed_scenes.generate_floor_tile(tile_name, x, y)
		CurrentMap.map[y][x] = new_tile
		floor_map.add_child(new_tile)
		new_tile.on_born()

func replace_entity(entity, entity_tag):
	var et_pos = Global._pos_to_iso(entity.position)
	var new_entity = packed_scenes.generate_entity(entity_tag, et_pos.x, et_pos.y)
	entity.queue_free()
	entities.add_child(new_entity)
