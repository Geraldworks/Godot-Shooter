class_name Bullet extends CharacterBody2D

## instantiate bullets in the global space
## can create a manager class (facade) to help with this

@export var bullet_damage: float = 10.0

const SPEED = 500.0
var direction: Vector2

func _physics_process(delta):
	# does movement and detect collision
	var movement = direction * SPEED * delta
	var collision = move_and_collide(movement)
	
	# handles collision if any
	if collision: handle_collision(collision)
	
	remove_if_out_of_viewport()
	
func set_initial_position(initial_position: Vector2) -> void:
	position = initial_position
	
	
func set_direction(injected_direction: Vector2) -> void:
	direction = injected_direction

func remove_if_out_of_viewport() -> void:
	var viewport_rect: Vector2 = get_viewport_rect().size
	if (
		position.x < -50 or 
		position.y < -50 or 
		position.x > viewport_rect.x + 50 or 
		position.y > viewport_rect.y + 50
	): 
		queue_free()

func handle_collision(collision: KinematicCollision2D):
	var collider = collision.get_collider()
	
	if collider is ContactEnemy:
		collider.take_damage(self)
	
	queue_free()
	

