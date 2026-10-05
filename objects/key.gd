extends Area3D

@onready var key = $CollisionShape3D
var player
@onready var click = $AudioStreamPlayer

func _ready():
	player = get_tree().get_first_node_in_group("player")

func interacted():
	player.got_key()
	click.play()
	key.disabled = true
	hide()
