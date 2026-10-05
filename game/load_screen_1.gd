extends Control


func _ready():
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_file("res://scene1/scene_1.tscn")
