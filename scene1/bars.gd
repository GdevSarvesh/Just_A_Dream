extends StaticBody3D

@onready var L1 = $"../cutscene/CanvasLayer/Control/1"
@onready var L2 = $"../cutscene/CanvasLayer/Control/2"
@onready var L3 = $"../cutscene/CanvasLayer/Control/3"
@onready var L4 = $"../cutscene/CanvasLayer/Control/4"
@onready var L5 = $"../cutscene/CanvasLayer/Control/5"
var label = 1
@onready var CutsceneCam = $"../cutscene/Camera3D"
var player
var play = false
@onready var BM = $"../AudioStreamPlayer"

func _ready():
	player = get_tree().get_first_node_in_group("player")
	BM.play()

func _process(_delta):
	if play:
		Labels()

func interacted():
	print("xyz")
	pause()
	CutsceneCam.make_current()
	play = true

func pause():
	player.set_physics_process(false)
	player.start()

func resume():
	player.set_physics_process(true)
	player.cut()


func Labels():
	if Input.is_action_just_pressed("enter"):
		label += 1
	if label==1:
		L1.show()
	elif label==2:
		L1.hide()
		L2.show()
	elif label==3:
		L2.hide()
		L3.show()
	elif label==4:
		L3.hide()
		L4.show()
	elif label==5:
		L4.hide()
		L5.show()
	elif label==6:
		L5.hide()
		resume()
