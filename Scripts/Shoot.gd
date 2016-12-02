extends Node2D

# class member variables go here, for example:
var firePressed = false
var laserObject = preload("res://Scenes/Laser.tscn")
var laserCount = 0
var laserOffset = 0
var bullet_speed = GLOBALS.g_offense_spd_bullet
var damage = GLOBALS.g_offense_dmg

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)

func _process(delta):
	
	#user pressed spacebar
	if Input.is_action_pressed("ui_select") and !firePressed:
		laserCount += 1
		
		#create a copy of the laser object
		var laserInstance = laserObject.instance()
		laserInstance.set_dmg(damage)
		laserInstance.set_spd(bullet_speed)
		
		
		#give the copy a name 
		laserInstance.set_name("Laser" + str(laserCount))
		
		
		
		#add a child
		add_child(laserInstance)
	
	
		laserInstance.set_owner(self)
		
		
		
		#set the position of the laser copy
		laserInstance.set_global_pos(get_node("KinematicBody2D/ShipSprite").get_global_pos() + Vector2(0,24))
	
		
		#make a collision exception with the attacker
		#get_node("Laser" + str(laserCount) + "/KinematicBody2D").add_collision_exception_with(get_node("KinematicBody2D"))
		
		
	#Check to see if user pressed the spacebar	
	firePressed = Input.is_action_pressed("ui_select")