
extends Sprite

# member variables here, example:
# var a=2
# var b="textvar"

export var speed = 100
export var current_direction = Vector2(0,0);

func _ready():
	set_fixed_process(true);
	pass
	
func _fixed_process(delta):
	print("spam");
	var down = Input.is_action_pressed("move_down")
	var up = Input.is_action_pressed("move_up")
	var left = Input.is_action_pressed("move_left")
	var right = Input.is_action_pressed("move_right")
	var direction = Vector2(right - left, down - up)
	direction = direction.normalized()
	current_direction += direction*delta
	if(current_direction.length()>1):
		current_direction = current_direction.normalized()
	set_pos(get_pos()+current_direction*speed*delta)


