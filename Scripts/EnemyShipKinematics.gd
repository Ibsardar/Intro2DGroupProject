
extends KinematicBody2D

var hp = 0

func _ready():
	hp = GLOBALS.g_enemy_hp
	get_node("EnemySprite/hp_bar").set_max(hp)
	set_process(true)
	
func _process(delta):
	pass
	
func collided(dmg=0):
	hp = hp - dmg
	check_alive()
	get_node("EnemySprite/hp_bar").set_value(hp)
	
func check_alive():
	if (hp <= 0):
		#kill self
		get_parent().get_parent().get_parent().queue_free()