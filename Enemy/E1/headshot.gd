extends Area3D

@onready var head = $"../../Cube_001"
@onready var enemy = $"../../../.."
@onready var blood = $"../GPUParticles3D"

func _ready():
	blood.hide()
	

func got_headshot():
	head.hide()
	enemy.head_shot_die()
	blood.show()
