extends CharacterBody3D

@onready var Attack_Sound = $AudioStreamPlayer3D
@onready var screme = $screme
var player
var gravity = 9.8
var speed = 7.0
@onready var anim = $green1/AnimationPlayer
var no_wall = false
@onready var ray = $RayCast3D
@onready var head = $green1/Skeleton3D/Cube_001
var is_alive = true

@onready var collision1 = $green1/Skeleton3D/BoneAttachment3D/Area3D/Head
@onready var collision2 = $CollisionShape3D
var state = "idle"
var play_idle = true
func _ready():
	player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	
	
	
	if is_on_floor():
		velocity.y = 0
	else:
		velocity.y = velocity.y - gravity * delta
	
	var distance = self.global_position.distance_to(player.global_position)
	var Pdirection = global_position.direction_to(player.global_position)
	
	
	var direction = -global_transform.basis.z
	var view = direction.dot(Pdirection)
	check_Wall()
	
	if distance <= 50.0 and view > 0.1 and no_wall and is_alive and distance > 2:
		look_at(player.global_position)
		velocity.x = Pdirection.x * speed
		velocity.z = Pdirection.z * speed
		state = "run"
		screme.play()
	elif distance <= 2 and is_alive:
		look_at(player.global_position)
		state = "attack"
		play_idle = false
	elif is_alive:
		velocity.x = 0.0
		velocity.z = 0.0
		state = "idle"
	
	if state == "run":
		anim.play("zrun")
	elif state == "attack":
		anim.play("zattack")
	elif state == "scream":
		anim.play("zscream")
	elif state == "die":
		anim.play("zdie")
	else:
		anim.play("idle")


	
	move_and_slide()
	
func check_Wall():
	ray.look_at(player.global_position)
	if ray.is_colliding():
		var body = ray.get_collider()
		if body.is_in_group("player"):
			#print("player detected")
			no_wall = true
			
		else:
			#print("player not detected")
			no_wall = false
			
func head_shot_die():
	is_alive = false
	state = "scream"
	collision1.disabled = true
	collision2.disabled = true

func die():
	is_alive = false
	state = "die"
	collision1.disabled = true
	collision2.disabled = true

func attack():
	player.got_enemy_attack()

func pause():
	set_physics_process(false)

func Attack_Sound1():
	Attack_Sound.play()
