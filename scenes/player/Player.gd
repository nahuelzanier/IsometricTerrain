extends RigidBody2D

export var speed = 5
onready var sprites = $PlayerSprites
onready var lift_position = $LiftingPosition

func _physics_process(delta):
	if Input.is_action_just_pressed("grab"):
		lift()
	rotation = 0
	var direction = Vector2(0,0)
	if Input.is_action_pressed("move_up"):
		direction.y = -1
	if Input.is_action_pressed("move_down"):
		direction.y = 1
	if Input.is_action_pressed("move_left"):
		direction.x = -1
	if Input.is_action_pressed("move_right"):
		direction.x = 1
	sprites.update_sprite(direction.x, direction.y)
	apply_central_impulse(direction.normalized()*speed)

func grab_coords():
	return Global._pos_to_iso(position) + sprites.sprite.grab

func lift():
	var tile = CurrentMap.map_manager.get_tile(grab_coords())
	tile.get_lifted(self)

func grab_block(block):
	lift_position.block.queue_free()
	lift_position.add_child(block)
	lift_position.block = block
