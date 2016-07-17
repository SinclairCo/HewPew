
extends RigidBody2D

# member variables here, example:
# var a=2
# var b="textvar"

export var run_speed = 200

func _ready():
	set_fixed_process(true);
	pass

func _fixed_process(delta):
	var down = Input.is_action_pressed("move_down")
	var up = Input.is_action_pressed("move_up")
	var left = Input.is_action_pressed("move_left")
	var right = Input.is_action_pressed("move_right")
# more comments for conflicts set god = 0.0
	var direction = Vector2((right - left)*2, (down - up)*2)
	direction = direction.normalized()
	#no more conflicts
	#print(get_linear_velocity())
	if(abs(get_linear_velocity().x) < run_speed || abs(get_linear_velocity().x + direction.x) < abs(get_linear_velocity().x) ):
		apply_impulse(Vector2(0,0), direction*400*delta)
		#set_linear_velocity(direction*10)
	if(Input.is_action_pressed("jump") && get_colliding_bodies().size() > 0):
		print("jump")
		apply_impulse(Vector2(0,0), Vector2(0,-100))
#	set_rot(0);