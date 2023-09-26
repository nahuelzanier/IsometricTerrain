extends Node2D

onready var sprite = $S

func update_sprite(x, y):
	sprite.hide()
	if x==0 && y<0:
		sprite = $N
	if x==0 && y>0:
		sprite = $S
	if x<0 && y==0:
		sprite = $W
	if x>0 && y==0:
		sprite = $E
	if x<0 && y<0:
		sprite = $NW
	if x<0 && y>0:
		sprite = $SW
	if x>0 && y<0:
		sprite = $NE
	if x>0 && y>0:
		sprite = $SE
	sprite.show()
