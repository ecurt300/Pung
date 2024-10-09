extends Node
# get current scene
# if current scene == start screen then we can quit or load the main scene
# if current scene == main then we can exit to start screen
var current_scene : String
var main_scene := preload("res://Assets/Screen/main.tscn").instantiate()
var start_screen := preload("res://Systems/start_screen.tscn").instantiate()
#refactor later
var player1_score: int
var player2_score: int
func _process(delta):
	current_scene = get_tree().get_current_scene().name

	if(current_scene == "Main") and Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene_to_file("res://Systems/start_screen.tscn")
		
	elif current_scene == "StartScreen" and Input.is_key_pressed(KEY_SPACE):
		get_tree().change_scene_to_file("res://Assets/Screen/main.tscn")
	elif current_scene == "StartScreen"	and Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
	
		
