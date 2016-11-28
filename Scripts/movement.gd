extends KinematicBody2D

# class member variables go here, for example:
var btn_right = false
var btn_left = false


var current_speed = Vector2(0,0)
export var player_speed = 5


	#set_linear_velocity(Vector2(current_speed.x,0))
func movement(speed):
	current_speed.x = speed
	move(current_speed)
	get_node("ShipSprite").set_pos(get_pos())
	#translate(current_speed)
	
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	btn_right = Input.is_action_pressed("ui_right")
	btn_left = Input.is_action_pressed("ui_left")
	
	if btn_right:
		movement(player_speed)
	if btn_left:
		movement(-player_speed)