extends StaticBody3D

@onready var anim = $AnimationPlayer
@onready var collision = $CollisionShape3D
var scene3
@onready var key = $key
@onready var click = $"../../click"

func interacted():
	key.show()
	collision.disabled = true
	anim.play("key")
	click.play()

func done():
	scene3.keyused()

func _ready():
	scene3 = get_tree().get_first_node_in_group("s3")
