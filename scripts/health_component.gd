class_name HealthComponent extends Node2D

@export var health: float = 20

func reduce_health(health_deduction: float):
	health -= health_deduction
	remove_if_no_health()

func remove_if_no_health():
	if health <= 0: get_parent().queue_free()
