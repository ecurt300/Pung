extends Node2D

@export var ball_manager : Node2D
var lead: Vector2
var prevlead : Vector2
var error : float
var prev_error : float
var d : float
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	#randomize()
	
	randomize()

func calculate_lead(delta):

	
	
	if($Paddle.global_position.distance_to(ball_manager.game_ball.global_position ) < 700):
		var distance = (ball_manager.game_ball.global_position - $Paddle.global_position )
		var a = sqrt(ball_manager.game_ball.linear_velocity.length())
		var b = (distance.x)
		var c = (distance.y)
		
		var current_v = $Paddle.global_position.y

		var angle =  acos(pow(a,2) +pow( b ,2)-pow( c,2)/(2*a*b))
		
		var t = sqrt(pow(a,2) + pow(b,2) - 2* a*b * cos(angle))
		var direction = distance.normalized()
		
		var target =direction.y * t
		error = current_v - target
		prev_error = error
		var error_diff = (prev_error - error)/delta
		var d = error_diff * -0.07
		
		
		var penality = randf_range(-10,10)	
		
		return target  + (error_diff * 0.01) + d/ penality
	return 0


func _physics_process(delta):

	
	
	
	

		
	$Paddle.move_up_down(calculate_lead(delta) ,delta)
		


