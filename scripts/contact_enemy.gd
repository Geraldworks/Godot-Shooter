class_name ContactEnemy extends CharacterBody2D

@onready var health_component: HealthComponent = $HealthComponent

const SPEED: float = 250.0
var damage: float = 5.0
var target_to_attack: Node2D


func _physics_process(delta):
	var movement = delta * SPEED * determine_movement_direction_vector()
	var collision = move_and_collide(movement)
	
	if collision: handle_collision(collision)

func set_target_to_attack(target: Node2D):
	target_to_attack = target
	
func determine_movement_direction_vector() -> Vector2:
	return (target_to_attack.position - position).normalized()
	
func take_damage(bullet: Bullet) -> void:
	health_component.reduce_health(bullet.bullet_damage)
	
func handle_collision(collision: KinematicCollision2D):
	var collider = collision.get_collider()
	
	if collider is Player: collider.take_damage(self)
