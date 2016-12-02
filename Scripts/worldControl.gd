
extends TextureFrame

func _ready():
	# maybe load a paused game screen
	if GLOBALS.last_scene == "pause":
		GLOBALS.last_scene = ""
		GLOBALS.V()
	
	set_process_input(true)
	
func _input(event):
	if (event.type == InputEvent.KEY):
		# IF 'Q' key released
		if (event.scancode == KEY_Q && event.pressed == false):
			# re init all vars
			ResourceLoader.load("res://Scripts/GLOBALS.gd")
			# goto main menu
			get_tree().change_scene("res://Scenes/Start.xml")
			
		# IF 'P' key pressed
		if (event.scancode == KEY_P && event.pressed == false):
			GLOBALS.last_scene = "game"
			#save current scene and go to pause menu
			GLOBALS.P("res://Scenes/Pause.xml")