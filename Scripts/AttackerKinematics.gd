extends KinematicBody2D

# class member variables go here, for example:
var btn_right = false
var btn_left = false


var current_speed = Vector2(0,0)
var player_speed = GLOBALS.g_offense_spd
var left_boundary = GLOBALS.g_right_boundary #50
var right_boundary = GLOBALS.g_left_boundary #750
var hp = GLOBALS.g_offense_hp
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
	get_node("hp_bar").set_max(hp)
	shipPositionY = get_global_pos().y
	set_fixed_process(true)

func _fixed_process(delta):
	btn_right = Input.is_action_pressed("Attacker_right")
	btn_left = Input.is_action_pressed("Attacker_left")
	
	if btn_right:
		movement(player_speed)
	if btn_left:
		movement(-player_speed)

func collided(dmg=0):
	hp = hp - dmg
	check_alive()
	get_node("hp_bar").set_value(hp)
	
func check_alive():
	if (hp <= 0):
		#kill self
		get_parent().queue_free()
		#gameover scene
		get_tree().change_scene("res://Scenes/GameOver.xml")