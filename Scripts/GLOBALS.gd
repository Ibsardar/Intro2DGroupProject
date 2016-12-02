extends Node

###
### Store all the variables you want to be shared across
### scenes here.
###

# Scene tracking
var last_scene = "initial"
var saved_scene = null
var saved_subscene = null

# Side boundaries
var g_right_boundary = 50
var g_left_boundary = 750

# Current level
var g_current_level = 0

# Current score
var g_current_score = 0

# Defender's attributes
var g_defense_spd = 3

# Attacker's attributes
var g_offense_spd = 6
var g_offense_hp = 15
var g_offense_rate = 0
var g_offense_dmg = 1
var g_offense_spd_bullet = 5

# Moving enemy attributes
var g_enemy_spd = 4
var g_enemy_spd_bullet = 5
var g_enemy_hp = 5
var g_enemy_rate = 1
var g_enemy_dmg = 5

# Stationary enemy attributes
var g_turret_hp = 3
var g_turret_rate_fire = 0
var g_turret_rate_turn = 0
var g_turret_dmg = 3

# Enemy base attributes
var g_base_hp = 100

# Scene Pseudo Semaphores:
#-----------------------------------------
# saves current scene and loads a temporary scene
func P( interrupter ):
	# save scene and remove it from the tree,
	#	ultimately locking it's functionality
	GLOBALS.saved_scene = get_tree().get_current_scene()
	get_tree().get_root().remove_child( GLOBALS.saved_scene )
	# interrupt current scene
	var s = load(interrupter).instance()
	get_tree().get_root().add_child( s )
	get_tree().set_current_scene( s )

# loads the saved scene
func V():
	if GLOBALS.saved_scene != null:
        # free interrupting scene
        get_tree().get_current_scene().queue_free()
        # loadd saved scene back to the tree
        get_tree().get_root().add_child(GLOBALS.saved_scene)
        get_tree().set_current_scene( GLOBALS.saved_scene )
        GLOBALS.saved_scene = null
#-----------------------------------------
