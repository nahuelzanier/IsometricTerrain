extends Node2D

onready var floor_map = $"../../Map/Floor"
onready var entities = $"../../Map/Entities"
onready var packed_scenes = $PackedScenes

var current_map = [
['wal','wal','wal','wal','wal','wal','wal','wal','wal','wal','wal','wal','wal'],
['wal','def','def','def','def','def','def','def','def','def','def','def','wal'],
['wal','def','emp','emp','emp','emp','emp','emp','emp','emp','emp','def','wal'],
['wal','def','emp','def','def','def','def','def','def','def','emp','def','wal'],
['wal','def','emp','def','def','def','def','def','def','def','emp','def','wal'],
['wal','def','emp','def','def','h2o','h2o','h2o','def','def','emp','def','wal'],
['wal','def','emp','def','def','h2o','h2o','h2o','def','def','emp','def','wal'],
['wal','def','emp','def','def','h2o','h2o','h2o','def','def','emp','def','wal'],
['wal','def','emp','def','def','h2o','h2o','h2o','def','def','emp','def','wal'],
['wal','def','emp','def','def','def','def','def','def','def','emp','def','wal'],
['wal','def','emp','def','def','def','def','def','def','def','emp','def','wal'],
['wal','def','emp','emp','emp','emp','emp','emp','emp','emp','def','h2o','fou'],
['wal','def','def','def','def','def','def','def','def','def','def','def','wal'],
['wal','wal','wal','wal','wal','wal','wal','wal','wal','wal','wal','wal','wal']
]

func generate_floor_map(map):
	for y in range(map.size()):
		for x in range(map[y].size()):
			var new_floor = packed_scenes.generate_floor_tile(map[y][x], x, y)
			map[y][x] = new_floor
			floor_map.add_child(new_floor)
	CurrentMap.map = map

func generate_entity(entity, x, y):
	var new_entity = packed_scenes.generate_entity(entity, x, y)
	entities.add_child(new_entity)

func generate_test():
	generate_floor_map(current_map)
	generate_entity(Tags.et_player, 1, 1)
	generate_entity(Tags.et_water_wisp, 6, 6)
	generate_entity(Tags.et_water_wisp, 5, 6)
	generate_entity(Tags.et_water_wisp, 6, 7)
