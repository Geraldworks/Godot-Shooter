class_name Gun extends Node2D

@export var bullet: PackedScene
@export var ammunition: int = 20
@export var gun_user: Node2D
@export var ammo_per_shot: int = 1

var original_ammunition: int

func _ready():
	original_ammunition = ammunition

func shoot() -> void:
	if ammunition < ammo_per_shot:
		print("you need to reload")
		return
	
	_shoot()
	
func _shoot():
	pass
	
func reload() -> void:
	ammunition = original_ammunition

func reduce_ammunition(ammunition_consumed: int) -> void:
	ammunition -= ammunition_consumed
	print(ammunition)

func compute_shooting_direction() -> Vector2:
	var mouse_position = get_viewport().get_mouse_position()
	return (mouse_position - gun_user.global_position).normalized()

func set_gun_user(player: CharacterBody2D):
	gun_user = player
