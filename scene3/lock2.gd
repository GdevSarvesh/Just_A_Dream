extends StaticBody3D

@onready var label1 = $"../CanvasLayer/Control/Label"
@onready var error = $"../Error"

func interacted():
	label1.show()
	error.play()
	await get_tree().create_timer(0.5).timeout
	label1.hide()
	
