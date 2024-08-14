extends Node

@export var enemy: PackedScene
@export var gun_pickup_area: PackedScene
@export var guns_list: Array[PackedScene]

@onready var player: CharacterBody2D = $Player
@onready var marker_starting_position: Marker2D = $StartingPosition
@onready var enemy_spawn_location: PathFollow2D = $EnemyPath/EnemySpawnPath
@onready var weapon_spawn_position: Marker2D = $WeaponSpawnPosition


# Called when the node enters the scene tree for the first time.
func _ready():
	player.position = marker_starting_position.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_enemy_spawn_timer_timeout():
	# instantiate enemy
	var enemy_instance = enemy.instantiate()
	
	# set initial position and target
	enemy_spawn_location.progress_ratio = randf()
	enemy_instance.position = enemy_spawn_location.position
	enemy_instance.set_target_to_attack(player)
	
	# add to scene tree
	add_child(enemy_instance)
	

func _on_player_tree_exited():
	for child in get_children():
		child.queue_free()


func _on_weapon_spawn_timer_timeout():
	# create the gun
	var random_gun: Gun = guns_list[randi() % guns_list.size()].instantiate()
	random_gun.set_gun_user(player)
	
	# create the weapon
	var gun_pickup_area_instance: WeaponPickupArea = gun_pickup_area.instantiate() 
	gun_pickup_area_instance.initialise(random_gun, weapon_spawn_position.position)

	# add the weapon to the scene
	add_child(gun_pickup_area_instance)
