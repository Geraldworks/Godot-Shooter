class_name WeaponPickupArea extends Area2D

var stored_gun: Gun

func _on_body_entered(body):
	if body is Player:
		body.replace_gun(stored_gun)
		queue_free()

func initialise(gun: Gun, initial_position: Vector2):
	stored_gun = gun
	position = initial_position
