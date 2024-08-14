class_name Pistol extends Gun

func _shoot():
	# determine where to shoot
	var bullet_direction = compute_shooting_direction()
	
	# reduce ammunition
	reduce_ammunition(ammo_per_shot)
	
	# set up the bullet
	var bullet_instance: Bullet = bullet.instantiate()
	bullet_instance.set_direction(bullet_direction)
	bullet_instance.set_initial_position(gun_user.global_position)
	
	# add the bullet to the global scene tree
	get_tree().current_scene.add_child(bullet_instance)
