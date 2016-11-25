extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	self.set_process(true)
	pass
	
func _process(delta):
	var curPos = self.get_pos()
	if (Input.is_key_pressed(KEY_RIGHT)):
		curPos.x += 100 * delta
	if (Input.is_key_pressed(KEY_LEFT)):
		curPos.x += -100 * delta
	
	if(curPos.x > self.get_viewport_rect().size.width + self.get_item_rect().size.width/2):
		curPos = 0
	self.set_pos(curPos)
	