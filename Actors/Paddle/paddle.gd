extends CharacterBody2D

@export var speed : float
@onready var collision = $CollisionShape2D
var half_height : float
var screen_half_height : float
var screen_height : float


func _ready():
	half_height = collision.shape.size.y * 0.5
	print(half_height)
	screen_height = get_viewport().size.y
	
#Paddle cannot move beyond the window
#Paddle moves up and down
#Paddle can either be controlled by the player or the AI
#Paddle is physics enabled

#Paddle movement is affected by a controller either AI or player
#Paddle moves on an up direction
#Paddle can hit ball no logic required

#Move Up_Down
	#Move Paddle based on direction of INPUT
	# use a signal to move the paddle with the direction as a paremeter
func move_up_down(input,delta):
	
	velocity =Vector2.DOWN * speed *  input * delta

#Clamp Paddle Position
#IF#Position.y + half_height > screen-height
	#Position.y = screen-height minus position.y 
	#IF Posiiton.y  - half_height < 0.0
	#Position.y = screen-height plus position.y 
func _clamp_paddle(delta):

	position.y = clamp(position.y,half_height,screen_height - half_height)
	
func _physics_process(delta):
	_clamp_paddle(delta)
	move_and_collide(velocity)
