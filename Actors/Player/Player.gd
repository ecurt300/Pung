extends Node2D

signal move(input, delta)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = (get_global_mouse_position() - get_child(0).position).normalized().angle()
	move.emit(direction,delta)


