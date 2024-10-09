extends Node
@export var Player1 : Node2D
@export var Player2 : Node2D
@export var ball : PackedScene

var game_ball : Node2D
var direction : Vector2
func _ready():
	spawn_ball()
#Spawn at center and randomize direction

func spawn_ball():
	#keep ball instance
	game_ball = ball.instantiate()
	add_child(game_ball)
	#set ball direction
	var x = -1
	var y = 1
	
	direction = Vector2(x,y)
	
	game_ball.linear_velocity += direction * 150

#Spawn at center 
func despawn_ball_and_score(paddle,paddle_name):
	
	if game_ball != null:
		direction = paddle.get_child(0).global_position.direction_to(game_ball.global_position)
		var behind_paddle = direction.dot(paddle.get_child(0).transform.x) <= 0
	
		if behind_paddle:
			if paddle_name == "Player1":
				GameController.player1_score =+ 1
			
				game_ball.queue_free()
				
				
			elif paddle_name == "Player2":
			
				GameController.player2_score =+ 1
				
				game_ball.queue_free()
			spawn_ball()
			
		
func _process(delta):
	despawn_ball_and_score(Player1,Player1.name)
	despawn_ball_and_score(Player2,Player2.name)

