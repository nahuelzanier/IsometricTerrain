extends RigidBody2D

export var speed = 2

func _physics_process(delta):
	var direction = Vector2(0,0)
	if Input.is_action_pressed("move_up"):
		direction.y = -1
	if Input.is_action_pressed("move_down"):
		direction.y = 1
	if Input.is_action_pressed("move_left"):
		direction.x = -1
	if Input.is_action_pressed("move_right"):
		direction.x = 1
	apply_central_impulse(direction*speed)

func _integrate_forces(state):
	rotation = 0
