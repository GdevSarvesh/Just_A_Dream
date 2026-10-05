extends Node3D

@onready var bars = $bars2
@onready var BM = $AudioStreamPlayer
var key = 4
@onready var CutsceneCam = $Camera3D
var player
@onready var anim = $AnimationPlayer
@onready var anim2 = $female/AnimationPlayer
@onready var shot = $AudioStreamPlayer3D
@onready var mesile = $female/mesile
@onready var fire = $female/mesile/AnimationPlayer

@onready var scene4 = preload("res://scene4/scene_4.tscn")

func _ready():
	player = get_tree().get_first_node_in_group("player")
	anim2.play("CharacterArmature|Idle")
	BM.play()



func keyused():
	key -= 1
	print(key)
	if key == 0:
		print("done")
		pause()
		CutsceneCam.make_current()
		end()

func pause():
	player.set_physics_process(false)
	player.start()

func end():
	anim.play("open_bars")
	bars.play()
	

func end1():
	anim2.play("CharacterArmature|Idle_Gun",0.2)
	
func end2():
	anim2.play("CharacterArmature|Idle_Gun_Pointing",0.2)
func end3():
	anim2.play("CharacterArmature|Idle_Gun_Shoot",0.2)
	fire.play("fire")

func end4():
	print("finished")
	get_tree().change_scene_to_file("res://scene4/scene_4.tscn")
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func gunshot():
	shot.play()

func x1():
	mesile.show()
