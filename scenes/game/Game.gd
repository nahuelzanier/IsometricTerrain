extends Node2D

onready var map_manager = $MapManager
onready var floor_map = $Map/Floor

func _ready():
	map_manager.floor_map = floor_map
	map_manager.entities = $Map/Entities
	map_manager.generate_test()

func _process(delta):
	if Input.is_action_just_pressed("left_click"):
		var mouse = Global._pos_to_iso(get_global_mouse_position())
		map_manager.remove(mouse.y, mouse.x)
