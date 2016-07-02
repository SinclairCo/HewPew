
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_fixed_process(true);
	pass

func _fixed_process(delta):
	var down = Input.is_action_pressed("move_down")
	var up = Input.is_action_pressed("move_up")
	var left = Input.is_action_pressed("move_left")
	var right = Input.is_action_pressed("move_right")
	var direction = Vector2(right - left, down - up)
	direction = direction.normalized()
	if(direction.length()>0):
		set_linear_velocity(direction*10)
#	set_rot(0);