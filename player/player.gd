extends CharacterBody3D

@onready var LC = $CanvasLayer/Control/Label2
@onready var RC = $CanvasLayer/Control/Label
@onready var canvas = $CanvasLayer
@onready var Pcam = $Camera3D
var key = 0.0
@onready var firepng = $Camera3D/gun/Revolver_2/fire
@onready var fire_sound = $AudioStreamPlayer3D
var health = 50.0
var speed = 5.0
@onready var ray = $Camera3D/RayCast3D
var has_gun = true
var is_alive = true
@onready var anim = $Camera3D/gun/AnimationPlayer
@onready var png1 = $CanvasLayer/Control/TextureRect
@onready var png2 = $CanvasLayer/Control/TextureRect2

func _physics_process(_delta):
	var input = Input.get_vector("A","D","W","S")
	
	var direction = transform.basis.x * input.x - transform.basis.z * -input.y
	
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	if Input.is_action_pressed("fire"):
		fire()
	if Input.is_action_pressed("interact"):
		interact()
	
	if health == 0.0:
		die()
		
	if key == 4:
		finish()
	png()
	move_and_slide()


func fire():
	if has_gun:
		anim.play("recoil")
		if ray.is_colliding():
			var object = ray.get_collider()
			if object.is_in_group("head"):
				object.got_headshot()
				print("headshot")
		else:
			print("aim missed")
	else:
		print("dont have gun")

func got_enemy_attack():
	if is_alive:
		health = health - 25

func die():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	print("die")
	get_tree().change_scene_to_file("res://game/died.tscn")
	is_alive = false

func firesound():
	fire_sound.play()
	
func firevisible():
	firepng.show()

func firenotvisible():
	firepng.hide()

func got_key():
	key = key + 1.0
	print(key)

func interact():
	if ray.is_colliding():
		var obj = ray.get_collider()
		if obj.is_in_group("key"):
			obj.interacted()
		if obj.is_in_group("bars"):
			obj.interacted()
		if obj.is_in_group("door"):
			obj.interacted()
		if obj.is_in_group("lock"):
			obj.interacted()
		if obj.is_in_group("lock2"):
			obj.interacted()

func png():
	png1.show()
	png2.hide()
	RC.hide()
	LC.show()
	if ray.is_colliding():
		var obj = ray.get_collider()
		if obj.is_in_group("key") or obj.is_in_group("bars") or obj.is_in_group("door") or obj.is_in_group("lock") or obj.is_in_group("lock2"):
			png1.hide()
			png2.show()
			RC.show()
			LC.hide()
	else:
		png2.hide()
		png1.show()
		RC.hide()
		LC.show()

func finish():
	get_tree().change_scene_to_file("res://game/load_screen_3.tscn")

func cut():
	Pcam.make_current()
	canvas.show()

func start():
	canvas.hide()
