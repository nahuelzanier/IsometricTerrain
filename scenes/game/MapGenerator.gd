extends Node2D

var floor_map
var entities

export (PackedScene) var floorDefault
export (PackedScene) var floorEmpty
export (PackedScene) var player

var map_test = [ [0,0,0,0,0,0,0,0,0],
				 [0,1,1,1,1,1,1,1,0],
				 [0,1,0,0,0,0,0,1,0],
				 [0,1,0,0,0,0,0,1,0],
				 [0,1,0,0,0,0,0,1,0],
				 [0,1,0,0,0,0,0,1,0],
				 [0,1,0,0,0,0,0,1,0],
				 [0,1,1,1,1,1,1,1,0],
				 [0,0,0,0,0,0,0,0,0] ]

func generate_floor_map(map):
	for y in range(map.size()):
		for x in range(map[y].size()):
			if map[y][x] == 0:
				var new_floor = floorDefault.instance()
				Global.move_to_coordinates(new_floor, x, y)
				map[y][x] = new_floor
				floor_map.add_child(new_floor)
			else:
				if map[y][x] == 1:
					var new_floor = floorEmpty.instance()
					Global.move_to_coordinates(new_floor, x, y)
					map[y][x] = new_floor
					floor_map.add_child(new_floor)

func generate_player(x, y):
	var new_player = player.instance()
	Global.move_to_coordinates(new_player, x, y)
	entities.add_child(new_player)

func generate_test():
	generate_floor_map(map_test)
	generate_player(4,4)

func remove(y, x):
	if x<map_test.size() && y<map_test.size() && x>=0 && y>=0:
		map_test[y][x].queue_free()
		var empty_tile = floorEmpty.instance()
		Global.move_to_coordinates(empty_tile, x, y)
		map_test[y][x] = empty_tile
		entities.add_child(empty_tile)
