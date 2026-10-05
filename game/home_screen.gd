extends Node3D

@onready var BM = $AudioStreamPlayer
@onready var anim = $green1/AnimationPlayer
@onready var play = $CanvasLayer/Control/play
@onready var exit = $CanvasLayer/Control/exit

func _ready() -> void:
	anim.play("idle")
	play.pressed.connect(play1)
	exit.pressed.connect(exit1)
	BM.play()

func play1():
	get_tree().change_scene_to_file("res://game/load_screen_1.tscn")

func exit1():
	get_tree().quit()
