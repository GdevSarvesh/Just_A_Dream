extends Node3D

@onready var music = $AudioStreamPlayer
@onready var anim = $AnimationPlayer
@onready var L1 = $CanvasLayer/Control/Label
@onready var button = $CanvasLayer/Control/Home
@onready var baddream = $AudioStreamPlayer2

func _ready() -> void:
	anim.play("wake")
	button.pressed.connect(home1)
	baddream.play()

func label():
	L1.show()

func home():
	button.show()

func home1():
	get_tree().change_scene_to_file("res://game/home_screen.tscn")

func music1():
	music.play()
