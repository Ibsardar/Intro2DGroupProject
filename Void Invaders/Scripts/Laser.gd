extends Node2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var height = 650
var speed = 5


func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	
func _fixed_process(delta):
	
	#The laser's is moving downwards using KinematicBody2D
	get_node("KinematicBody2D").move(Vector2(0,speed))
	
	
	#The laser reached a certain position on screen
	if get_node("KinematicBody2D").get_global_pos().y > height:
		#this deletes the tree structure of Laser. 
		get_node(".").queue_free()
		
