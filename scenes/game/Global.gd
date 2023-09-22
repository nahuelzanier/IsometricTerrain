extends Node

var ISO_WIDTH = 32
var ISO_HEIGHT = 16
var det = 1/(ISO_WIDTH*ISO_HEIGHT/4 + ISO_WIDTH*ISO_HEIGHT/4)

func move_to_coordinates(node, iso_x, iso_y):
	node.position = _iso_to_pos(iso_x, iso_y)

func _iso_to_pos(iso_x, iso_y):
	return Vector2(iso_x*ISO_WIDTH/2 - iso_y*ISO_WIDTH/2, 
				   iso_x*ISO_HEIGHT/2 + iso_y*ISO_HEIGHT/2)

func _pos_to_iso(vector2):
	return Vector2( int(vector2.x/ISO_WIDTH + vector2.y/ISO_HEIGHT),
					int(vector2.y/ISO_HEIGHT - vector2.x/ISO_WIDTH) ) 
