extends Control

@onready var retry = $retry
@onready var home = $Home

func _ready() -> void:
	retry.pressed.connect(retry1)
	home.pressed.connect(home1)

func retry1():
	get_tree().change_scene_to_file("res://game/load_screen_2.tscn")

func home1():
	get_tree().change_scene_to_file("res://game/home_screen.tscn")
