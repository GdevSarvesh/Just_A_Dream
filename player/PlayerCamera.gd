extends Camera3D

var sensitivity = 0.002
@onready var player = $".."
var value = 0.0


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		escape()
	if event is InputEventMouseMotion:
		var mouse = event.relative
		
		
		var y = -mouse.x * sensitivity
		player.rotate_y(y)
		
		value = value - mouse.y * sensitivity
		value = clamp(value, deg_to_rad(-90), deg_to_rad(90))
		
		rotation.x = value
		

func escape():
	if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
