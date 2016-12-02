
extends Node2D
var enemies = [preload("res://Scenes/EnemyShip.xml"),  \
               preload("res://Scenes/EnemyShip.xml"),  \
               preload("res://Scenes/EnemyShip2.xml")]
var enemy = null
var ticks = 0
var launch_interval = 60
var limit = 12
var count = 0

func _ready():
	set_process(true)
	
func _process(delta):
	launch_units(delta)
	
func random_type():
	var choice = randi()%3 # 0, 1, or 2
	print("Choice2: " + str(choice))
	enemy = enemies[choice]

func launch_units(t):
	if count <= limit:
		ticks += 1
		if ticks >= launch_interval:
			ticks = 0
			var u = random_unit()
			u.set_owner(self)
			add_child( u )
			count += 1

func random_unit():
	random_type()
	var e = enemy.instance()
	e.random_pick()
	return e