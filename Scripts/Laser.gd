
extends Node2D


var height = 650
var width = 850
var speed = 1
var dmg = 1
var turn = 0
var otherCollider

func set_dmg(amt):
	dmg = amt
	
func set_spd(amt):
	speed = amt
	
func set_turn(amt):
	amt = deg2rad(amt)
	set_rot(amt)
	turn = amt

func checkCollisions():
	
	
	#Laser is colliding with an object
	if get_node("KinematicBody2D").is_colliding():
		#destroy the laser
		get_node(".").queue_free()
		
		#get the other object
		var otherCollider = get_node("KinematicBody2D").get_collider()
		
		#Call method from otherCollider to do an event like losing health
		otherCollider.collided(dmg)

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	#The laser is moving upwards & tilted
	var vec = Vector2(0,speed).rotated(turn)
	get_node("KinematicBody2D").move(vec)
	
	
	#The laser has left the outer boundary
	var y = get_node("KinematicBody2D").get_global_pos().y
	var x = get_node("KinematicBody2D").get_global_pos().x
	if y > height ||  \
	   y < -50 ||     \
	   x > width ||   \
	   x < -50:
		#this deletes the tree structure of Laser. 
		get_node(".").queue_free()
		
		
	checkCollisions()
	
	
	

	
	
