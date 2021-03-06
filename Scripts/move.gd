extends KinematicBody2D

# class member variables go here, for example:
var btn_right = false
var btn_left = false


var current_speed = Vector2(0,0)
var player_speed = GLOBALS.g_defense_spd
var left_boundary = GLOBALS.g_right_boundary #50
var right_boundary = GLOBALS.g_left_boundary #750
var shipPositionY

	#set_linear_velocity(Vector2(current_speed.x,0))
func movement(speed):
	current_speed.x = speed
	
	#boundary for player 1 ------------------------------
	if get_global_pos().x > right_boundary:
		set_global_pos(Vector2(right_boundary,shipPositionY))
		
	if get_global_pos().x < left_boundary:
		set_global_pos(Vector2(left_boundary,shipPositionY))
	# ----------------------------------------------------
	

	move(current_speed)
	#translate(current_speed)
	
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	shipPositionY = get_global_pos().y

func _fixed_process(delta):
	btn_right = Input.is_action_pressed("Defender_right")
	btn_left = Input.is_action_pressed("Defender_left")
	
	if btn_right:
		movement(player_speed)
	if btn_left:
		movement(-player_speed)
		
func collided(dmg=0):
	#ignore bullet hits
	pass

