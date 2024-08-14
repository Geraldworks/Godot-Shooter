class_name Player extends CharacterBody2D

@onready var gun: Gun = $Pistol
@onready var health_compoment: HealthComponent = $HealthComponent
@onready var iframe_timer: Timer = $IFrameTimer

const SPEED = 500.0

var is_invincible: bool = false

func _physics_process(_delta):
	var direction = determine_movement_direction_vector()
	velocity = direction * SPEED
	move_and_slide()
	clamp_player_position()

func _process(_delta):
	if Input.is_action_just_pressed("attack"):
		gun.shoot()
	if Input.is_action_just_pressed("reload"):
		gun.reload()
		
func clamp_player_position():
	position.x = clamp(position.x, 0, 1500)
	position.y = clamp(position.y, 0, 800)
		
func determine_movement_direction_vector():
	var vertical_direction = Input.get_axis("move_up", "move_down")
	var horizontal_direction = Input.get_axis("move_left", "move_right")
	return Vector2(horizontal_direction, vertical_direction).normalized()

func take_damage(enemy: ContactEnemy):
	if not is_invincible:
		health_compoment.reduce_health(enemy.damage)
		is_invincible = true
		iframe_timer.start()
		
func replace_gun(new_gun: Gun):
	# remove existing gun from scene tree
	gun.queue_free()
	
	# add 
	gun = new_gun
	add_child(new_gun)

func _on_i_frame_timer_timeout():
	is_invincible = false
