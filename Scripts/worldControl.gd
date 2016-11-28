
extends Node2D

func _ready():
	set_process_input(true)
	
func _input(event):
	#go to start scene if "Q" pressed
	if (event.type == InputEvent.KEY):
        if (event.scancode == KEY_Q && event.pressed == false):
			# 'Q' key released
        	get_tree().change_scene("res://Scenes/Start.xml")
