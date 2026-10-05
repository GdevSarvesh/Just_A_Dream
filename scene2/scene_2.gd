extends Node3D

@onready var BM = $AudioStreamPlayer

func _ready() -> void:
	BM.play()
