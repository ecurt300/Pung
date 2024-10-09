extends Node2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = rad_to_deg((get_global_mouse_position() - get_child(0).position).normalized().angle())
	$Paddle.move_up_down(direction,delta)


