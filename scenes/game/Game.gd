extends Node2D

onready var map_generator = $MapManager/MapGenerator

func _ready():
	map_generator.generate_test()
