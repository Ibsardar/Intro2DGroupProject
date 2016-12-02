
extends Button

func _ready():
	set_process_input(true)
	


func _pressed():
	#change current scene to "WorldInterface.xml"
	print("Restart Game!")
	
	GLOBALS.last_scene = "start"
	get_tree().change_scene("res://Scenes/WorldInterface.xml")

