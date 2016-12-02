
extends StaticBody2D

var hp = GLOBALS.g_base_hp

func _ready():
	set_process(true)
	
func _process(delta):
	pass
	
func collided(dmg=0):
	hp = hp - dmg
	check_alive()
	get_node("hp_bar").set_value(hp)
	
func check_alive():
	if (hp <= 0):
		#kill self
		get_parent().queue_free()